package maa.types

import maa.ffi.*

public enum Status <: ToString {
    Invalid | Pending | Running | Succeeded | Failed

    public static func fromC(status: Int32): Status {
        let s = UInt32(status)
        if (s == MaaStatusEnum_MaaStatus_Pending) {
            return Status.Pending
        } else if (s == MaaStatusEnum_MaaStatus_Running) {
            return Status.Running
        } else if (s == MaaStatusEnum_MaaStatus_Succeeded) {
            return Status.Succeeded
        } else if (s == MaaStatusEnum_MaaStatus_Failed) {
            return Status.Failed
        } else {
            return Status.Invalid
        }
    }

    public static func fromC(status: Int64): Status {
        return fromC(Int32(status))
    }

    public func toC(): Int32 {
        match (this) {
            case Pending => Int32(MaaStatusEnum_MaaStatus_Pending)
            case Running => Int32(MaaStatusEnum_MaaStatus_Running)
            case Succeeded => Int32(MaaStatusEnum_MaaStatus_Succeeded)
            case Failed => Int32(MaaStatusEnum_MaaStatus_Failed)
            case Invalid => Int32(MaaStatusEnum_MaaStatus_Invalid)
        }
    }

    public func isPending(): Bool {
        match (this) {
            case Pending => true
            case _ => false
        }
    }

    public func isRunning(): Bool {
        match (this) {
            case Running => true
            case _ => false
        }
    }

    public func isSucceeded(): Bool {
        match (this) {
            case Succeeded => true
            case _ => false
        }
    }

    public func isFailed(): Bool {
        match (this) {
            case Failed => true
            case _ => false
        }
    }

    public func isDone(): Bool {
        match (this) {
            case Succeeded | Failed | Invalid => true
            case _ => false
        }
    }

    public func toString(): String {
        match (this) {
            case Invalid => "Invalid"
            case Pending => "Pending"
            case Running => "Running"
            case Succeeded => "Succeeded"
            case Failed => "Failed"
        }
    }
}

public type JobStatus = Status

public enum LoggingLevel <: ToString {
    Off | Fatal | Error | Warn | Info | Debug | Trace | All

    public static func fromC(level: Int32): LoggingLevel {
        let l = UInt32(level)
        if (l == MaaLoggingLevelEnum_MaaLoggingLevel_Off) {
            return LoggingLevel.Off
        } else if (l == MaaLoggingLevelEnum_MaaLoggingLevel_Fatal) {
            return LoggingLevel.Fatal
        } else if (l == MaaLoggingLevelEnum_MaaLoggingLevel_Error) {
            return LoggingLevel.Error
        } else if (l == MaaLoggingLevelEnum_MaaLoggingLevel_Warn) {
            return LoggingLevel.Warn
        } else if (l == MaaLoggingLevelEnum_MaaLoggingLevel_Info) {
            return LoggingLevel.Info
        } else if (l == MaaLoggingLevelEnum_MaaLoggingLevel_Debug) {
            return LoggingLevel.Debug
        } else if (l == MaaLoggingLevelEnum_MaaLoggingLevel_Trace) {
            return LoggingLevel.Trace
        } else {
            return LoggingLevel.All
        }
    }

    public func toC(): Int32 {
        match (this) {
            case Off => Int32(MaaLoggingLevelEnum_MaaLoggingLevel_Off)
            case Fatal => Int32(MaaLoggingLevelEnum_MaaLoggingLevel_Fatal)
            case Error => Int32(MaaLoggingLevelEnum_MaaLoggingLevel_Error)
            case Warn => Int32(MaaLoggingLevelEnum_MaaLoggingLevel_Warn)
            case Info => Int32(MaaLoggingLevelEnum_MaaLoggingLevel_Info)
            case Debug => Int32(MaaLoggingLevelEnum_MaaLoggingLevel_Debug)
            case Trace => Int32(MaaLoggingLevelEnum_MaaLoggingLevel_Trace)
            case All => Int32(MaaLoggingLevelEnum_MaaLoggingLevel_All)
        }
    }

    public func toString(): String {
        match (this) {
            case Off => "Off"
            case Fatal => "Fatal"
            case Error => "Error"
            case Warn => "Warn"
            case Info => "Info"
            case Debug => "Debug"
            case Trace => "Trace"
            case All => "All"
        }
    }
}
