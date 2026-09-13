package maa.core

import maa.ffi.*
import std.sync.*
import std.collection.HashMap

public type EventCallback = (msg: String, detailsJson: String) -> Unit

@C
func globalEventCallbackDispatcher(
    handle: CPointer<Unit>,
    message: CString,
    detailsJson: CString,
    transArg: CPointer<Unit>
): Unit {
    if (transArg.isNull()) {
        return
    }
    let tokenPtr = CPointer<Int64>(transArg)
    let callbackId = unsafe { tokenPtr.read() }
    SinkManager.dispatch(callbackId, message, detailsJson)
}

internal class SinkManager {
    private static let mutex: Mutex = Mutex()
    private static var nextId: Int64 = 1
    private static let callbacks: HashMap<Int64, EventCallback> = HashMap<Int64, EventCallback>()

    public static func register(callback: EventCallback): (Int64, CPointer<Int64>) {
        synchronized(mutex) {
            let id = nextId
            nextId += 1
            callbacks[id] = callback
            let tokenPtr = unsafe { LibC.malloc<Int64>(count: 1) }
            unsafe { tokenPtr.write(id) }
            return (id, tokenPtr)
        }
    }

    public static func unregister(id: Int64, tokenPtr: CPointer<Int64>): Unit {
        synchronized(mutex) {
            callbacks.remove(id)
        }
        if (!tokenPtr.isNull()) {
            unsafe { LibC.free(tokenPtr) }
        }
    }

    public static func dispatch(callbackId: Int64, message: CString, detailsJson: CString): Unit {
        var optCb: Option<EventCallback> = None
        synchronized(mutex) {
            optCb = callbacks.get(callbackId)
        }
        match (optCb) {
            case Some(cb) =>
                let msg = if (message.isNull()) { "" } else { message.toString() }
                let details = if (detailsJson.isNull()) { "" } else { detailsJson.toString() }
                try {
                    cb(msg, details)
                } catch (_: Exception) {
                    // Prevent exception from leaking across C FFI boundary
                }
            case None => ()
        }
    }
}
