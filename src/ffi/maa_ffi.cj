package maa.ffi

public const MaaInvalidId: Int64 = 0
public const MaaAdbScreencapMethod_EncodeToFileAndPull: UInt64 = 1
public const MaaAdbScreencapMethod_Encode: UInt64 = 2
public const MaaAdbScreencapMethod_RawWithGzip: UInt64 = 4
public const MaaAdbScreencapMethod_RawByNetcat: UInt64 = 8
public const MaaAdbScreencapMethod_MinicapDirect: UInt64 = 16
public const MaaAdbScreencapMethod_MinicapStream: UInt64 = 32
public const MaaAdbScreencapMethod_EmulatorExtras: UInt64 = 64
public const MaaAdbScreencapMethod_None: UInt64 = 0
public const MaaAdbScreencapMethod_All: UInt64 = 18446744073709551615
public const MaaAdbScreencapMethod_Default: UInt64 = 18446744073709551559
public const MaaAdbInputMethod_AdbShell: UInt64 = 1
public const MaaAdbInputMethod_MinitouchAndAdbKey: UInt64 = 2
public const MaaAdbInputMethod_Maatouch: UInt64 = 4
public const MaaAdbInputMethod_EmulatorExtras: UInt64 = 8
public const MaaAdbInputMethod_None: UInt64 = 0
public const MaaAdbInputMethod_All: UInt64 = 18446744073709551615
public const MaaAdbInputMethod_Default: UInt64 = 18446744073709551607
public const MaaWin32ScreencapMethod_None: UInt64 = 0
public const MaaWin32ScreencapMethod_GDI: UInt64 = 1
public const MaaWin32ScreencapMethod_FramePool: UInt64 = 2
public const MaaWin32ScreencapMethod_DXGI_DesktopDup: UInt64 = 4
public const MaaWin32ScreencapMethod_DXGI_DesktopDup_Window: UInt64 = 8
public const MaaWin32ScreencapMethod_PrintWindow: UInt64 = 16
public const MaaWin32ScreencapMethod_ScreenDC: UInt64 = 32
public const MaaWin32ScreencapMethod_All: UInt64 = 18446744073709551615
public const MaaWin32ScreencapMethod_Foreground: UInt64 = 40
public const MaaWin32ScreencapMethod_Background: UInt64 = 18
public const MaaWin32InputMethod_None: UInt64 = 0
public const MaaWin32InputMethod_Seize: UInt64 = 1
public const MaaWin32InputMethod_SendMessage: UInt64 = 2
public const MaaWin32InputMethod_PostMessage: UInt64 = 4
public const MaaWin32InputMethod_LegacyEvent: UInt64 = 8
public const MaaWin32InputMethod_PostThreadMessage: UInt64 = 16
public const MaaWin32InputMethod_SendMessageWithCursorPos: UInt64 = 32
public const MaaWin32InputMethod_PostMessageWithCursorPos: UInt64 = 64
public const MaaWin32InputMethod_SendMessageWithWindowPos: UInt64 = 128
public const MaaWin32InputMethod_PostMessageWithWindowPos: UInt64 = 256
public const MaaWin32InputMethod_Interception: UInt64 = 512
public const MaaWin32InputMethod_AnchoredTouch: UInt64 = 1024
public const MaaMacOSScreencapMethod_None: UInt64 = 0
public const MaaMacOSScreencapMethod_ScreenCaptureKit: UInt64 = 1
public const MaaMacOSInputMethod_None: UInt64 = 0
public const MaaMacOSInputMethod_GlobalEvent: UInt64 = 1
public const MaaMacOSInputMethod_PostToPid: UInt64 = 2
public const MaaLinuxScreencapMethod_None: UInt64 = 0
public const MaaLinuxScreencapMethod_Wlr: UInt64 = 1
public const MaaLinuxScreencapMethod_ExtImage: UInt64 = 2
public const MaaLinuxScreencapMethod_PipeWire: UInt64 = 4
public const MaaLinuxInputMethod_None: UInt64 = 0
public const MaaLinuxInputMethod_Wlr: UInt64 = 1
public const MaaLinuxInputMethod_UInput: UInt64 = 2
public const MaaLinuxInputMethod_Libei: UInt64 = 4
public const MaaGamepadType_Xbox360: UInt64 = 0
public const MaaGamepadType_DualShock4: UInt64 = 1
public const MaaGamepadButton_A: Int64 = 4096
public const MaaGamepadButton_B: Int64 = 8192
public const MaaGamepadButton_X: Int64 = 16384
public const MaaGamepadButton_Y: Int64 = 32768
public const MaaGamepadButton_LB: Int64 = 256
public const MaaGamepadButton_RB: Int64 = 512
public const MaaGamepadButton_LEFT_THUMB: Int64 = 64
public const MaaGamepadButton_RIGHT_THUMB: Int64 = 128
public const MaaGamepadButton_START: Int64 = 16
public const MaaGamepadButton_BACK: Int64 = 32
public const MaaGamepadButton_GUIDE: Int64 = 1024
public const MaaGamepadButton_DPAD_UP: Int64 = 1
public const MaaGamepadButton_DPAD_DOWN: Int64 = 2
public const MaaGamepadButton_DPAD_LEFT: Int64 = 4
public const MaaGamepadButton_DPAD_RIGHT: Int64 = 8
public const MaaGamepadButton_CROSS: Int64 = 4096
public const MaaGamepadButton_CIRCLE: Int64 = 8192
public const MaaGamepadButton_SQUARE: Int64 = 16384
public const MaaGamepadButton_TRIANGLE: Int64 = 32768
public const MaaGamepadButton_L1: Int64 = 256
public const MaaGamepadButton_R1: Int64 = 512
public const MaaGamepadButton_L3: Int64 = 64
public const MaaGamepadButton_R3: Int64 = 128
public const MaaGamepadButton_OPTIONS: Int64 = 16
public const MaaGamepadButton_SHARE: Int64 = 32
public const MaaGamepadButton_PS: Int64 = 65536
public const MaaGamepadButton_TOUCHPAD: Int64 = 131072
public const MaaGamepadTouch_LeftStick: Int64 = 0
public const MaaGamepadTouch_RightStick: Int64 = 1
public const MaaGamepadTouch_LeftTrigger: Int64 = 2
public const MaaGamepadTouch_RightTrigger: Int64 = 3
public const MaaControllerFeature_None: Int64 = 0
public const MaaControllerFeature_UseMouseDownAndUpInsteadOfClick: UInt64 = 1
public const MaaControllerFeature_UseKeyboardDownAndUpInsteadOfClick: UInt64 = 2
public const MaaControllerFeature_NoScalingTouchPoints: UInt64 = 4

public type int_least64_t = Int64

public type uint_least64_t = UInt64

public type int_fast64_t = Int64

public type uint_fast64_t = UInt64

public type int_least32_t = Int32

public type uint_least32_t = UInt32

public type int_fast32_t = Int32

public type uint_fast32_t = UInt32

public type int_least16_t = Int16

public type uint_least16_t = UInt16

public type int_fast16_t = Int16

public type uint_fast16_t = UInt16

public type int_least8_t = Int8

public type uint_least8_t = UInt8

public type int_fast8_t = Int8

public type uint_fast8_t = UInt8

// C99 7.18.1.5 Greatest-width integer types.
public type intmax_t = Int64

public type uintmax_t = UInt64

public type MaaBool = UInt8

public type MaaSize = UInt64

public type MaaId = Int64

public type MaaCtrlId = MaaId

public type MaaResId = MaaId

public type MaaTaskId = MaaId

public type MaaRecoId = MaaId

public type MaaActId = MaaId

public type MaaNodeId = MaaId

public type MaaWfId = MaaId

public type MaaSinkId = MaaId

@C
public struct MaaStringBuffer {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaImageBuffer {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaStringListBuffer {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaImageListBuffer {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaResource {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaController {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaTasker {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaContext {
    init() {
        throw Exception("type should not be inited")
    }
}

public type MaaStatus = Int32

public const MaaStatusEnum_MaaStatus_Invalid: MaaStatusEnum = 0
public const MaaStatusEnum_MaaStatus_Pending: MaaStatusEnum = 1000
public const MaaStatusEnum_MaaStatus_Running: MaaStatusEnum = 2000
public const MaaStatusEnum_MaaStatus_Succeeded: MaaStatusEnum = 3000
public const MaaStatusEnum_MaaStatus_Failed: MaaStatusEnum = 4000

public type MaaStatusEnum = UInt32

public type MaaLoggingLevel = Int32

public const MaaLoggingLevelEnum_MaaLoggingLevel_Off: MaaLoggingLevelEnum = 0
public const MaaLoggingLevelEnum_MaaLoggingLevel_Fatal: MaaLoggingLevelEnum = 1
public const MaaLoggingLevelEnum_MaaLoggingLevel_Error: MaaLoggingLevelEnum = 2
public const MaaLoggingLevelEnum_MaaLoggingLevel_Warn: MaaLoggingLevelEnum = 3
public const MaaLoggingLevelEnum_MaaLoggingLevel_Info: MaaLoggingLevelEnum = 4
public const MaaLoggingLevelEnum_MaaLoggingLevel_Debug: MaaLoggingLevelEnum = 5
public const MaaLoggingLevelEnum_MaaLoggingLevel_Trace: MaaLoggingLevelEnum = 6
public const MaaLoggingLevelEnum_MaaLoggingLevel_All: MaaLoggingLevelEnum = 7

public type MaaLoggingLevelEnum = UInt32

public type MaaOption = Int32

public type MaaOptionValue = CPointer<Unit>

public type MaaOptionValueSize = UInt64

public type MaaGlobalOption = MaaOption

public const MaaGlobalOptionEnum_MaaGlobalOption_Invalid: MaaGlobalOptionEnum = 0

// Log dir
// value: string, eg: "C:\\Users\\Administrator\\Desktop\\log"; val_size: string length
public const MaaGlobalOptionEnum_MaaGlobalOption_LogDir: MaaGlobalOptionEnum = 1

// Whether to save draw
// value: bool, eg: true; val_size: sizeof(bool)
public const MaaGlobalOptionEnum_MaaGlobalOption_SaveDraw: MaaGlobalOptionEnum = 2

// Deprecated
// Dump all screenshots and actions
// Recording will evaluate to true if any of this or MaaCtrlOptionEnum::MaaCtrlOption_Recording is true.
// value: bool, eg: true; val_size: sizeof(bool)
// MaaGlobalOption_Recording = 3,
// The level of log output to stdout
// value: MaaLoggingLevel, val_size: sizeof(MaaLoggingLevel)
// default value is MaaLoggingLevel_Error
public const MaaGlobalOptionEnum_MaaGlobalOption_StdoutLevel: MaaGlobalOptionEnum = 4

// Deprecated
// Whether to show hit draw
// value: bool, eg: true; val_size: sizeof(bool)
// MaaGlobalOption_ShowHitDraw = 5,
// Whether to debug
// value: bool, eg: true; val_size: sizeof(bool)
public const MaaGlobalOptionEnum_MaaGlobalOption_DebugMode: MaaGlobalOptionEnum = 6

// Whether to save screenshot on error
// value: bool, eg: true; val_size: sizeof(bool)
public const MaaGlobalOptionEnum_MaaGlobalOption_SaveOnError: MaaGlobalOptionEnum = 7

// Image quality for draw images
// value: int, eg: 85; val_size: sizeof(int)
// default value is 85, range: [0, 100]
public const MaaGlobalOptionEnum_MaaGlobalOption_DrawQuality: MaaGlobalOptionEnum = 8

// Recognition image cache limit
// value: size_t, eg: 4096; val_size: sizeof(size_t)
// default value is 4096
public const MaaGlobalOptionEnum_MaaGlobalOption_RecoImageCacheLimit: MaaGlobalOptionEnum = 9

public type MaaGlobalOptionEnum = UInt32

public type MaaResOption = MaaOption

public type MaaInferenceDevice = Int32

public type MaaInferenceExecutionProvider = Int32

public const MaaInferenceDeviceEnum_MaaInferenceDevice_CPU: MaaInferenceDeviceEnum = -2
public const MaaInferenceDeviceEnum_MaaInferenceDevice_Auto: MaaInferenceDeviceEnum = -1
public const MaaInferenceDeviceEnum_MaaInferenceDevice_0: MaaInferenceDeviceEnum = 0
public const MaaInferenceDeviceEnum_MaaInferenceDevice_1: MaaInferenceDeviceEnum = 1

public type MaaInferenceDeviceEnum = Int32

// I don't recommend setting up MaaResOption_InferenceDevice in this case,
// because you don't know which EP will be used on different user devices.
public const MaaInferenceExecutionProviderEnum_MaaInferenceExecutionProvider_Auto: MaaInferenceExecutionProviderEnum = 0

// MaaResOption_InferenceDevice will not work.
public const MaaInferenceExecutionProviderEnum_MaaInferenceExecutionProvider_CPU: MaaInferenceExecutionProviderEnum = 1

// MaaResOption_InferenceDevice will be used to set adapter id,
// It's from Win32 API `EnumAdapters1`.
public const MaaInferenceExecutionProviderEnum_MaaInferenceExecutionProvider_DirectML: MaaInferenceExecutionProviderEnum = 2

// MaaResOption_InferenceDevice will be used to set coreml_flag,
// Reference to
// https://github.com/microsoft/onnxruntime/blob/main/include/onnxruntime/core/providers/coreml/coreml_provider_factory.h
// But you need to pay attention to the onnxruntime version we use, the latest flag may not be supported.
public const MaaInferenceExecutionProviderEnum_MaaInferenceExecutionProvider_CoreML: MaaInferenceExecutionProviderEnum = 3

// MaaResOption_InferenceDevice will be used to set NVIDIA GPU ID
// TODO!
public const MaaInferenceExecutionProviderEnum_MaaInferenceExecutionProvider_CUDA: MaaInferenceExecutionProviderEnum = 4

public type MaaInferenceExecutionProviderEnum = UInt32

public const MaaResOptionEnum_MaaResOption_Invalid: MaaResOptionEnum = 0

// Use the specified inference device.
// Please set this option before loading the model.
// value: MaaInferenceDevice, eg: 0; val_size: sizeof(MaaInferenceDevice)
// default value is MaaInferenceDevice_Auto
public const MaaResOptionEnum_MaaResOption_InferenceDevice: MaaResOptionEnum = 1

// Use the specified inference execution provider
// Please set this option before loading the model.
// value: MaaInferenceExecutionProvider, eg: 0; val_size: sizeof(MaaInferenceExecutionProvider)
// default value is MaaInferenceExecutionProvider_Auto
public const MaaResOptionEnum_MaaResOption_InferenceExecutionProvider: MaaResOptionEnum = 2

public type MaaResOptionEnum = UInt32

public type MaaCtrlOption = MaaOption

public const MaaCtrlOptionEnum_MaaCtrlOption_Invalid: MaaCtrlOptionEnum = 0

// Only one of long and short side can be set, and the other is automatically scaled according to the aspect ratio.
// value: int, eg: 1280; val_size: sizeof(int)
public const MaaCtrlOptionEnum_MaaCtrlOption_ScreenshotTargetLongSide: MaaCtrlOptionEnum = 1

// Only one of long and short side can be set, and the other is automatically scaled according to the aspect ratio.
// value: int, eg: 720; val_size: sizeof(int)
public const MaaCtrlOptionEnum_MaaCtrlOption_ScreenshotTargetShortSide: MaaCtrlOptionEnum = 2

// Screenshot use raw size without scaling.
// Please note that this option may cause incorrect coordinates on user devices with different resolutions if scaling is not performed.
// value: bool, eg: true; val_size: sizeof(bool)
public const MaaCtrlOptionEnum_MaaCtrlOption_ScreenshotUseRawSize: MaaCtrlOptionEnum = 3

// Enable or disable mouse-lock-follow mode for Win32 controllers.
// This is designed for TPS/FPS games that lock the mouse to their window in the background.
// Only valid for Win32 controllers using message-based input methods.
// value: bool, eg: true; val_size: sizeof(bool)
public const MaaCtrlOptionEnum_MaaCtrlOption_MouseLockFollow: MaaCtrlOptionEnum = 4

// Deprecated
// Dump all screenshots and actions
// Recording will evaluate to true if any of this or
// MaaGlobalOptionEnum::MaaGlobalOption_Recording is true.
// value: bool, eg: true; val_size: sizeof(bool)
// MaaCtrlOption_Recording = 5,
// Set the interpolation method used when resizing screenshots.
// Value corresponds to cv::InterpolationFlags:
//   INTER_NEAREST=0, INTER_LINEAR=1, INTER_CUBIC=2, INTER_AREA=3, INTER_LANCZOS4=4
// Default is INTER_AREA (3).
// value: int, eg: 3; val_size: sizeof(int)
public const MaaCtrlOptionEnum_MaaCtrlOption_ScreenshotResizeMethod: MaaCtrlOptionEnum = 6

// Configure background managed key domain for Win32 controllers.
// Must be set before connection. After setting, matching ClickKey / LongPressKey / KeyDown / KeyUp
// operations automatically route through the background guardian path.
// Only supported by Win32 controllers; other controllers will fail.
// value: int32_t array of virtual key codes; val_size: sizeof(int32_t) * count
public const MaaCtrlOptionEnum_MaaCtrlOption_BackgroundManagedKeys: MaaCtrlOptionEnum = 7

// Scale screenshot to fit a reference (width, height) using Unity Canvas
// Scaler "Expand" semantics: scale = max(W / raw_width, H / raw_height),
// applied uniformly to both axes so the source aspect ratio is preserved
// and both output dimensions are >= the reference (W, H).
// Mutually exclusive with ScreenshotTargetLongSide / ScreenshotTargetShortSide;
// setting any of these resets the others. Ignored when ScreenshotUseRawSize is true.
// value: int32_t[2] = { width, height }; val_size: sizeof(int32_t) * 2
public const MaaCtrlOptionEnum_MaaCtrlOption_ScreenshotTargetExpand: MaaCtrlOptionEnum = 8

// @brief Option keys for controller instance options. See MaaControllerSetOption().
public type MaaCtrlOptionEnum = UInt32

public type MaaTaskerOption = MaaOption

public const MaaTaskerOptionEnum_MaaTaskerOption_Invalid: MaaTaskerOptionEnum = 0

public type MaaTaskerOptionEnum = UInt32

// MaaAdbScreencapMethod:
// /**
// * @brief Adb screencap method flags
// *
// * Use bitwise OR to set the methods you need.
// * MaaFramework will test all provided methods and use the fastest available one.
// *
// * Default: All methods except RawByNetcat, MinicapDirect, MinicapStream
// *
// * Note: MinicapDirect and MinicapStream use lossy JPEG encoding, which may
// * significantly reduce template matching accuracy. Not recommended.
// *
// * | Method                | Speed      | Compatibility | Encoding | Notes                             |
// * |-----------------------|------------|---------------|----------|-----------------------------------|
// * | EncodeToFileAndPull   | Slow       | High          | Lossless |                                   |
// * | Encode                | Slow       | High          | Lossless |                                   |
// * | RawWithGzip           | Medium     | High          | Lossless |                                   |
// * | RawByNetcat           | Fast       | Low           | Lossless |                                   |
// * | MinicapDirect         | Fast       | Low           | Lossy    |                                   |
// * | MinicapStream         | Very Fast  | Low           | Lossy    |                                   |
// * | EmulatorExtras        | Very Fast  | Low           | Lossless | Emulators only: MuMu 12, LDPlayer 9 |
// */
public type MaaAdbScreencapMethod = UInt64

// MaaAdbInputMethod:
// /**
// * @brief Adb input method flags
// *
// * Use bitwise OR to set the methods you need.
// * MaaFramework will select the first available method according to priority.
// *
// * Priority (high to low): EmulatorExtras > Maatouch > MinitouchAndAdbKey > AdbShell
// *
// * Default: All methods except EmulatorExtras
// *
// * | Method               | Speed | Compatibility | Notes                                 |
// * |----------------------|-------|---------------|---------------------------------------|
// * | AdbShell             | Slow  | High          |                                       |
// * | MinitouchAndAdbKey   | Fast  | Medium        | Key press still uses AdbShell         |
// * | Maatouch             | Fast  | Medium        |                                       |
// * | EmulatorExtras       | Fast  | Low           | Emulators only: MuMu 12               |
// */
public type MaaAdbInputMethod = UInt64

// MaaWin32ScreencapMethod:
// /**
// * @brief Win32 screencap method flags
// *
// * Use bitwise OR to set the methods you need.
// * MaaFramework will test all provided methods and use the fastest available one.
// *
// * No default value. Client should choose one as default.
// *
// * Predefined combinations:
// * - Foreground: DXGI_DesktopDup_Window | ScreenDC
// * - Background: FramePool | PrintWindow
// *
// * Different applications use different rendering methods, there is no universal solution.
// *
// * | Method                  | Speed     | Compatibility | Require Admin | Background Support | Notes                            |
// * |-------------------------|-----------|---------------|---------------|--------------------|----------------------------------|
// * | GDI                     | Fast      | Medium        | No            | No                 |                                  |
// * | FramePool               | Very Fast | Medium        | No            | Yes                | Requires Windows 10 1903+        |
// * | DXGI_DesktopDup         | Very Fast | Low           | No            | No                 | Desktop duplication (full screen)|
// * | DXGI_DesktopDup_Window  | Very Fast | Low           | No            | No                 | Desktop duplication then crop    |
// * | PrintWindow             | Medium    | Medium        | No            | Yes                |                                  |
// * | ScreenDC                | Fast      | High          | No            | No                 |                                  |
// *
// * Note: FramePool and PrintWindow support pseudo-minimize — when the target window
// * is minimized, they make it transparent and click-through, then restore it without
// * activation, allowing screencap to continue without disturbing the user.
// * Other screencap methods will fail when the target window is minimized.
// */
public type MaaWin32ScreencapMethod = UInt64

// MaaWin32InputMethod:
// /**
// * @brief Win32 input method
// *
// * No bitwise OR, select ONE method only.
// *
// * No default value. Client should choose one as default.
// *
// * Different applications process input differently, there is no universal solution.
// *
// * | Method                       | Compatibility | Require Admin | Seize Mouse | Background Support | Notes |
// * |------------------------------|---------------|---------------|-------------|--------------------|-------------------------------------------------------------|
// * | Seize                        | High          | No            | Yes         | No                 | | | SendMessage                  |
// * Medium        | Maybe         | No          | Yes                |                                                             | |
// * PostMessage                  | Medium        | Maybe         | No          | Yes                | | | LegacyEvent                  | Low
// * | No            | Yes         | No                 |                                                             | | PostThreadMessage |
// * Low           | Maybe         | No          | Yes                | Deprecated                                                  | |
// * SendMessageWithCursorPos     | Medium        | Maybe         | Briefly     | Yes                | Moves cursor to target position, then
// * restores              | | PostMessageWithCursorPos     | Medium        | Maybe         | Briefly     | Yes                | Moves cursor
// * to target position, then restores              | | SendMessageWithWindowPos     | Medium        | Maybe         | No          | Yes |
// * Moves window to align target with cursor, then restores     | | PostMessageWithWindowPos     | Medium        | Maybe         | No | Yes
// * | Moves window to align target with cursor, then restores     | | Interception                 | Medium        | Yes           | No | No
// * | Driver-level input injection via the Interception driver    | | AnchoredTouch                | Medium        | Maybe         | No
// * | Yes                | Injects synthetic touch points, never moves the cursor       |
// *
// * Note:
// * - Admin rights mainly depend on the target application's privilege level.
// *   If the target runs as admin, MaaFramework should also run as admin for compatibility.
// * - "WithCursorPos" methods briefly move the cursor to target position, send message,
// *   then restore cursor position. This "briefly" seizes the mouse but won't block user operations.
// * - "WithWindowPos" methods briefly move the window so the target aligns with the current cursor
// *   position, send message, then restore the window position. The cursor is not moved.
// * - "AnchoredTouch" injects synthetic touch points, the target window receives WM_POINTER messages.
// *   The cursor is never moved and the foreground window is never changed. Since synthetic pointers
// *   are dispatched by desktop Z-order, the target window is briefly raised to topmost while
// *   the target point is occluded, and restored once all contacts are released. If raising does not
// *   take effect, the operation fails instead of injecting into the window that occludes the target.
// *   Raising requires WS_EX_LAYERED on the target window, which is added on the first raise, verified
// *   before every raise, and removed when the controller goes idle unless another module is relying on
// *   that layered state by then. If the style cannot be kept or the
// *   opacity cannot be lowered, the operation fails rather than raising the target window visibly.
// *   Windows layered via UpdateLayeredWindow are not supported. CS_OWNDC / CS_CLASSDC window classes
// *   are documented as incompatible with WS_EX_LAYERED, but that restriction does not always hold in
// *   practice, so such classes only produce a warning and the actual API results decide.
// *   A minimized target window is not supported and the operation fails, since its client area is
// *   off-screen and raising does not change that. Screencap methods with pseudo-minimize take the
// *   window out of that state before every capture, so this does not occur with them.
// *   WS_EX_TRANSPARENT is temporarily removed while the window is borrowed, since it lets input pass
// *   through to the windows underneath. Because the screencap side writes the same window state,
// *   the borrowed attributes are verified before being restored, and left alone once taken over.
// *   Clicking and swiping only. Keyboard can be routed to another method, but scroll cannot:
// *   it always goes through the mouse method and a synthetic touch device has no wheel.
// */
public type MaaWin32InputMethod = UInt64

// MaaMacOSScreencapMethod:
// /**
// * @brief macOS screencap method
// *
// * Select ONE method only.
// *
// * | Method          | Description                                    |
// * |-----------------|------------------------------------------------|
// * | ScreenCaptureKit| Modern macOS screencap using ScreenCaptureKit  |
// */
public type MaaMacOSScreencapMethod = UInt64

// MaaMacOSInputMethod:
// /**
// * @brief macOS input method
// *
// * Select ONE method only.
// *
// * | Method          | Description                                    |
// * |-----------------|------------------------------------------------|
// * | GlobalEvent     | Injects into the global HID event stream via CGEventPost(kCGHIDEventTap), dispatched by the OS to the front window |
// * | PostToPid       | Directly send to target process using CGEventPostToPid |
// */
public type MaaMacOSInputMethod = UInt64

// MaaLinuxScreencapMethod:
// /**
// * @brief Linux Screencap method
// *
// * Select ONE method only.
// *
// * | Method          | Description                                                              |
// * |-----------------|--------------------------------------------------------------------------|
// * | Wlr             | Screencap using `wlr-screencopy-unstable-v1` protocol                    |
// * | PipeWire        | Screencap using PipeWire (portal fd or session-daemon node)              |
// */
public type MaaLinuxScreencapMethod = UInt64

// MaaLinuxInputMethod:
// /**
// * @brief Linux Input method
// *
// * Select ONE method only.
// *
// * | Method          | Description                                                                               |
// * |-----------------|-------------------------------------------------------------------------------------------|
// * | Wlr             | Input using `virtual-keyboard-unstable-v1` and `wlr-virtual-pointer-unstable-v1` protocol |
// * | UInput          | Input using `/dev/uinput`                                                                 |
// * | Libei           | Input using libei (EIS socket, e.g. the one provided by gamescope)                        |
// */
public type MaaLinuxInputMethod = UInt64

// MaaGamepadType:
// /**
// * @brief Virtual gamepad type
// *
// * Select ONE type only.
// *
// * | Type          | Description                                    |
// * |---------------|------------------------------------------------|
// * | Xbox360       | Microsoft Xbox 360 Controller (wired)          |
// * | DualShock4    | Sony DualShock 4 Controller (wired)            |
// */
public type MaaGamepadType = UInt64

// MaaGamepadButton:
// /**
// * @brief Virtual gamepad button codes for click_key/key_down/key_up
// *
// * Use these values with MaaControllerPostClickKey, MaaControllerPostKeyDown, MaaControllerPostKeyUp.
// * Values are based on XUSB (Xbox 360) button flags. DS4 face buttons are mapped to Xbox equivalents.
// *
// * Xbox 360 buttons:
// *
// * | Value   | Button              | Description            |
// * |---------|---------------------|------------------------|
// * | 0x1000  | A                   | A button               |
// * | 0x2000  | B                   | B button               |
// * | 0x4000  | X                   | X button               |
// * | 0x8000  | Y                   | Y button               |
// * | 0x0100  | LB (Left Shoulder)  | Left bumper            |
// * | 0x0200  | RB (Right Shoulder) | Right bumper           |
// * | 0x0040  | L_THUMB             | Left stick click       |
// * | 0x0080  | R_THUMB             | Right stick click      |
// * | 0x0010  | START               | Start button           |
// * | 0x0020  | BACK                | Back button            |
// * | 0x0400  | GUIDE               | Guide/Home button      |
// * | 0x0001  | DPAD_UP             | D-pad up               |
// * | 0x0002  | DPAD_DOWN           | D-pad down             |
// * | 0x0004  | DPAD_LEFT           | D-pad left             |
// * | 0x0008  | DPAD_RIGHT          | D-pad right            |
// *
// * DualShock 4 buttons (aliases to Xbox buttons):
// *
// * | Value   | Button    | Xbox Equivalent | Description               |
// * |---------|-----------|-----------------|---------------------------|
// * | 0x1000  | CROSS     | A                   | Cross (X) button          |
// * | 0x2000  | CIRCLE    | B                   | Circle button             |
// * | 0x4000  | SQUARE    | X                   | Square button             |
// * | 0x8000  | TRIANGLE  | Y                   | Triangle button           |
// * | 0x0100  | L1        | LB                  | L1 button                 |
// * | 0x0200  | R1        | RB                  | R1 button                 |
// * | 0x0040  | L3        | L_THUMB             | Left stick click          |
// * | 0x0080  | R3        | R_THUMB             | Right stick click         |
// * | 0x0010  | OPTIONS   | START               | Options button            |
// * | 0x0020  | SHARE     | BACK                | Share button              |
// * | 0x10000 | PS        | -                   | PS button (DS4 special)   |
// * | 0x20000 | TOUCHPAD  | -                   | Touchpad click (DS4 only) |
// */
public type MaaGamepadButton = UInt64

// MaaGamepadTouch:
// /**
// * @brief Virtual gamepad touch contact definitions for touch_down/touch_move/touch_up
// *
// * For gamepad controller, the touch functions are repurposed for analog inputs:
// * - x, y: Analog stick position
// * - pressure: Trigger value (0~255)
// *
// * Contact mapping:
// *
// * | Contact | Input           | x range     | y range     | pressure   | Description                    |
// * |---------|-----------------|-------------|-------------|------------|--------------------------------|
// * | 0       | Left Stick      | -32768~32767| -32768~32767| ignored    | Left analog stick X/Y position |
// * | 1       | Right Stick     | -32768~32767| -32768~32767| ignored    | Right analog stick X/Y position|
// * | 2       | Left Trigger    | ignored     | ignored     | 0~255      | Left trigger (LT/L2) value     |
// * | 3       | Right Trigger   | ignored     | ignored     | 0~255      | Right trigger (RT/R2) value    |
// *
// * Usage:
// * - touch_down(contact, x, y, pressure): Start analog input
// * - touch_move(contact, x, y, pressure): Update analog input position/value
// * - touch_up(contact): Release/reset analog input to center/zero
// */
public type MaaGamepadTouch = UInt64

// Controller feature flags returned by get_features().
// These flags indicate which input methods the controller supports/prefers.
public type MaaControllerFeature = UInt64

@C
public struct MaaRect {
    public var x: Int32
    public var y: Int32
    public var width: Int32
    public var height: Int32
    public init(x: Int32, y: Int32, width: Int32, height: Int32) {
        this.x = x
        this.y = y
        this.width = width
        this.height = height
    }
}

@When[debug]
let _ = {
    =>
        let size = sizeOf<MaaRect>()
        if (size != 16) {
            throw Exception("Size of MaaRect is not 16 but ${size} bytes")
        }
        let align = alignOf<MaaRect>()
        if (align != 4) {
            throw Exception("Alignment of MaaRect is not 4 but ${align} bytes")
        }
}

// Deprecated, use MaaEventCallback instead
public type MaaNotificationCallback = CFunc<(message: CString, details_json: CString, notify_trans_arg: CPointer<Unit>) -> Unit>

// void* handle:
// - MaaTasker* for MaaTasker event
// - MaaResource* for MaaResource event
// - MaaController* for MaaController event
// - MaaContext* for MaaContext event
public type MaaEventCallback = CFunc<(handle: CPointer<Unit>, message: CString, details_json: CString, trans_arg: CPointer<Unit>) -> Unit>

public type MaaCustomRecognitionCallback = CFunc<(context: CPointer<MaaContext>, task_id: MaaTaskId, node_name: CString,
    custom_recognition_name: CString, custom_recognition_param: CString, image: CPointer<MaaImageBuffer>, roi: CPointer<MaaRect>,
    trans_arg: CPointer<Unit>, out_box: CPointer<MaaRect>, out_detail: CPointer<MaaStringBuffer>) -> MaaBool>

public type MaaCustomActionCallback = CFunc<(context: CPointer<MaaContext>, task_id: MaaTaskId, node_name: CString,
    custom_action_name: CString, custom_action_param: CString, reco_id: MaaRecoId, box: CPointer<MaaRect>, trans_arg: CPointer<Unit>) -> MaaBool>

// @param[in] value
foreign func MaaGlobalSetOption(key: MaaGlobalOption, value: MaaOptionValue, val_size: MaaOptionValueSize): MaaBool

// @param[in] value
public unsafe func MaaGlobalSetOption_wrap(key: MaaGlobalOption, value: MaaOptionValue, val_size: MaaOptionValueSize): MaaBool {
    return MaaGlobalSetOption(key, value, val_size)
}

// load a plugin with full path or name only, name only will search in system directory and current directory
// or
// load plugins with recursive search in the directory
foreign func MaaGlobalLoadPlugin(library_path: CString): MaaBool

// load a plugin with full path or name only, name only will search in system directory and current directory
// or
// load plugins with recursive search in the directory
public unsafe func MaaGlobalLoadPlugin_wrap(library_path: CString): MaaBool {
    return MaaGlobalLoadPlugin(library_path)
}

foreign func MaaSetGlobalOption(key: MaaGlobalOption, value: MaaOptionValue, val_size: MaaOptionValueSize): MaaBool

public unsafe func MaaSetGlobalOption_wrap(key: MaaGlobalOption, value: MaaOptionValue, val_size: MaaOptionValueSize): MaaBool {
    return MaaSetGlobalOption(key, value, val_size)
}

foreign func MaaContextRunTask(context: CPointer<MaaContext>, entry: CString, pipeline_override: CString): MaaTaskId

public unsafe func MaaContextRunTask_wrap(context: CPointer<MaaContext>, entry: CString, pipeline_override: CString): MaaTaskId {
    return MaaContextRunTask(context, entry, pipeline_override)
}

foreign func MaaContextRunRecognition(context: CPointer<MaaContext>, entry: CString, pipeline_override: CString,
    image: CPointer<MaaImageBuffer>): MaaRecoId

public unsafe func MaaContextRunRecognition_wrap(context: CPointer<MaaContext>, entry: CString,
    pipeline_override: CString, image: CPointer<MaaImageBuffer>): MaaRecoId {
    return MaaContextRunRecognition(context, entry, pipeline_override, image)
}

foreign func MaaContextRunAction(context: CPointer<MaaContext>, entry: CString, pipeline_override: CString,
    box: CPointer<MaaRect>, reco_detail: CString): MaaActId

public unsafe func MaaContextRunAction_wrap(context: CPointer<MaaContext>, entry: CString, pipeline_override: CString,
    box: CPointer<MaaRect>, reco_detail: CString): MaaActId {
    return MaaContextRunAction(context, entry, pipeline_override, box, reco_detail)
}

// @brief Run recognition directly with type and parameters, without requiring a pipeline entry.
//
// @param reco_type Recognition type string (e.g., "OCR", "TemplateMatch")
// @param reco_param Recognition parameters json
// @param image Image to recognize
foreign func MaaContextRunRecognitionDirect(context: CPointer<MaaContext>, reco_type: CString, reco_param: CString,
    image: CPointer<MaaImageBuffer>): MaaRecoId

// @brief Run recognition directly with type and parameters, without requiring a pipeline entry.
//
// @param reco_type Recognition type string (e.g., "OCR", "TemplateMatch")
// @param reco_param Recognition parameters json
// @param image Image to recognize
public unsafe func MaaContextRunRecognitionDirect_wrap(context: CPointer<MaaContext>, reco_type: CString,
    reco_param: CString, image: CPointer<MaaImageBuffer>): MaaRecoId {
    return MaaContextRunRecognitionDirect(context, reco_type, reco_param, image)
}

// @brief Run action directly with type and parameters, without requiring a pipeline entry.
//
// @param action_type Action type string (e.g., "Click", "Swipe")
// @param action_param Action parameters json
// @param box Previous recognition position
// @param reco_detail Previous recognition details
foreign func MaaContextRunActionDirect(context: CPointer<MaaContext>, action_type: CString, action_param: CString,
    box: CPointer<MaaRect>, reco_detail: CString): MaaActId

// @brief Run action directly with type and parameters, without requiring a pipeline entry.
//
// @param action_type Action type string (e.g., "Click", "Swipe")
// @param action_param Action parameters json
// @param box Previous recognition position
// @param reco_detail Previous recognition details
public unsafe func MaaContextRunActionDirect_wrap(context: CPointer<MaaContext>, action_type: CString,
    action_param: CString, box: CPointer<MaaRect>, reco_detail: CString): MaaActId {
    return MaaContextRunActionDirect(context, action_type, action_param, box, reco_detail)
}

foreign func MaaContextWaitFreezes(context: CPointer<MaaContext>, time: MaaSize, box: CPointer<MaaRect>,
    wait_freezes_param: CString): MaaBool

public unsafe func MaaContextWaitFreezes_wrap(context: CPointer<MaaContext>, time: MaaSize, box: CPointer<MaaRect>,
    wait_freezes_param: CString): MaaBool {
    return MaaContextWaitFreezes(context, time, box, wait_freezes_param)
}

foreign func MaaContextOverridePipeline(context: CPointer<MaaContext>, pipeline_override: CString): MaaBool

public unsafe func MaaContextOverridePipeline_wrap(context: CPointer<MaaContext>, pipeline_override: CString): MaaBool {
    return MaaContextOverridePipeline(context, pipeline_override)
}

foreign func MaaContextOverrideNext(context: CPointer<MaaContext>, node_name: CString,
    next_list: CPointer<MaaStringListBuffer>): MaaBool

public unsafe func MaaContextOverrideNext_wrap(context: CPointer<MaaContext>, node_name: CString,
    next_list: CPointer<MaaStringListBuffer>): MaaBool {
    return MaaContextOverrideNext(context, node_name, next_list)
}

foreign func MaaContextOverrideImage(context: CPointer<MaaContext>, image_name: CString, image: CPointer<MaaImageBuffer>): MaaBool

public unsafe func MaaContextOverrideImage_wrap(context: CPointer<MaaContext>, image_name: CString,
    image: CPointer<MaaImageBuffer>): MaaBool {
    return MaaContextOverrideImage(context, image_name, image)
}

foreign func MaaContextGetNodeData(context: CPointer<MaaContext>, node_name: CString, buffer: CPointer<MaaStringBuffer>): MaaBool

public unsafe func MaaContextGetNodeData_wrap(context: CPointer<MaaContext>, node_name: CString,
    buffer: CPointer<MaaStringBuffer>): MaaBool {
    return MaaContextGetNodeData(context, node_name, buffer)
}

foreign func MaaContextGetTaskId(context: CPointer<MaaContext>): MaaTaskId

public unsafe func MaaContextGetTaskId_wrap(context: CPointer<MaaContext>): MaaTaskId {
    return MaaContextGetTaskId(context)
}

foreign func MaaContextGetTasker(context: CPointer<MaaContext>): CPointer<MaaTasker>

public unsafe func MaaContextGetTasker_wrap(context: CPointer<MaaContext>): CPointer<MaaTasker> {
    return MaaContextGetTasker(context)
}

foreign func MaaContextClone(context: CPointer<MaaContext>): CPointer<MaaContext>

public unsafe func MaaContextClone_wrap(context: CPointer<MaaContext>): CPointer<MaaContext> {
    return MaaContextClone(context)
}

foreign func MaaContextSetAnchor(context: CPointer<MaaContext>, anchor_name: CString, node_name: CString): MaaBool

public unsafe func MaaContextSetAnchor_wrap(context: CPointer<MaaContext>, anchor_name: CString, node_name: CString): MaaBool {
    return MaaContextSetAnchor(context, anchor_name, node_name)
}

foreign func MaaContextGetAnchor(context: CPointer<MaaContext>, anchor_name: CString, buffer: CPointer<MaaStringBuffer>): MaaBool

public unsafe func MaaContextGetAnchor_wrap(context: CPointer<MaaContext>, anchor_name: CString,
    buffer: CPointer<MaaStringBuffer>): MaaBool {
    return MaaContextGetAnchor(context, anchor_name, buffer)
}

foreign func MaaContextGetHitCount(context: CPointer<MaaContext>, node_name: CString, count: CPointer<MaaSize>): MaaBool

public unsafe func MaaContextGetHitCount_wrap(context: CPointer<MaaContext>, node_name: CString,
    count: CPointer<MaaSize>): MaaBool {
    return MaaContextGetHitCount(context, node_name, count)
}

foreign func MaaContextClearHitCount(context: CPointer<MaaContext>, node_name: CString): MaaBool

public unsafe func MaaContextClearHitCount_wrap(context: CPointer<MaaContext>, node_name: CString): MaaBool {
    return MaaContextClearHitCount(context, node_name)
}

foreign func MaaAdbControllerCreate(adb_path: CString, address: CString, screencap_methods: MaaAdbScreencapMethod,
    input_methods: MaaAdbInputMethod, config: CString, agent_path: CString): CPointer<MaaController>

public unsafe func MaaAdbControllerCreate_wrap(adb_path: CString, address: CString,
    screencap_methods: MaaAdbScreencapMethod, input_methods: MaaAdbInputMethod, config: CString, agent_path: CString): CPointer<MaaController> {
    return MaaAdbControllerCreate(adb_path, address, screencap_methods, input_methods, config, agent_path)
}

foreign func MaaWin32ControllerCreate(hWnd: CPointer<Unit>, screencap_method: MaaWin32ScreencapMethod,
    mouse_method: MaaWin32InputMethod, keyboard_method: MaaWin32InputMethod): CPointer<MaaController>

public unsafe func MaaWin32ControllerCreate_wrap(hWnd: CPointer<Unit>, screencap_method: MaaWin32ScreencapMethod,
    mouse_method: MaaWin32InputMethod, keyboard_method: MaaWin32InputMethod): CPointer<MaaController> {
    return MaaWin32ControllerCreate(hWnd, screencap_method, mouse_method, keyboard_method)
}

// @brief Create a macOS controller for native macOS applications.
//
// @param window_id The CGWindowID of the target window (0 for desktop).
// @param screencap_method macOS screencap method to use.
// @param input_method macOS input method to use.
// @return The controller handle, or nullptr on failure.
//
// @note This controller is designed for native macOS applications.
// @note Requires Screen Recording permission for screencap.
// @note Input simulation requires Accessibility permission.
// @note Some features are not supported: start_app, stop_app, scroll.
// @note Only single touch is supported (contact must be 0).
foreign func MaaMacOSControllerCreate(window_id: UInt32, screencap_method: MaaMacOSScreencapMethod,
    input_method: MaaMacOSInputMethod): CPointer<MaaController>

// @brief Create a macOS controller for native macOS applications.
//
// @param window_id The CGWindowID of the target window (0 for desktop).
// @param screencap_method macOS screencap method to use.
// @param input_method macOS input method to use.
// @return The controller handle, or nullptr on failure.
//
// @note This controller is designed for native macOS applications.
// @note Requires Screen Recording permission for screencap.
// @note Input simulation requires Accessibility permission.
// @note Some features are not supported: start_app, stop_app, scroll.
// @note Only single touch is supported (contact must be 0).
public unsafe func MaaMacOSControllerCreate_wrap(window_id: UInt32, screencap_method: MaaMacOSScreencapMethod,
    input_method: MaaMacOSInputMethod): CPointer<MaaController> {
    return MaaMacOSControllerCreate(window_id, screencap_method, input_method)
}

// @brief Create an Android native controller backed by MaaAndroidNativeControlUnit.
//
// @param config_json JSON config for the control unit. Required fields:
//                    - library_path: path to the Android native control unit library
//                    - screen_resolution.width / screen_resolution.height: raw screenshot and touch resolution
//                    Optional fields:
//                    - display_id: target display id, defaults to 0
//                    - force_stop: whether to force stop before start_app, defaults to false
// @return The controller handle, or nullptr on failure.
//
// @note This controller is only available on Android.
// @note The configured screen_resolution must match the control unit's raw screenshot/touch coordinate space.
// @note Multi-touch is supported: contact is the finger id (0 for the first finger). The external
//       library's TouchArgs must carry contact.
foreign func MaaAndroidNativeControllerCreate(config_json: CString): CPointer<MaaController>

// @brief Create an Android native controller backed by MaaAndroidNativeControlUnit.
//
// @param config_json JSON config for the control unit. Required fields:
//                    - library_path: path to the Android native control unit library
//                    - screen_resolution.width / screen_resolution.height: raw screenshot and touch resolution
//                    Optional fields:
//                    - display_id: target display id, defaults to 0
//                    - force_stop: whether to force stop before start_app, defaults to false
// @return The controller handle, or nullptr on failure.
//
// @note This controller is only available on Android.
// @note The configured screen_resolution must match the control unit's raw screenshot/touch coordinate space.
// @note Multi-touch is supported: contact is the finger id (0 for the first finger). The external
//       library's TouchArgs must carry contact.
public unsafe func MaaAndroidNativeControllerCreate_wrap(config_json: CString): CPointer<MaaController> {
    return MaaAndroidNativeControllerCreate(config_json)
}

foreign func MaaCustomControllerCreate(controller: CPointer<MaaCustomControllerCallbacks>,
    controller_arg: CPointer<Unit>): CPointer<MaaController>

public unsafe func MaaCustomControllerCreate_wrap(controller: CPointer<MaaCustomControllerCallbacks>,
    controller_arg: CPointer<Unit>): CPointer<MaaController> {
    return MaaCustomControllerCreate(controller, controller_arg)
}

// @brief Create a debug controller that serves images from a directory.
//
// @param read_path Path to a directory of images (or a single image file).
//                  Images are loaded on connect and cycled through on each screencap request.
//                  All input operations (click, swipe, etc.) are no-ops that return success.
// @return The controller handle, or nullptr on failure.
foreign func MaaDbgControllerCreate(read_path: CString): CPointer<MaaController>

// @brief Create a debug controller that serves images from a directory.
//
// @param read_path Path to a directory of images (or a single image file).
//                  Images are loaded on connect and cycled through on each screencap request.
//                  All input operations (click, swipe, etc.) are no-ops that return success.
// @return The controller handle, or nullptr on failure.
public unsafe func MaaDbgControllerCreate_wrap(read_path: CString): CPointer<MaaController> {
    return MaaDbgControllerCreate(read_path)
}

// @brief Create a replay controller that replays recorded operations.
//
// @param recording_path Path to the recording JSONL file written by MaaRecordControllerCreate.
//                       Screenshot image paths in the file are resolved relative to this file's parent directory.
// @return The controller handle, or nullptr on failure.
foreign func MaaReplayControllerCreate(recording_path: CString): CPointer<MaaController>

// @brief Create a replay controller that replays recorded operations.
//
// @param recording_path Path to the recording JSONL file written by MaaRecordControllerCreate.
//                       Screenshot image paths in the file are resolved relative to this file's parent directory.
// @return The controller handle, or nullptr on failure.
public unsafe func MaaReplayControllerCreate_wrap(recording_path: CString): CPointer<MaaController> {
    return MaaReplayControllerCreate(recording_path)
}

// @brief Create a record controller that wraps an existing controller and records all operations.
//
// @param inner The inner controller to forward all operations to. Must not be null.
//              The record controller does NOT take ownership of the inner controller.
// @param recording_path Path to the recording JSONL file to write.
//                       Screenshot images will be saved to a "{stem}-Screenshot" folder
//                       in the same directory as this file.
//                       The recorded file can be replayed using MaaReplayControllerCreate.
// @return The record controller handle, or nullptr on failure.
foreign func MaaRecordControllerCreate(inner: CPointer<MaaController>, recording_path: CString): CPointer<MaaController>

// @brief Create a record controller that wraps an existing controller and records all operations.
//
// @param inner The inner controller to forward all operations to. Must not be null.
//              The record controller does NOT take ownership of the inner controller.
// @param recording_path Path to the recording JSONL file to write.
//                       Screenshot images will be saved to a "{stem}-Screenshot" folder
//                       in the same directory as this file.
//                       The recorded file can be replayed using MaaReplayControllerCreate.
// @return The record controller handle, or nullptr on failure.
public unsafe func MaaRecordControllerCreate_wrap(inner: CPointer<MaaController>, recording_path: CString): CPointer<MaaController> {
    return MaaRecordControllerCreate(inner, recording_path)
}

// @brief Create a PlayCover controller for macOS.
//
// @param address The PlayTools service address in "host:port" format.
// @param uuid The application bundle identifier (e.g., "com.hypergryph.arknights").
// @return The controller handle, or nullptr on failure.
//
// @note This controller is designed for PlayCover on macOS.
// @note Some features are not supported: start_app, input_text, click_key, key_down, key_up, scroll.
foreign func MaaPlayCoverControllerCreate(address: CString, uuid: CString): CPointer<MaaController>

// @brief Create a PlayCover controller for macOS.
//
// @param address The PlayTools service address in "host:port" format.
// @param uuid The application bundle identifier (e.g., "com.hypergryph.arknights").
// @return The controller handle, or nullptr on failure.
//
// @note This controller is designed for PlayCover on macOS.
// @note Some features are not supported: start_app, input_text, click_key, key_down, key_up, scroll.
public unsafe func MaaPlayCoverControllerCreate_wrap(address: CString, uuid: CString): CPointer<MaaController> {
    return MaaPlayCoverControllerCreate(address, uuid)
}

// @brief Create a wlroots controller for Linux.
//
// @deprecated Use MaaLinuxControllerCreate instead.
foreign func MaaWlRootsControllerCreate(wlr_socket_path: CString, use_win32_vk_code: MaaBool): CPointer<MaaController>

// @brief Create a wlroots controller for Linux.
//
// @deprecated Use MaaLinuxControllerCreate instead.
public unsafe func MaaWlRootsControllerCreate_wrap(wlr_socket_path: CString, use_win32_vk_code: MaaBool): CPointer<MaaController> {
    return MaaWlRootsControllerCreate(wlr_socket_path, use_win32_vk_code)
}

// @brief Create a KWin / Linux Wayland controller via PipeWire and /dev/uinput.
//
// @deprecated Use MaaLinuxControllerCreate instead.
foreign func MaaKWinControllerCreate(device_node: CString, screen_width: Int32, screen_height: Int32,
    use_win32_vk_code: MaaBool): CPointer<MaaController>

// @brief Create a KWin / Linux Wayland controller via PipeWire and /dev/uinput.
//
// @deprecated Use MaaLinuxControllerCreate instead.
public unsafe func MaaKWinControllerCreate_wrap(device_node: CString, screen_width: Int32, screen_height: Int32,
    use_win32_vk_code: MaaBool): CPointer<MaaController> {
    return MaaKWinControllerCreate(device_node, screen_width, screen_height, use_win32_vk_code)
}

// @brief Create a Linux controller for native Linux applications.
// @param config_json JSON config for the control unit. Required fields:
//                    - screencap_method: screencap method to use, see MaaLinuxScreencapMethod.
//                    - input_method: input method to use, see MaaLinuxInputMethod.
//                    Wlroots Required fields:
//                    - wlr_socket_path: wayland socket path (e.g., "/run/user/1000/wayland-0").
//                    PipeWire monitor capture (via xdg-desktop-portal):
//                    - pw_socket_fd: The PipeWire socket FD (from the ScreenCast portal).
//                    - pw_node_id: The PipeWire Node ID.
//                    PipeWire session-daemon node capture (gamescope etc.):
//                    - pw_node_id: attach to a session-daemon node directly; discover the
//                      node with MaaToolkitGamescopeInstanceFindAll.
//                    UInput Optional fields:
//                    - uinput_path: The uinput device node path, default is "/dev/uinput".
//                    - uinput_screen_width / uinput_screen_height: screen size for the uinput
//                      absolute axis range. Optional.
//                    Libei (EIS) Required fields:
//                    - eis_socket_path: the EIS socket path, e.g. "/run/user/1000/gamescope-0-ei".
//                    Optional fields:
//                    - use_win32_vk_code: If true, key codes passed to click_key / key_down / key_up are
//                      interpreted as Win32 Virtual-Key codes (VK_*) and translated to Linux evdev codes
//                      internally. If false, key codes are passed through as raw evdev codes.
// @return The controller handle, or nullptr on failure.
//
// @note This controller is only available on Linux.
// @note UInput Requires write permission to /dev/uinput (typically via the "input" group).
//       It is recommended to configure a udev rule:
//       KERNEL=="uinput", MODE="0660", GROUP="input".
foreign func MaaLinuxControllerCreate(config_json: CString): CPointer<MaaController>

// @brief Create a Linux controller for native Linux applications.
// @param config_json JSON config for the control unit. Required fields:
//                    - screencap_method: screencap method to use, see MaaLinuxScreencapMethod.
//                    - input_method: input method to use, see MaaLinuxInputMethod.
//                    Wlroots Required fields:
//                    - wlr_socket_path: wayland socket path (e.g., "/run/user/1000/wayland-0").
//                    PipeWire monitor capture (via xdg-desktop-portal):
//                    - pw_socket_fd: The PipeWire socket FD (from the ScreenCast portal).
//                    - pw_node_id: The PipeWire Node ID.
//                    PipeWire session-daemon node capture (gamescope etc.):
//                    - pw_node_id: attach to a session-daemon node directly; discover the
//                      node with MaaToolkitGamescopeInstanceFindAll.
//                    UInput Optional fields:
//                    - uinput_path: The uinput device node path, default is "/dev/uinput".
//                    - uinput_screen_width / uinput_screen_height: screen size for the uinput
//                      absolute axis range. Optional.
//                    Libei (EIS) Required fields:
//                    - eis_socket_path: the EIS socket path, e.g. "/run/user/1000/gamescope-0-ei".
//                    Optional fields:
//                    - use_win32_vk_code: If true, key codes passed to click_key / key_down / key_up are
//                      interpreted as Win32 Virtual-Key codes (VK_*) and translated to Linux evdev codes
//                      internally. If false, key codes are passed through as raw evdev codes.
// @return The controller handle, or nullptr on failure.
//
// @note This controller is only available on Linux.
// @note UInput Requires write permission to /dev/uinput (typically via the "input" group).
//       It is recommended to configure a udev rule:
//       KERNEL=="uinput", MODE="0660", GROUP="input".
public unsafe func MaaLinuxControllerCreate_wrap(config_json: CString): CPointer<MaaController> {
    return MaaLinuxControllerCreate(config_json)
}

// @brief Create a virtual gamepad controller for Windows.
//
// @param hWnd Window handle for screencap (optional, can be nullptr if screencap not needed).
// @param gamepad_type Type of virtual gamepad (MaaGamepadType_Xbox360 or MaaGamepadType_DualShock4).
// @param screencap_method Win32 screencap method to use. Ignored if hWnd is nullptr.
// @return The controller handle, or nullptr on failure.
//
// @note Requires ViGEm Bus Driver to be installed on the system.
// @note For gamepad control, use:
//       - click_key/key_down/key_up: For digital buttons (A, B, X, Y, LB, RB, etc.)
//         See MaaGamepadButton_* constants for available buttons.
//       - touch_down/touch_move/touch_up: For analog inputs (sticks and triggers)
//         - contact 0 (MaaGamepadTouch_LeftStick): Left stick (x: -32768~32767, y: -32768~32767)
//         - contact 1 (MaaGamepadTouch_RightStick): Right stick (x: -32768~32767, y: -32768~32767)
//         - contact 2 (MaaGamepadTouch_LeftTrigger): Left trigger (pressure: 0~255, x/y ignored)
//         - contact 3 (MaaGamepadTouch_RightTrigger): Right trigger (pressure: 0~255, x/y ignored)
// @note click and swipe are not directly supported for gamepad.
// @note input_text, start_app, stop_app, scroll are not supported.
// @see MaaGamepadButton, MaaGamepadTouch, MaaGamepadType
foreign func MaaGamepadControllerCreate(hWnd: CPointer<Unit>, gamepad_type: MaaGamepadType,
    screencap_method: MaaWin32ScreencapMethod): CPointer<MaaController>

// @brief Create a virtual gamepad controller for Windows.
//
// @param hWnd Window handle for screencap (optional, can be nullptr if screencap not needed).
// @param gamepad_type Type of virtual gamepad (MaaGamepadType_Xbox360 or MaaGamepadType_DualShock4).
// @param screencap_method Win32 screencap method to use. Ignored if hWnd is nullptr.
// @return The controller handle, or nullptr on failure.
//
// @note Requires ViGEm Bus Driver to be installed on the system.
// @note For gamepad control, use:
//       - click_key/key_down/key_up: For digital buttons (A, B, X, Y, LB, RB, etc.)
//         See MaaGamepadButton_* constants for available buttons.
//       - touch_down/touch_move/touch_up: For analog inputs (sticks and triggers)
//         - contact 0 (MaaGamepadTouch_LeftStick): Left stick (x: -32768~32767, y: -32768~32767)
//         - contact 1 (MaaGamepadTouch_RightStick): Right stick (x: -32768~32767, y: -32768~32767)
//         - contact 2 (MaaGamepadTouch_LeftTrigger): Left trigger (pressure: 0~255, x/y ignored)
//         - contact 3 (MaaGamepadTouch_RightTrigger): Right trigger (pressure: 0~255, x/y ignored)
// @note click and swipe are not directly supported for gamepad.
// @note input_text, start_app, stop_app, scroll are not supported.
// @see MaaGamepadButton, MaaGamepadTouch, MaaGamepadType
public unsafe func MaaGamepadControllerCreate_wrap(hWnd: CPointer<Unit>, gamepad_type: MaaGamepadType,
    screencap_method: MaaWin32ScreencapMethod): CPointer<MaaController> {
    return MaaGamepadControllerCreate(hWnd, gamepad_type, screencap_method)
}

foreign func MaaControllerDestroy(ctrl: CPointer<MaaController>): Unit

public unsafe func MaaControllerDestroy_wrap(ctrl: CPointer<MaaController>): Unit {
    return MaaControllerDestroy(ctrl)
}

foreign func MaaControllerAddSink(ctrl: CPointer<MaaController>, sink: MaaEventCallback, trans_arg: CPointer<Unit>): MaaSinkId

public unsafe func MaaControllerAddSink_wrap(ctrl: CPointer<MaaController>, sink: MaaEventCallback,
    trans_arg: CPointer<Unit>): MaaSinkId {
    return MaaControllerAddSink(ctrl, sink, trans_arg)
}

foreign func MaaControllerRemoveSink(ctrl: CPointer<MaaController>, sink_id: MaaSinkId): Unit

public unsafe func MaaControllerRemoveSink_wrap(ctrl: CPointer<MaaController>, sink_id: MaaSinkId): Unit {
    return MaaControllerRemoveSink(ctrl, sink_id)
}

foreign func MaaControllerClearSinks(ctrl: CPointer<MaaController>): Unit

public unsafe func MaaControllerClearSinks_wrap(ctrl: CPointer<MaaController>): Unit {
    return MaaControllerClearSinks(ctrl)
}

// @param[in] value
foreign func MaaControllerSetOption(ctrl: CPointer<MaaController>, key: MaaCtrlOption, value: MaaOptionValue,
    val_size: MaaOptionValueSize): MaaBool

// @param[in] value
public unsafe func MaaControllerSetOption_wrap(ctrl: CPointer<MaaController>, key: MaaCtrlOption, value: MaaOptionValue,
    val_size: MaaOptionValueSize): MaaBool {
    return MaaControllerSetOption(ctrl, key, value, val_size)
}

foreign func MaaControllerPostConnection(ctrl: CPointer<MaaController>): MaaCtrlId

public unsafe func MaaControllerPostConnection_wrap(ctrl: CPointer<MaaController>): MaaCtrlId {
    return MaaControllerPostConnection(ctrl)
}

foreign func MaaControllerPostClick(ctrl: CPointer<MaaController>, x: Int32, y: Int32): MaaCtrlId

public unsafe func MaaControllerPostClick_wrap(ctrl: CPointer<MaaController>, x: Int32, y: Int32): MaaCtrlId {
    return MaaControllerPostClick(ctrl, x, y)
}

// for adb controller, contact means finger id (0 for first finger, 1 for second finger, etc)
// for win32 controller, contact means mouse button id (0 for left, 1 for right, 2 for middle)
foreign func MaaControllerPostClickV2(ctrl: CPointer<MaaController>, x: Int32, y: Int32, contact: Int32, pressure: Int32): MaaCtrlId

// for adb controller, contact means finger id (0 for first finger, 1 for second finger, etc)
// for win32 controller, contact means mouse button id (0 for left, 1 for right, 2 for middle)
public unsafe func MaaControllerPostClickV2_wrap(ctrl: CPointer<MaaController>, x: Int32, y: Int32, contact: Int32,
    pressure: Int32): MaaCtrlId {
    return MaaControllerPostClickV2(ctrl, x, y, contact, pressure)
}

foreign func MaaControllerPostSwipe(ctrl: CPointer<MaaController>, x1: Int32, y1: Int32, x2: Int32, y2: Int32,
    duration: Int32): MaaCtrlId

public unsafe func MaaControllerPostSwipe_wrap(ctrl: CPointer<MaaController>, x1: Int32, y1: Int32, x2: Int32,
    y2: Int32, duration: Int32): MaaCtrlId {
    return MaaControllerPostSwipe(ctrl, x1, y1, x2, y2, duration)
}

// for adb controller, contact means finger id (0 for first finger, 1 for second finger, etc)
// for win32 controller, contact means mouse button id (0 for left, 1 for right, 2 for middle)
foreign func MaaControllerPostSwipeV2(ctrl: CPointer<MaaController>, x1: Int32, y1: Int32, x2: Int32, y2: Int32,
    duration: Int32, contact: Int32, pressure: Int32): MaaCtrlId

// for adb controller, contact means finger id (0 for first finger, 1 for second finger, etc)
// for win32 controller, contact means mouse button id (0 for left, 1 for right, 2 for middle)
public unsafe func MaaControllerPostSwipeV2_wrap(ctrl: CPointer<MaaController>, x1: Int32, y1: Int32, x2: Int32,
    y2: Int32, duration: Int32, contact: Int32, pressure: Int32): MaaCtrlId {
    return MaaControllerPostSwipeV2(ctrl, x1, y1, x2, y2, duration, contact, pressure)
}

foreign func MaaControllerPostClickKey(ctrl: CPointer<MaaController>, keycode: Int32): MaaCtrlId

public unsafe func MaaControllerPostClickKey_wrap(ctrl: CPointer<MaaController>, keycode: Int32): MaaCtrlId {
    return MaaControllerPostClickKey(ctrl, keycode)
}

foreign func MaaControllerPostInputText(ctrl: CPointer<MaaController>, text: CString): MaaCtrlId

public unsafe func MaaControllerPostInputText_wrap(ctrl: CPointer<MaaController>, text: CString): MaaCtrlId {
    return MaaControllerPostInputText(ctrl, text)
}

foreign func MaaControllerPostStartApp(ctrl: CPointer<MaaController>, intent: CString): MaaCtrlId

public unsafe func MaaControllerPostStartApp_wrap(ctrl: CPointer<MaaController>, intent: CString): MaaCtrlId {
    return MaaControllerPostStartApp(ctrl, intent)
}

foreign func MaaControllerPostStopApp(ctrl: CPointer<MaaController>, intent: CString): MaaCtrlId

public unsafe func MaaControllerPostStopApp_wrap(ctrl: CPointer<MaaController>, intent: CString): MaaCtrlId {
    return MaaControllerPostStopApp(ctrl, intent)
}

// for adb controller, contact means finger id (0 for first finger, 1 for second finger, etc)
// for win32 controller, contact means mouse button id (0 for left, 1 for right, 2 for middle)
foreign func MaaControllerPostTouchDown(ctrl: CPointer<MaaController>, contact: Int32, x: Int32, y: Int32,
    pressure: Int32): MaaCtrlId

// for adb controller, contact means finger id (0 for first finger, 1 for second finger, etc)
// for win32 controller, contact means mouse button id (0 for left, 1 for right, 2 for middle)
public unsafe func MaaControllerPostTouchDown_wrap(ctrl: CPointer<MaaController>, contact: Int32, x: Int32, y: Int32,
    pressure: Int32): MaaCtrlId {
    return MaaControllerPostTouchDown(ctrl, contact, x, y, pressure)
}

foreign func MaaControllerPostTouchMove(ctrl: CPointer<MaaController>, contact: Int32, x: Int32, y: Int32,
    pressure: Int32): MaaCtrlId

public unsafe func MaaControllerPostTouchMove_wrap(ctrl: CPointer<MaaController>, contact: Int32, x: Int32, y: Int32,
    pressure: Int32): MaaCtrlId {
    return MaaControllerPostTouchMove(ctrl, contact, x, y, pressure)
}

// for adb controller, contact means finger id (0 for first finger, 1 for second finger, etc)
// for win32 controller, contact means mouse button id (0 for left, 1 for right, 2 for middle)
foreign func MaaControllerPostTouchUp(ctrl: CPointer<MaaController>, contact: Int32): MaaCtrlId

// for adb controller, contact means finger id (0 for first finger, 1 for second finger, etc)
// for win32 controller, contact means mouse button id (0 for left, 1 for right, 2 for middle)
public unsafe func MaaControllerPostTouchUp_wrap(ctrl: CPointer<MaaController>, contact: Int32): MaaCtrlId {
    return MaaControllerPostTouchUp(ctrl, contact)
}

foreign func MaaControllerPostRelativeMove(ctrl: CPointer<MaaController>, dx: Int32, dy: Int32): MaaCtrlId

public unsafe func MaaControllerPostRelativeMove_wrap(ctrl: CPointer<MaaController>, dx: Int32, dy: Int32): MaaCtrlId {
    return MaaControllerPostRelativeMove(ctrl, dx, dy)
}

foreign func MaaControllerPostKeyDown(ctrl: CPointer<MaaController>, keycode: Int32): MaaCtrlId

public unsafe func MaaControllerPostKeyDown_wrap(ctrl: CPointer<MaaController>, keycode: Int32): MaaCtrlId {
    return MaaControllerPostKeyDown(ctrl, keycode)
}

foreign func MaaControllerPostKeyUp(ctrl: CPointer<MaaController>, keycode: Int32): MaaCtrlId

public unsafe func MaaControllerPostKeyUp_wrap(ctrl: CPointer<MaaController>, keycode: Int32): MaaCtrlId {
    return MaaControllerPostKeyUp(ctrl, keycode)
}

// @brief Post a screenshot request to the controller.
//
// @param ctrl The controller handle.
// @return The control id of the screenshot action.
//
// @note The screenshot image is scaled according to the screenshot target size settings (long side / short side).
//       Use MaaControllerGetResolution to get the raw (unscaled) device resolution.
// @see MaaControllerCachedImage, MaaControllerSetOption, MaaControllerGetResolution
foreign func MaaControllerPostScreencap(ctrl: CPointer<MaaController>): MaaCtrlId

// @brief Post a screenshot request to the controller.
//
// @param ctrl The controller handle.
// @return The control id of the screenshot action.
//
// @note The screenshot image is scaled according to the screenshot target size settings (long side / short side).
//       Use MaaControllerGetResolution to get the raw (unscaled) device resolution.
// @see MaaControllerCachedImage, MaaControllerSetOption, MaaControllerGetResolution
public unsafe func MaaControllerPostScreencap_wrap(ctrl: CPointer<MaaController>): MaaCtrlId {
    return MaaControllerPostScreencap(ctrl)
}

// @brief Post a scroll action to the controller.
//
// @param ctrl The controller handle.
// @param dx The horizontal scroll delta. Positive values scroll right, negative values scroll left.
// @param dy The vertical scroll delta. Positive values scroll up, negative values scroll down.
// @return The control id of the scroll action.
//
// @note Scroll is supported by Win32 controllers and custom controllers that implement scroll.
// @note If the controller does not support scroll, the action will fail. Use MaaControllerStatus or
// MaaControllerWait to check the result.
// @note The dx/dy values are sent directly as scroll increments. Using multiples of 120 (WHEEL_DELTA) is
// recommended for best compatibility.
foreign func MaaControllerPostScroll(ctrl: CPointer<MaaController>, dx: Int32, dy: Int32): MaaCtrlId

// @brief Post a scroll action to the controller.
//
// @param ctrl The controller handle.
// @param dx The horizontal scroll delta. Positive values scroll right, negative values scroll left.
// @param dy The vertical scroll delta. Positive values scroll up, negative values scroll down.
// @return The control id of the scroll action.
//
// @note Scroll is supported by Win32 controllers and custom controllers that implement scroll.
// @note If the controller does not support scroll, the action will fail. Use MaaControllerStatus or
// MaaControllerWait to check the result.
// @note The dx/dy values are sent directly as scroll increments. Using multiples of 120 (WHEEL_DELTA) is
// recommended for best compatibility.
public unsafe func MaaControllerPostScroll_wrap(ctrl: CPointer<MaaController>, dx: Int32, dy: Int32): MaaCtrlId {
    return MaaControllerPostScroll(ctrl, dx, dy)
}

// @brief Post an inactive request to the controller.
//
// @param ctrl The controller handle.
// @return The control id of the inactive action.
//
// @note For Win32 controllers, this restores window position (removes topmost) and unblocks user input.
// @note For other controllers, this is a no-op that always succeeds.
foreign func MaaControllerPostInactive(ctrl: CPointer<MaaController>): MaaCtrlId

// @brief Post an inactive request to the controller.
//
// @param ctrl The controller handle.
// @return The control id of the inactive action.
//
// @note For Win32 controllers, this restores window position (removes topmost) and unblocks user input.
// @note For other controllers, this is a no-op that always succeeds.
public unsafe func MaaControllerPostInactive_wrap(ctrl: CPointer<MaaController>): MaaCtrlId {
    return MaaControllerPostInactive(ctrl)
}

// @brief Post a shell command to the controller.
//
// @param ctrl The controller handle.
// @param cmd The shell command to execute.
// @param timeout Timeout in milliseconds. Default is 20000 (20 seconds).
// @return The control id of the shell action.
//
// @note Supported by ADB controllers and custom controllers that implement the shell callback.
// @see MaaControllerGetShellOutput
foreign func MaaControllerPostShell(ctrl: CPointer<MaaController>, cmd: CString, timeout: Int64): MaaCtrlId

// @brief Post a shell command to the controller.
//
// @param ctrl The controller handle.
// @param cmd The shell command to execute.
// @param timeout Timeout in milliseconds. Default is 20000 (20 seconds).
// @return The control id of the shell action.
//
// @note Supported by ADB controllers and custom controllers that implement the shell callback.
// @see MaaControllerGetShellOutput
public unsafe func MaaControllerPostShell_wrap(ctrl: CPointer<MaaController>, cmd: CString, timeout: Int64): MaaCtrlId {
    return MaaControllerPostShell(ctrl, cmd, timeout)
}

// @brief Get the cached shell command output.
//
// @param ctrl The controller handle.
// @param buffer The output buffer to store the command result.
// @return true if the output is available, false otherwise.
//
// @note This returns the output from the most recent shell command execution.
foreign func MaaControllerGetShellOutput(ctrl: CPointer<MaaController>, buffer: CPointer<MaaStringBuffer>): MaaBool

// @brief Get the cached shell command output.
//
// @param ctrl The controller handle.
// @param buffer The output buffer to store the command result.
// @return true if the output is available, false otherwise.
//
// @note This returns the output from the most recent shell command execution.
public unsafe func MaaControllerGetShellOutput_wrap(ctrl: CPointer<MaaController>, buffer: CPointer<MaaStringBuffer>): MaaBool {
    return MaaControllerGetShellOutput(ctrl, buffer)
}

foreign func MaaControllerStatus(ctrl: CPointer<MaaController>, id: MaaCtrlId): MaaStatus

public unsafe func MaaControllerStatus_wrap(ctrl: CPointer<MaaController>, id: MaaCtrlId): MaaStatus {
    return MaaControllerStatus(ctrl, id)
}

foreign func MaaControllerWait(ctrl: CPointer<MaaController>, id: MaaCtrlId): MaaStatus

public unsafe func MaaControllerWait_wrap(ctrl: CPointer<MaaController>, id: MaaCtrlId): MaaStatus {
    return MaaControllerWait(ctrl, id)
}

foreign func MaaControllerConnected(ctrl: CPointer<MaaController>): MaaBool

public unsafe func MaaControllerConnected_wrap(ctrl: CPointer<MaaController>): MaaBool {
    return MaaControllerConnected(ctrl)
}

// @brief Get the cached screenshot image.
//
// @param ctrl The controller handle.
// @param buffer The output buffer to store the screenshot image.
// @return true if the screenshot is available, false otherwise.
//
// @note The returned image is scaled according to the screenshot target size settings (long side / short side).
//       The image dimensions may differ from the raw device resolution.
//       Use MaaControllerGetResolution to get the raw (unscaled) device resolution.
// @see MaaControllerPostScreencap, MaaControllerSetOption, MaaControllerGetResolution
foreign func MaaControllerCachedImage(ctrl: CPointer<MaaController>, buffer: CPointer<MaaImageBuffer>): MaaBool

// @brief Get the cached screenshot image.
//
// @param ctrl The controller handle.
// @param buffer The output buffer to store the screenshot image.
// @return true if the screenshot is available, false otherwise.
//
// @note The returned image is scaled according to the screenshot target size settings (long side / short side).
//       The image dimensions may differ from the raw device resolution.
//       Use MaaControllerGetResolution to get the raw (unscaled) device resolution.
// @see MaaControllerPostScreencap, MaaControllerSetOption, MaaControllerGetResolution
public unsafe func MaaControllerCachedImage_wrap(ctrl: CPointer<MaaController>, buffer: CPointer<MaaImageBuffer>): MaaBool {
    return MaaControllerCachedImage(ctrl, buffer)
}

foreign func MaaControllerGetUuid(ctrl: CPointer<MaaController>, buffer: CPointer<MaaStringBuffer>): MaaBool

public unsafe func MaaControllerGetUuid_wrap(ctrl: CPointer<MaaController>, buffer: CPointer<MaaStringBuffer>): MaaBool {
    return MaaControllerGetUuid(ctrl, buffer)
}

// @brief Get the raw (unscaled) device resolution.
//
// @param ctrl The controller handle.
// @param[out] width Output parameter for the raw width.
// @param[out] height Output parameter for the raw height.
// @return true if the resolution is available, false otherwise (e.g., not connected or no screenshot taken yet).
//
// @note This returns the actual device screen resolution before any scaling.
//       The screenshot obtained via MaaControllerCachedImage is scaled according to the screenshot target size settings,
//       so its dimensions may differ from this raw resolution.
// @see MaaControllerCachedImage, MaaControllerPostScreencap
foreign func MaaControllerGetResolution(ctrl: CPointer<MaaController>, width: CPointer<Int32>, height: CPointer<Int32>): MaaBool

// @brief Get the raw (unscaled) device resolution.
//
// @param ctrl The controller handle.
// @param[out] width Output parameter for the raw width.
// @param[out] height Output parameter for the raw height.
// @return true if the resolution is available, false otherwise (e.g., not connected or no screenshot taken yet).
//
// @note This returns the actual device screen resolution before any scaling.
//       The screenshot obtained via MaaControllerCachedImage is scaled according to the screenshot target size settings,
//       so its dimensions may differ from this raw resolution.
// @see MaaControllerCachedImage, MaaControllerPostScreencap
public unsafe func MaaControllerGetResolution_wrap(ctrl: CPointer<MaaController>, width: CPointer<Int32>,
    height: CPointer<Int32>): MaaBool {
    return MaaControllerGetResolution(ctrl, width, height)
}

// @brief Get controller information as a JSON string.
//
// @param ctrl The controller handle.
// @param buffer The output buffer to store the JSON string.
// @return true if the info is available, false otherwise.
//
// @note Returns controller-specific information including type, constructor parameters and current state.
//       The returned JSON always contains a "type" field indicating the controller type.
foreign func MaaControllerGetInfo(ctrl: CPointer<MaaController>, buffer: CPointer<MaaStringBuffer>): MaaBool

// @brief Get controller information as a JSON string.
//
// @param ctrl The controller handle.
// @param buffer The output buffer to store the JSON string.
// @return true if the info is available, false otherwise.
//
// @note Returns controller-specific information including type, constructor parameters and current state.
//       The returned JSON always contains a "type" field indicating the controller type.
public unsafe func MaaControllerGetInfo_wrap(ctrl: CPointer<MaaController>, buffer: CPointer<MaaStringBuffer>): MaaBool {
    return MaaControllerGetInfo(ctrl, buffer)
}

foreign func MaaControllerPostPressKey(ctrl: CPointer<MaaController>, keycode: Int32): MaaCtrlId

public unsafe func MaaControllerPostPressKey_wrap(ctrl: CPointer<MaaController>, keycode: Int32): MaaCtrlId {
    return MaaControllerPostPressKey(ctrl, keycode)
}

// @brief The custom controller API.
//
// To create a custom controller, you need to implement this API.
//
// You do not have to implement all the functions in this API. Instead, just implement the
// functions you need. Do note that if an unimplemented function is called, the framework will
// likely crash.
@C
public struct MaaCustomControllerCallbacks {
    public var connect: CFunc<(trans_arg: CPointer<Unit>) -> MaaBool>
    public var connected: CFunc<(trans_arg: CPointer<Unit>) -> MaaBool>
    // Write result to buffer.
    public var request_uuid: CFunc<(trans_arg: CPointer<Unit>, buffer: CPointer<MaaStringBuffer>) -> MaaBool>
    public var get_features: CFunc<(trans_arg: CPointer<Unit>) -> MaaControllerFeature>
    public var start_app: CFunc<(intent: CString, trans_arg: CPointer<Unit>) -> MaaBool>
    public var stop_app: CFunc<(intent: CString, trans_arg: CPointer<Unit>) -> MaaBool>
    // Write result to buffer.
    public var screencap: CFunc<(trans_arg: CPointer<Unit>, buffer: CPointer<MaaImageBuffer>) -> MaaBool>
    public var click: CFunc<(x: Int32, y: Int32, trans_arg: CPointer<Unit>) -> MaaBool>
    public var swipe: CFunc<(x1: Int32, y1: Int32, x2: Int32, y2: Int32, duration: Int32, trans_arg: CPointer<Unit>) -> MaaBool>
    public var touch_down: CFunc<(contact: Int32, x: Int32, y: Int32, pressure: Int32, trans_arg: CPointer<Unit>) -> MaaBool>
    public var touch_move: CFunc<(contact: Int32, x: Int32, y: Int32, pressure: Int32, trans_arg: CPointer<Unit>) -> MaaBool>
    public var touch_up: CFunc<(contact: Int32, trans_arg: CPointer<Unit>) -> MaaBool>
    public var click_key: CFunc<(keycode: Int32, trans_arg: CPointer<Unit>) -> MaaBool>
    public var input_text: CFunc<(text: CString, trans_arg: CPointer<Unit>) -> MaaBool>
    public var key_down: CFunc<(keycode: Int32, trans_arg: CPointer<Unit>) -> MaaBool>
    public var key_up: CFunc<(keycode: Int32, trans_arg: CPointer<Unit>) -> MaaBool>
    public var scroll: CFunc<(dx: Int32, dy: Int32, trans_arg: CPointer<Unit>) -> MaaBool>
    public var relative_move: CFunc<(dx: Int32, dy: Int32, trans_arg: CPointer<Unit>) -> MaaBool>
    // Write result to buffer.
    public var shell: CFunc<(cmd: CString, timeout: Int64, trans_arg: CPointer<Unit>, buffer: CPointer<MaaStringBuffer>) -> MaaBool>
    public var inactive: CFunc<(trans_arg: CPointer<Unit>) -> MaaBool>
    // Write result (JSON string) to buffer. Optional, can be NULL.
    public var get_info: CFunc<(trans_arg: CPointer<Unit>, buffer: CPointer<MaaStringBuffer>) -> MaaBool>
    public init(connect: CFunc<(trans_arg: CPointer<Unit>) -> MaaBool>,
        connected: CFunc<(trans_arg: CPointer<Unit>) -> MaaBool>,
        request_uuid: CFunc<(trans_arg: CPointer<Unit>, buffer: CPointer<MaaStringBuffer>) -> MaaBool>,
        get_features: CFunc<(trans_arg: CPointer<Unit>) -> MaaControllerFeature>,
        start_app: CFunc<(intent: CString, trans_arg: CPointer<Unit>) -> MaaBool>,
        stop_app: CFunc<(intent: CString, trans_arg: CPointer<Unit>) -> MaaBool>,
        screencap: CFunc<(trans_arg: CPointer<Unit>, buffer: CPointer<MaaImageBuffer>) -> MaaBool>,
        click: CFunc<(x: Int32, y: Int32, trans_arg: CPointer<Unit>) -> MaaBool>,
        swipe: CFunc<(x1: Int32, y1: Int32, x2: Int32, y2: Int32, duration: Int32, trans_arg: CPointer<Unit>) -> MaaBool>,
        touch_down: CFunc<(contact: Int32, x: Int32, y: Int32, pressure: Int32, trans_arg: CPointer<Unit>) -> MaaBool>,
        touch_move: CFunc<(contact: Int32, x: Int32, y: Int32, pressure: Int32, trans_arg: CPointer<Unit>) -> MaaBool>,
        touch_up: CFunc<(contact: Int32, trans_arg: CPointer<Unit>) -> MaaBool>,
        click_key: CFunc<(keycode: Int32, trans_arg: CPointer<Unit>) -> MaaBool>,
        input_text: CFunc<(text: CString, trans_arg: CPointer<Unit>) -> MaaBool>,
        key_down: CFunc<(keycode: Int32, trans_arg: CPointer<Unit>) -> MaaBool>,
        key_up: CFunc<(keycode: Int32, trans_arg: CPointer<Unit>) -> MaaBool>,
        scroll: CFunc<(dx: Int32, dy: Int32, trans_arg: CPointer<Unit>) -> MaaBool>,
        relative_move: CFunc<(dx: Int32, dy: Int32, trans_arg: CPointer<Unit>) -> MaaBool>,
        shell: CFunc<(cmd: CString, timeout: Int64, trans_arg: CPointer<Unit>, buffer: CPointer<MaaStringBuffer>) -> MaaBool>,
        inactive: CFunc<(trans_arg: CPointer<Unit>) -> MaaBool>,
        get_info: CFunc<(trans_arg: CPointer<Unit>, buffer: CPointer<MaaStringBuffer>) -> MaaBool>) {
        this.connect = connect
        this.connected = connected
        this.request_uuid = request_uuid
        this.get_features = get_features
        this.start_app = start_app
        this.stop_app = stop_app
        this.screencap = screencap
        this.click = click
        this.swipe = swipe
        this.touch_down = touch_down
        this.touch_move = touch_move
        this.touch_up = touch_up
        this.click_key = click_key
        this.input_text = input_text
        this.key_down = key_down
        this.key_up = key_up
        this.scroll = scroll
        this.relative_move = relative_move
        this.shell = shell
        this.inactive = inactive
        this.get_info = get_info
    }
}

@When[debug]
let _ = {
    =>
        let size = sizeOf<MaaCustomControllerCallbacks>()
        if (size != 168) {
            throw Exception("Size of MaaCustomControllerCallbacks is not 168 but ${size} bytes")
        }
        let align = alignOf<MaaCustomControllerCallbacks>()
        if (align != 8) {
            throw Exception("Alignment of MaaCustomControllerCallbacks is not 8 but ${align} bytes")
        }
}

foreign func MaaResourceCreate(): CPointer<MaaResource>

public unsafe func MaaResourceCreate_wrap(): CPointer<MaaResource> {
    return MaaResourceCreate()
}

foreign func MaaResourceDestroy(res: CPointer<MaaResource>): Unit

public unsafe func MaaResourceDestroy_wrap(res: CPointer<MaaResource>): Unit {
    return MaaResourceDestroy(res)
}

foreign func MaaResourceAddSink(res: CPointer<MaaResource>, sink: MaaEventCallback, trans_arg: CPointer<Unit>): MaaSinkId

public unsafe func MaaResourceAddSink_wrap(res: CPointer<MaaResource>, sink: MaaEventCallback, trans_arg: CPointer<Unit>): MaaSinkId {
    return MaaResourceAddSink(res, sink, trans_arg)
}

foreign func MaaResourceRemoveSink(res: CPointer<MaaResource>, sink_id: MaaSinkId): Unit

public unsafe func MaaResourceRemoveSink_wrap(res: CPointer<MaaResource>, sink_id: MaaSinkId): Unit {
    return MaaResourceRemoveSink(res, sink_id)
}

foreign func MaaResourceClearSinks(res: CPointer<MaaResource>): Unit

public unsafe func MaaResourceClearSinks_wrap(res: CPointer<MaaResource>): Unit {
    return MaaResourceClearSinks(res)
}

foreign func MaaResourceRegisterCustomRecognition(res: CPointer<MaaResource>, name: CString,
    recognition: MaaCustomRecognitionCallback, trans_arg: CPointer<Unit>): MaaBool

public unsafe func MaaResourceRegisterCustomRecognition_wrap(res: CPointer<MaaResource>, name: CString,
    recognition: MaaCustomRecognitionCallback, trans_arg: CPointer<Unit>): MaaBool {
    return MaaResourceRegisterCustomRecognition(res, name, recognition, trans_arg)
}

foreign func MaaResourceUnregisterCustomRecognition(res: CPointer<MaaResource>, name: CString): MaaBool

public unsafe func MaaResourceUnregisterCustomRecognition_wrap(res: CPointer<MaaResource>, name: CString): MaaBool {
    return MaaResourceUnregisterCustomRecognition(res, name)
}

foreign func MaaResourceClearCustomRecognition(res: CPointer<MaaResource>): MaaBool

public unsafe func MaaResourceClearCustomRecognition_wrap(res: CPointer<MaaResource>): MaaBool {
    return MaaResourceClearCustomRecognition(res)
}

foreign func MaaResourceRegisterCustomAction(res: CPointer<MaaResource>, name: CString, action: MaaCustomActionCallback,
    trans_arg: CPointer<Unit>): MaaBool

public unsafe func MaaResourceRegisterCustomAction_wrap(res: CPointer<MaaResource>, name: CString,
    action: MaaCustomActionCallback, trans_arg: CPointer<Unit>): MaaBool {
    return MaaResourceRegisterCustomAction(res, name, action, trans_arg)
}

foreign func MaaResourceUnregisterCustomAction(res: CPointer<MaaResource>, name: CString): MaaBool

public unsafe func MaaResourceUnregisterCustomAction_wrap(res: CPointer<MaaResource>, name: CString): MaaBool {
    return MaaResourceUnregisterCustomAction(res, name)
}

foreign func MaaResourceClearCustomAction(res: CPointer<MaaResource>): MaaBool

public unsafe func MaaResourceClearCustomAction_wrap(res: CPointer<MaaResource>): MaaBool {
    return MaaResourceClearCustomAction(res)
}

foreign func MaaResourcePostBundle(res: CPointer<MaaResource>, path: CString): MaaResId

public unsafe func MaaResourcePostBundle_wrap(res: CPointer<MaaResource>, path: CString): MaaResId {
    return MaaResourcePostBundle(res, path)
}

foreign func MaaResourcePostOcrModel(res: CPointer<MaaResource>, path: CString): MaaResId

public unsafe func MaaResourcePostOcrModel_wrap(res: CPointer<MaaResource>, path: CString): MaaResId {
    return MaaResourcePostOcrModel(res, path)
}

foreign func MaaResourcePostPipeline(res: CPointer<MaaResource>, path: CString): MaaResId

public unsafe func MaaResourcePostPipeline_wrap(res: CPointer<MaaResource>, path: CString): MaaResId {
    return MaaResourcePostPipeline(res, path)
}

foreign func MaaResourcePostImage(res: CPointer<MaaResource>, path: CString): MaaResId

public unsafe func MaaResourcePostImage_wrap(res: CPointer<MaaResource>, path: CString): MaaResId {
    return MaaResourcePostImage(res, path)
}

foreign func MaaResourceOverridePipeline(res: CPointer<MaaResource>, pipeline_override: CString): MaaBool

public unsafe func MaaResourceOverridePipeline_wrap(res: CPointer<MaaResource>, pipeline_override: CString): MaaBool {
    return MaaResourceOverridePipeline(res, pipeline_override)
}

foreign func MaaResourceOverrideNext(res: CPointer<MaaResource>, node_name: CString,
    next_list: CPointer<MaaStringListBuffer>): MaaBool

public unsafe func MaaResourceOverrideNext_wrap(res: CPointer<MaaResource>, node_name: CString,
    next_list: CPointer<MaaStringListBuffer>): MaaBool {
    return MaaResourceOverrideNext(res, node_name, next_list)
}

foreign func MaaResourceOverrideImage(res: CPointer<MaaResource>, image_name: CString, image: CPointer<MaaImageBuffer>): MaaBool

public unsafe func MaaResourceOverrideImage_wrap(res: CPointer<MaaResource>, image_name: CString,
    image: CPointer<MaaImageBuffer>): MaaBool {
    return MaaResourceOverrideImage(res, image_name, image)
}

foreign func MaaResourceGetNodeData(res: CPointer<MaaResource>, node_name: CString, buffer: CPointer<MaaStringBuffer>): MaaBool

public unsafe func MaaResourceGetNodeData_wrap(res: CPointer<MaaResource>, node_name: CString,
    buffer: CPointer<MaaStringBuffer>): MaaBool {
    return MaaResourceGetNodeData(res, node_name, buffer)
}

foreign func MaaResourceClear(res: CPointer<MaaResource>): MaaBool

public unsafe func MaaResourceClear_wrap(res: CPointer<MaaResource>): MaaBool {
    return MaaResourceClear(res)
}

foreign func MaaResourceStatus(res: CPointer<MaaResource>, id: MaaResId): MaaStatus

public unsafe func MaaResourceStatus_wrap(res: CPointer<MaaResource>, id: MaaResId): MaaStatus {
    return MaaResourceStatus(res, id)
}

foreign func MaaResourceWait(res: CPointer<MaaResource>, id: MaaResId): MaaStatus

public unsafe func MaaResourceWait_wrap(res: CPointer<MaaResource>, id: MaaResId): MaaStatus {
    return MaaResourceWait(res, id)
}

foreign func MaaResourceLoaded(res: CPointer<MaaResource>): MaaBool

public unsafe func MaaResourceLoaded_wrap(res: CPointer<MaaResource>): MaaBool {
    return MaaResourceLoaded(res)
}

foreign func MaaResourceSetOption(res: CPointer<MaaResource>, key: MaaResOption, value: MaaOptionValue,
    val_size: MaaOptionValueSize): MaaBool

public unsafe func MaaResourceSetOption_wrap(res: CPointer<MaaResource>, key: MaaResOption, value: MaaOptionValue,
    val_size: MaaOptionValueSize): MaaBool {
    return MaaResourceSetOption(res, key, value, val_size)
}

foreign func MaaResourceGetHash(res: CPointer<MaaResource>, buffer: CPointer<MaaStringBuffer>): MaaBool

public unsafe func MaaResourceGetHash_wrap(res: CPointer<MaaResource>, buffer: CPointer<MaaStringBuffer>): MaaBool {
    return MaaResourceGetHash(res, buffer)
}

foreign func MaaResourceGetNodeList(res: CPointer<MaaResource>, buffer: CPointer<MaaStringListBuffer>): MaaBool

public unsafe func MaaResourceGetNodeList_wrap(res: CPointer<MaaResource>, buffer: CPointer<MaaStringListBuffer>): MaaBool {
    return MaaResourceGetNodeList(res, buffer)
}

foreign func MaaResourceGetCustomRecognitionList(res: CPointer<MaaResource>, buffer: CPointer<MaaStringListBuffer>): MaaBool

public unsafe func MaaResourceGetCustomRecognitionList_wrap(res: CPointer<MaaResource>,
    buffer: CPointer<MaaStringListBuffer>): MaaBool {
    return MaaResourceGetCustomRecognitionList(res, buffer)
}

foreign func MaaResourceGetCustomActionList(res: CPointer<MaaResource>, buffer: CPointer<MaaStringListBuffer>): MaaBool

public unsafe func MaaResourceGetCustomActionList_wrap(res: CPointer<MaaResource>, buffer: CPointer<MaaStringListBuffer>): MaaBool {
    return MaaResourceGetCustomActionList(res, buffer)
}

// @brief Get default recognition parameters for the specified type from DefaultPipelineMgr.
//
// @param reco_type Recognition type string (e.g., "OCR", "TemplateMatch")
// @param buffer [out] Output buffer for the JSON string of recognition parameters
foreign func MaaResourceGetDefaultRecognitionParam(res: CPointer<MaaResource>, reco_type: CString,
    buffer: CPointer<MaaStringBuffer>): MaaBool

// @brief Get default recognition parameters for the specified type from DefaultPipelineMgr.
//
// @param reco_type Recognition type string (e.g., "OCR", "TemplateMatch")
// @param buffer [out] Output buffer for the JSON string of recognition parameters
public unsafe func MaaResourceGetDefaultRecognitionParam_wrap(res: CPointer<MaaResource>, reco_type: CString,
    buffer: CPointer<MaaStringBuffer>): MaaBool {
    return MaaResourceGetDefaultRecognitionParam(res, reco_type, buffer)
}

// @brief Get default action parameters for the specified type from DefaultPipelineMgr.
//
// @param action_type Action type string (e.g., "Click", "Swipe")
// @param buffer [out] Output buffer for the JSON string of action parameters
foreign func MaaResourceGetDefaultActionParam(res: CPointer<MaaResource>, action_type: CString,
    buffer: CPointer<MaaStringBuffer>): MaaBool

// @brief Get default action parameters for the specified type from DefaultPipelineMgr.
//
// @param action_type Action type string (e.g., "Click", "Swipe")
// @param buffer [out] Output buffer for the JSON string of action parameters
public unsafe func MaaResourceGetDefaultActionParam_wrap(res: CPointer<MaaResource>, action_type: CString,
    buffer: CPointer<MaaStringBuffer>): MaaBool {
    return MaaResourceGetDefaultActionParam(res, action_type, buffer)
}

foreign func MaaTaskerCreate(): CPointer<MaaTasker>

public unsafe func MaaTaskerCreate_wrap(): CPointer<MaaTasker> {
    return MaaTaskerCreate()
}

foreign func MaaTaskerDestroy(tasker: CPointer<MaaTasker>): Unit

public unsafe func MaaTaskerDestroy_wrap(tasker: CPointer<MaaTasker>): Unit {
    return MaaTaskerDestroy(tasker)
}

foreign func MaaTaskerAddSink(tasker: CPointer<MaaTasker>, sink: MaaEventCallback, trans_arg: CPointer<Unit>): MaaSinkId

public unsafe func MaaTaskerAddSink_wrap(tasker: CPointer<MaaTasker>, sink: MaaEventCallback, trans_arg: CPointer<Unit>): MaaSinkId {
    return MaaTaskerAddSink(tasker, sink, trans_arg)
}

foreign func MaaTaskerRemoveSink(tasker: CPointer<MaaTasker>, sink_id: MaaSinkId): Unit

public unsafe func MaaTaskerRemoveSink_wrap(tasker: CPointer<MaaTasker>, sink_id: MaaSinkId): Unit {
    return MaaTaskerRemoveSink(tasker, sink_id)
}

foreign func MaaTaskerClearSinks(tasker: CPointer<MaaTasker>): Unit

public unsafe func MaaTaskerClearSinks_wrap(tasker: CPointer<MaaTasker>): Unit {
    return MaaTaskerClearSinks(tasker)
}

foreign func MaaTaskerAddContextSink(tasker: CPointer<MaaTasker>, sink: MaaEventCallback, trans_arg: CPointer<Unit>): MaaSinkId

public unsafe func MaaTaskerAddContextSink_wrap(tasker: CPointer<MaaTasker>, sink: MaaEventCallback,
    trans_arg: CPointer<Unit>): MaaSinkId {
    return MaaTaskerAddContextSink(tasker, sink, trans_arg)
}

foreign func MaaTaskerRemoveContextSink(tasker: CPointer<MaaTasker>, sink_id: MaaSinkId): Unit

public unsafe func MaaTaskerRemoveContextSink_wrap(tasker: CPointer<MaaTasker>, sink_id: MaaSinkId): Unit {
    return MaaTaskerRemoveContextSink(tasker, sink_id)
}

foreign func MaaTaskerClearContextSinks(tasker: CPointer<MaaTasker>): Unit

public unsafe func MaaTaskerClearContextSinks_wrap(tasker: CPointer<MaaTasker>): Unit {
    return MaaTaskerClearContextSinks(tasker)
}

// @param[in] value
foreign func MaaTaskerSetOption(tasker: CPointer<MaaTasker>, key: MaaTaskerOption, value: MaaOptionValue,
    val_size: MaaOptionValueSize): MaaBool

// @param[in] value
public unsafe func MaaTaskerSetOption_wrap(tasker: CPointer<MaaTasker>, key: MaaTaskerOption, value: MaaOptionValue,
    val_size: MaaOptionValueSize): MaaBool {
    return MaaTaskerSetOption(tasker, key, value, val_size)
}

foreign func MaaTaskerBindResource(tasker: CPointer<MaaTasker>, res: CPointer<MaaResource>): MaaBool

public unsafe func MaaTaskerBindResource_wrap(tasker: CPointer<MaaTasker>, res: CPointer<MaaResource>): MaaBool {
    return MaaTaskerBindResource(tasker, res)
}

foreign func MaaTaskerBindController(tasker: CPointer<MaaTasker>, ctrl: CPointer<MaaController>): MaaBool

public unsafe func MaaTaskerBindController_wrap(tasker: CPointer<MaaTasker>, ctrl: CPointer<MaaController>): MaaBool {
    return MaaTaskerBindController(tasker, ctrl)
}

foreign func MaaTaskerInited(tasker: CPointer<MaaTasker>): MaaBool

public unsafe func MaaTaskerInited_wrap(tasker: CPointer<MaaTasker>): MaaBool {
    return MaaTaskerInited(tasker)
}

foreign func MaaTaskerPostTask(tasker: CPointer<MaaTasker>, entry: CString, pipeline_override: CString): MaaTaskId

public unsafe func MaaTaskerPostTask_wrap(tasker: CPointer<MaaTasker>, entry: CString, pipeline_override: CString): MaaTaskId {
    return MaaTaskerPostTask(tasker, entry, pipeline_override)
}

// @param reco_type Recognition type string
// @param reco_param Recognition parameters json
// @param image Previous screenshot
foreign func MaaTaskerPostRecognition(tasker: CPointer<MaaTasker>, reco_type: CString, reco_param: CString,
    image: CPointer<MaaImageBuffer>): MaaTaskId

// @param reco_type Recognition type string
// @param reco_param Recognition parameters json
// @param image Previous screenshot
public unsafe func MaaTaskerPostRecognition_wrap(tasker: CPointer<MaaTasker>, reco_type: CString, reco_param: CString,
    image: CPointer<MaaImageBuffer>): MaaTaskId {
    return MaaTaskerPostRecognition(tasker, reco_type, reco_param, image)
}

// @param action_type Action type string
// @param action_param Action parameters json
// @param box Previous recognition position
// @param reco_detail Previous recognition details
foreign func MaaTaskerPostAction(tasker: CPointer<MaaTasker>, action_type: CString, action_param: CString,
    box: CPointer<MaaRect>, reco_detail: CString): MaaTaskId

// @param action_type Action type string
// @param action_param Action parameters json
// @param box Previous recognition position
// @param reco_detail Previous recognition details
public unsafe func MaaTaskerPostAction_wrap(tasker: CPointer<MaaTasker>, action_type: CString, action_param: CString,
    box: CPointer<MaaRect>, reco_detail: CString): MaaTaskId {
    return MaaTaskerPostAction(tasker, action_type, action_param, box, reco_detail)
}

foreign func MaaTaskerStatus(tasker: CPointer<MaaTasker>, id: MaaTaskId): MaaStatus

public unsafe func MaaTaskerStatus_wrap(tasker: CPointer<MaaTasker>, id: MaaTaskId): MaaStatus {
    return MaaTaskerStatus(tasker, id)
}

foreign func MaaTaskerWait(tasker: CPointer<MaaTasker>, id: MaaTaskId): MaaStatus

public unsafe func MaaTaskerWait_wrap(tasker: CPointer<MaaTasker>, id: MaaTaskId): MaaStatus {
    return MaaTaskerWait(tasker, id)
}

foreign func MaaTaskerRunning(tasker: CPointer<MaaTasker>): MaaBool

public unsafe func MaaTaskerRunning_wrap(tasker: CPointer<MaaTasker>): MaaBool {
    return MaaTaskerRunning(tasker)
}

foreign func MaaTaskerPostStop(tasker: CPointer<MaaTasker>): MaaTaskId

public unsafe func MaaTaskerPostStop_wrap(tasker: CPointer<MaaTasker>): MaaTaskId {
    return MaaTaskerPostStop(tasker)
}

foreign func MaaTaskerStopping(tasker: CPointer<MaaTasker>): MaaBool

public unsafe func MaaTaskerStopping_wrap(tasker: CPointer<MaaTasker>): MaaBool {
    return MaaTaskerStopping(tasker)
}

foreign func MaaTaskerGetResource(tasker: CPointer<MaaTasker>): CPointer<MaaResource>

public unsafe func MaaTaskerGetResource_wrap(tasker: CPointer<MaaTasker>): CPointer<MaaResource> {
    return MaaTaskerGetResource(tasker)
}

foreign func MaaTaskerGetController(tasker: CPointer<MaaTasker>): CPointer<MaaController>

public unsafe func MaaTaskerGetController_wrap(tasker: CPointer<MaaTasker>): CPointer<MaaController> {
    return MaaTaskerGetController(tasker)
}

foreign func MaaTaskerClearCache(tasker: CPointer<MaaTasker>): MaaBool

public unsafe func MaaTaskerClearCache_wrap(tasker: CPointer<MaaTasker>): MaaBool {
    return MaaTaskerClearCache(tasker)
}

foreign func MaaTaskerOverridePipeline(tasker: CPointer<MaaTasker>, task_id: MaaTaskId, pipeline_override: CString): MaaBool

public unsafe func MaaTaskerOverridePipeline_wrap(tasker: CPointer<MaaTasker>, task_id: MaaTaskId,
    pipeline_override: CString): MaaBool {
    return MaaTaskerOverridePipeline(tasker, task_id, pipeline_override)
}

// @param[out] hit
foreign func MaaTaskerGetRecognitionDetail(tasker: CPointer<MaaTasker>, reco_id: MaaRecoId,
    node_name: CPointer<MaaStringBuffer>, algorithm: CPointer<MaaStringBuffer>, hit: CString, box: CPointer<MaaRect>,
    detail_json: CPointer<MaaStringBuffer>, raw: CPointer<MaaImageBuffer>, draws: CPointer<MaaImageListBuffer>): MaaBool

// @param[out] hit
public unsafe func MaaTaskerGetRecognitionDetail_wrap(tasker: CPointer<MaaTasker>, reco_id: MaaRecoId,
    node_name: CPointer<MaaStringBuffer>, algorithm: CPointer<MaaStringBuffer>, hit: CString, box: CPointer<MaaRect>,
    detail_json: CPointer<MaaStringBuffer>, raw: CPointer<MaaImageBuffer>, draws: CPointer<MaaImageListBuffer>): MaaBool {
    return MaaTaskerGetRecognitionDetail(tasker, reco_id, node_name, algorithm, hit, box, detail_json, raw, draws)
}

// @param[out] action
// @param[out] box
// @param[out] success
// @param[out] detail_json
foreign func MaaTaskerGetActionDetail(tasker: CPointer<MaaTasker>, action_id: MaaActId,
    node_name: CPointer<MaaStringBuffer>, action: CPointer<MaaStringBuffer>, box: CPointer<MaaRect>, success: CString,
    detail_json: CPointer<MaaStringBuffer>): MaaBool

// @param[out] action
// @param[out] box
// @param[out] success
// @param[out] detail_json
public unsafe func MaaTaskerGetActionDetail_wrap(tasker: CPointer<MaaTasker>, action_id: MaaActId,
    node_name: CPointer<MaaStringBuffer>, action: CPointer<MaaStringBuffer>, box: CPointer<MaaRect>, success: CString,
    detail_json: CPointer<MaaStringBuffer>): MaaBool {
    return MaaTaskerGetActionDetail(tasker, action_id, node_name, action, box, success, detail_json)
}

// @param[out] node_name
// @param[out] phase
// @param[out] success
// @param[out] elapsed_ms
// @param[out] reco_id_list
// @param[in, out] reco_id_list_size
// @param[out] roi
foreign func MaaTaskerGetWaitFreezesDetail(tasker: CPointer<MaaTasker>, wf_id: MaaWfId,
    node_name: CPointer<MaaStringBuffer>, phase: CPointer<MaaStringBuffer>, success: CString,
    elapsed_ms: CPointer<MaaSize>, reco_id_list: CPointer<MaaRecoId>, reco_id_list_size: CPointer<MaaSize>,
    roi: CPointer<MaaRect>): MaaBool

// @param[out] node_name
// @param[out] phase
// @param[out] success
// @param[out] elapsed_ms
// @param[out] reco_id_list
// @param[in, out] reco_id_list_size
// @param[out] roi
public unsafe func MaaTaskerGetWaitFreezesDetail_wrap(tasker: CPointer<MaaTasker>, wf_id: MaaWfId,
    node_name: CPointer<MaaStringBuffer>, phase: CPointer<MaaStringBuffer>, success: CString,
    elapsed_ms: CPointer<MaaSize>, reco_id_list: CPointer<MaaRecoId>, reco_id_list_size: CPointer<MaaSize>,
    roi: CPointer<MaaRect>): MaaBool {
    return MaaTaskerGetWaitFreezesDetail(tasker, wf_id, node_name, phase, success, elapsed_ms, reco_id_list,
        reco_id_list_size, roi)
}

// @param[out] reco_id
// @param[out] action_id
// @param[out] completed
foreign func MaaTaskerGetNodeDetail(tasker: CPointer<MaaTasker>, node_id: MaaNodeId,
    node_name: CPointer<MaaStringBuffer>, reco_id: CPointer<MaaRecoId>, action_id: CPointer<MaaActId>,
    completed: CString): MaaBool

// @param[out] reco_id
// @param[out] action_id
// @param[out] completed
public unsafe func MaaTaskerGetNodeDetail_wrap(tasker: CPointer<MaaTasker>, node_id: MaaNodeId,
    node_name: CPointer<MaaStringBuffer>, reco_id: CPointer<MaaRecoId>, action_id: CPointer<MaaActId>,
    completed: CString): MaaBool {
    return MaaTaskerGetNodeDetail(tasker, node_id, node_name, reco_id, action_id, completed)
}

// @param[out] node_id_list
// @param[in, out] node_id_list_size
// @param[out] status
foreign func MaaTaskerGetTaskDetail(tasker: CPointer<MaaTasker>, task_id: MaaTaskId, entry: CPointer<MaaStringBuffer>,
    node_id_list: CPointer<MaaNodeId>, node_id_list_size: CPointer<MaaSize>, status: CPointer<MaaStatus>): MaaBool

// @param[out] node_id_list
// @param[in, out] node_id_list_size
// @param[out] status
public unsafe func MaaTaskerGetTaskDetail_wrap(tasker: CPointer<MaaTasker>, task_id: MaaTaskId,
    entry: CPointer<MaaStringBuffer>, node_id_list: CPointer<MaaNodeId>, node_id_list_size: CPointer<MaaSize>,
    status: CPointer<MaaStatus>): MaaBool {
    return MaaTaskerGetTaskDetail(tasker, task_id, entry, node_id_list, node_id_list_size, status)
}

// @param[out] latest_id
foreign func MaaTaskerGetLatestNode(tasker: CPointer<MaaTasker>, node_name: CString, latest_id: CPointer<MaaNodeId>): MaaBool

// @param[out] latest_id
public unsafe func MaaTaskerGetLatestNode_wrap(tasker: CPointer<MaaTasker>, node_name: CString,
    latest_id: CPointer<MaaNodeId>): MaaBool {
    return MaaTaskerGetLatestNode(tasker, node_name, latest_id)
}

foreign func MaaStringBufferCreate(): CPointer<MaaStringBuffer>

public unsafe func MaaStringBufferCreate_wrap(): CPointer<MaaStringBuffer> {
    return MaaStringBufferCreate()
}

foreign func MaaStringBufferDestroy(handle: CPointer<MaaStringBuffer>): Unit

public unsafe func MaaStringBufferDestroy_wrap(handle: CPointer<MaaStringBuffer>): Unit {
    return MaaStringBufferDestroy(handle)
}

foreign func MaaStringBufferIsEmpty(handle: CPointer<MaaStringBuffer>): MaaBool

public unsafe func MaaStringBufferIsEmpty_wrap(handle: CPointer<MaaStringBuffer>): MaaBool {
    return MaaStringBufferIsEmpty(handle)
}

foreign func MaaStringBufferClear(handle: CPointer<MaaStringBuffer>): MaaBool

public unsafe func MaaStringBufferClear_wrap(handle: CPointer<MaaStringBuffer>): MaaBool {
    return MaaStringBufferClear(handle)
}

foreign func MaaStringBufferGet(handle: CPointer<MaaStringBuffer>): CString

public unsafe func MaaStringBufferGet_wrap(handle: CPointer<MaaStringBuffer>): CString {
    return MaaStringBufferGet(handle)
}

foreign func MaaStringBufferSize(handle: CPointer<MaaStringBuffer>): MaaSize

public unsafe func MaaStringBufferSize_wrap(handle: CPointer<MaaStringBuffer>): MaaSize {
    return MaaStringBufferSize(handle)
}

foreign func MaaStringBufferSet(handle: CPointer<MaaStringBuffer>, str: CString): MaaBool

public unsafe func MaaStringBufferSet_wrap(handle: CPointer<MaaStringBuffer>, str: CString): MaaBool {
    return MaaStringBufferSet(handle, str)
}

foreign func MaaStringBufferSetEx(handle: CPointer<MaaStringBuffer>, str: CString, size: MaaSize): MaaBool

public unsafe func MaaStringBufferSetEx_wrap(handle: CPointer<MaaStringBuffer>, str: CString, size: MaaSize): MaaBool {
    return MaaStringBufferSetEx(handle, str, size)
}

foreign func MaaStringListBufferCreate(): CPointer<MaaStringListBuffer>

public unsafe func MaaStringListBufferCreate_wrap(): CPointer<MaaStringListBuffer> {
    return MaaStringListBufferCreate()
}

foreign func MaaStringListBufferDestroy(handle: CPointer<MaaStringListBuffer>): Unit

public unsafe func MaaStringListBufferDestroy_wrap(handle: CPointer<MaaStringListBuffer>): Unit {
    return MaaStringListBufferDestroy(handle)
}

foreign func MaaStringListBufferIsEmpty(handle: CPointer<MaaStringListBuffer>): MaaBool

public unsafe func MaaStringListBufferIsEmpty_wrap(handle: CPointer<MaaStringListBuffer>): MaaBool {
    return MaaStringListBufferIsEmpty(handle)
}

foreign func MaaStringListBufferSize(handle: CPointer<MaaStringListBuffer>): MaaSize

public unsafe func MaaStringListBufferSize_wrap(handle: CPointer<MaaStringListBuffer>): MaaSize {
    return MaaStringListBufferSize(handle)
}

// return a string view, don't destory it
foreign func MaaStringListBufferAt(handle: CPointer<MaaStringListBuffer>, index: MaaSize): CPointer<MaaStringBuffer>

// return a string view, don't destory it
public unsafe func MaaStringListBufferAt_wrap(handle: CPointer<MaaStringListBuffer>, index: MaaSize): CPointer<MaaStringBuffer> {
    return MaaStringListBufferAt(handle, index)
}

// append a deep copy of value, you still need to destory it.
foreign func MaaStringListBufferAppend(handle: CPointer<MaaStringListBuffer>, value: CPointer<MaaStringBuffer>): MaaBool

// append a deep copy of value, you still need to destory it.
public unsafe func MaaStringListBufferAppend_wrap(handle: CPointer<MaaStringListBuffer>,
    value: CPointer<MaaStringBuffer>): MaaBool {
    return MaaStringListBufferAppend(handle, value)
}

foreign func MaaStringListBufferRemove(handle: CPointer<MaaStringListBuffer>, index: MaaSize): MaaBool

public unsafe func MaaStringListBufferRemove_wrap(handle: CPointer<MaaStringListBuffer>, index: MaaSize): MaaBool {
    return MaaStringListBufferRemove(handle, index)
}

foreign func MaaStringListBufferClear(handle: CPointer<MaaStringListBuffer>): MaaBool

public unsafe func MaaStringListBufferClear_wrap(handle: CPointer<MaaStringListBuffer>): MaaBool {
    return MaaStringListBufferClear(handle)
}

foreign func MaaImageBufferCreate(): CPointer<MaaImageBuffer>

public unsafe func MaaImageBufferCreate_wrap(): CPointer<MaaImageBuffer> {
    return MaaImageBufferCreate()
}

foreign func MaaImageBufferDestroy(handle: CPointer<MaaImageBuffer>): Unit

public unsafe func MaaImageBufferDestroy_wrap(handle: CPointer<MaaImageBuffer>): Unit {
    return MaaImageBufferDestroy(handle)
}

foreign func MaaImageBufferIsEmpty(handle: CPointer<MaaImageBuffer>): MaaBool

public unsafe func MaaImageBufferIsEmpty_wrap(handle: CPointer<MaaImageBuffer>): MaaBool {
    return MaaImageBufferIsEmpty(handle)
}

foreign func MaaImageBufferClear(handle: CPointer<MaaImageBuffer>): MaaBool

public unsafe func MaaImageBufferClear_wrap(handle: CPointer<MaaImageBuffer>): MaaBool {
    return MaaImageBufferClear(handle)
}

public type MaaImageRawData = CPointer<Unit>

foreign func MaaImageBufferGetRawData(handle: CPointer<MaaImageBuffer>): MaaImageRawData

public unsafe func MaaImageBufferGetRawData_wrap(handle: CPointer<MaaImageBuffer>): MaaImageRawData {
    return MaaImageBufferGetRawData(handle)
}

foreign func MaaImageBufferWidth(handle: CPointer<MaaImageBuffer>): Int32

public unsafe func MaaImageBufferWidth_wrap(handle: CPointer<MaaImageBuffer>): Int32 {
    return MaaImageBufferWidth(handle)
}

foreign func MaaImageBufferHeight(handle: CPointer<MaaImageBuffer>): Int32

public unsafe func MaaImageBufferHeight_wrap(handle: CPointer<MaaImageBuffer>): Int32 {
    return MaaImageBufferHeight(handle)
}

foreign func MaaImageBufferChannels(handle: CPointer<MaaImageBuffer>): Int32

public unsafe func MaaImageBufferChannels_wrap(handle: CPointer<MaaImageBuffer>): Int32 {
    return MaaImageBufferChannels(handle)
}

foreign func MaaImageBufferType(handle: CPointer<MaaImageBuffer>): Int32

public unsafe func MaaImageBufferType_wrap(handle: CPointer<MaaImageBuffer>): Int32 {
    return MaaImageBufferType(handle)
}

foreign func MaaImageBufferSetRawData(handle: CPointer<MaaImageBuffer>, data: MaaImageRawData, width: Int32,
    height: Int32, type_: Int32): MaaBool

public unsafe func MaaImageBufferSetRawData_wrap(handle: CPointer<MaaImageBuffer>, data: MaaImageRawData, width: Int32,
    height: Int32, type_: Int32): MaaBool {
    return MaaImageBufferSetRawData(handle, data, width, height, type_)
}

foreign func MaaImageBufferResize(handle: CPointer<MaaImageBuffer>, width: Int32, height: Int32): MaaBool

public unsafe func MaaImageBufferResize_wrap(handle: CPointer<MaaImageBuffer>, width: Int32, height: Int32): MaaBool {
    return MaaImageBufferResize(handle, width, height)
}

public type MaaImageEncodedData = CString

foreign func MaaImageBufferGetEncoded(handle: CPointer<MaaImageBuffer>): MaaImageEncodedData

public unsafe func MaaImageBufferGetEncoded_wrap(handle: CPointer<MaaImageBuffer>): MaaImageEncodedData {
    return MaaImageBufferGetEncoded(handle)
}

foreign func MaaImageBufferGetEncodedSize(handle: CPointer<MaaImageBuffer>): MaaSize

public unsafe func MaaImageBufferGetEncodedSize_wrap(handle: CPointer<MaaImageBuffer>): MaaSize {
    return MaaImageBufferGetEncodedSize(handle)
}

foreign func MaaImageBufferSetEncoded(handle: CPointer<MaaImageBuffer>, data: MaaImageEncodedData, size: MaaSize): MaaBool

public unsafe func MaaImageBufferSetEncoded_wrap(handle: CPointer<MaaImageBuffer>, data: MaaImageEncodedData,
    size: MaaSize): MaaBool {
    return MaaImageBufferSetEncoded(handle, data, size)
}

foreign func MaaImageListBufferCreate(): CPointer<MaaImageListBuffer>

public unsafe func MaaImageListBufferCreate_wrap(): CPointer<MaaImageListBuffer> {
    return MaaImageListBufferCreate()
}

foreign func MaaImageListBufferDestroy(handle: CPointer<MaaImageListBuffer>): Unit

public unsafe func MaaImageListBufferDestroy_wrap(handle: CPointer<MaaImageListBuffer>): Unit {
    return MaaImageListBufferDestroy(handle)
}

foreign func MaaImageListBufferIsEmpty(handle: CPointer<MaaImageListBuffer>): MaaBool

public unsafe func MaaImageListBufferIsEmpty_wrap(handle: CPointer<MaaImageListBuffer>): MaaBool {
    return MaaImageListBufferIsEmpty(handle)
}

foreign func MaaImageListBufferSize(handle: CPointer<MaaImageListBuffer>): MaaSize

public unsafe func MaaImageListBufferSize_wrap(handle: CPointer<MaaImageListBuffer>): MaaSize {
    return MaaImageListBufferSize(handle)
}

// return an image view, don't destory it
foreign func MaaImageListBufferAt(handle: CPointer<MaaImageListBuffer>, index: MaaSize): CPointer<MaaImageBuffer>

// return an image view, don't destory it
public unsafe func MaaImageListBufferAt_wrap(handle: CPointer<MaaImageListBuffer>, index: MaaSize): CPointer<MaaImageBuffer> {
    return MaaImageListBufferAt(handle, index)
}

// append a deep copy of value, you still need to destory it.
foreign func MaaImageListBufferAppend(handle: CPointer<MaaImageListBuffer>, value: CPointer<MaaImageBuffer>): MaaBool

// append a deep copy of value, you still need to destory it.
public unsafe func MaaImageListBufferAppend_wrap(handle: CPointer<MaaImageListBuffer>, value: CPointer<MaaImageBuffer>): MaaBool {
    return MaaImageListBufferAppend(handle, value)
}

foreign func MaaImageListBufferRemove(handle: CPointer<MaaImageListBuffer>, index: MaaSize): MaaBool

public unsafe func MaaImageListBufferRemove_wrap(handle: CPointer<MaaImageListBuffer>, index: MaaSize): MaaBool {
    return MaaImageListBufferRemove(handle, index)
}

foreign func MaaImageListBufferClear(handle: CPointer<MaaImageListBuffer>): MaaBool

public unsafe func MaaImageListBufferClear_wrap(handle: CPointer<MaaImageListBuffer>): MaaBool {
    return MaaImageListBufferClear(handle)
}

foreign func MaaRectCreate(): CPointer<MaaRect>

public unsafe func MaaRectCreate_wrap(): CPointer<MaaRect> {
    return MaaRectCreate()
}

foreign func MaaRectDestroy(handle: CPointer<MaaRect>): Unit

public unsafe func MaaRectDestroy_wrap(handle: CPointer<MaaRect>): Unit {
    return MaaRectDestroy(handle)
}

foreign func MaaRectGetX(handle: CPointer<MaaRect>): Int32

public unsafe func MaaRectGetX_wrap(handle: CPointer<MaaRect>): Int32 {
    return MaaRectGetX(handle)
}

foreign func MaaRectGetY(handle: CPointer<MaaRect>): Int32

public unsafe func MaaRectGetY_wrap(handle: CPointer<MaaRect>): Int32 {
    return MaaRectGetY(handle)
}

foreign func MaaRectGetW(handle: CPointer<MaaRect>): Int32

public unsafe func MaaRectGetW_wrap(handle: CPointer<MaaRect>): Int32 {
    return MaaRectGetW(handle)
}

foreign func MaaRectGetH(handle: CPointer<MaaRect>): Int32

public unsafe func MaaRectGetH_wrap(handle: CPointer<MaaRect>): Int32 {
    return MaaRectGetH(handle)
}

foreign func MaaRectSet(handle: CPointer<MaaRect>, x: Int32, y: Int32, w: Int32, h: Int32): MaaBool

public unsafe func MaaRectSet_wrap(handle: CPointer<MaaRect>, x: Int32, y: Int32, w: Int32, h: Int32): MaaBool {
    return MaaRectSet(handle, x, y, w, h)
}

foreign func MaaVersion(): CString

public unsafe func MaaVersion_wrap(): CString {
    return MaaVersion()
}

@C
public struct MaaToolkitAdbDevice {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaToolkitAdbDeviceList {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaToolkitDesktopWindow {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaToolkitDesktopWindowList {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaToolkitPortalHelper {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaToolkitGamescopeInstance {
    init() {
        throw Exception("type should not be inited")
    }
}

@C
public struct MaaToolkitGamescopeInstanceList {
    init() {
        throw Exception("type should not be inited")
    }
}

public const MaaMacOSPermissionEnum_MaaMacOSPermissionScreenCapture: MaaMacOSPermissionEnum = 1
public const MaaMacOSPermissionEnum_MaaMacOSPermissionAccessibility: MaaMacOSPermissionEnum = 2

public type MaaMacOSPermissionEnum = UInt32

public type MaaMacOSPermission = Int32

foreign func MaaToolkitAdbDeviceListCreate(): CPointer<MaaToolkitAdbDeviceList>

public unsafe func MaaToolkitAdbDeviceListCreate_wrap(): CPointer<MaaToolkitAdbDeviceList> {
    return MaaToolkitAdbDeviceListCreate()
}

foreign func MaaToolkitAdbDeviceListDestroy(handle: CPointer<MaaToolkitAdbDeviceList>): Unit

public unsafe func MaaToolkitAdbDeviceListDestroy_wrap(handle: CPointer<MaaToolkitAdbDeviceList>): Unit {
    return MaaToolkitAdbDeviceListDestroy(handle)
}

foreign func MaaToolkitAdbDeviceFind(buffer: CPointer<MaaToolkitAdbDeviceList>): MaaBool

public unsafe func MaaToolkitAdbDeviceFind_wrap(buffer: CPointer<MaaToolkitAdbDeviceList>): MaaBool {
    return MaaToolkitAdbDeviceFind(buffer)
}

foreign func MaaToolkitAdbDeviceFindSpecified(adb_path: CString, buffer: CPointer<MaaToolkitAdbDeviceList>): MaaBool

public unsafe func MaaToolkitAdbDeviceFindSpecified_wrap(adb_path: CString, buffer: CPointer<MaaToolkitAdbDeviceList>): MaaBool {
    return MaaToolkitAdbDeviceFindSpecified(adb_path, buffer)
}

foreign func MaaToolkitAdbDeviceListSize(list: CPointer<MaaToolkitAdbDeviceList>): MaaSize

public unsafe func MaaToolkitAdbDeviceListSize_wrap(list: CPointer<MaaToolkitAdbDeviceList>): MaaSize {
    return MaaToolkitAdbDeviceListSize(list)
}

foreign func MaaToolkitAdbDeviceListAt(list: CPointer<MaaToolkitAdbDeviceList>, index: MaaSize): CPointer<MaaToolkitAdbDevice>

public unsafe func MaaToolkitAdbDeviceListAt_wrap(list: CPointer<MaaToolkitAdbDeviceList>, index: MaaSize): CPointer<MaaToolkitAdbDevice> {
    return MaaToolkitAdbDeviceListAt(list, index)
}

foreign func MaaToolkitAdbDeviceGetName(device: CPointer<MaaToolkitAdbDevice>): CString

public unsafe func MaaToolkitAdbDeviceGetName_wrap(device: CPointer<MaaToolkitAdbDevice>): CString {
    return MaaToolkitAdbDeviceGetName(device)
}

foreign func MaaToolkitAdbDeviceGetAdbPath(device: CPointer<MaaToolkitAdbDevice>): CString

public unsafe func MaaToolkitAdbDeviceGetAdbPath_wrap(device: CPointer<MaaToolkitAdbDevice>): CString {
    return MaaToolkitAdbDeviceGetAdbPath(device)
}

foreign func MaaToolkitAdbDeviceGetAddress(device: CPointer<MaaToolkitAdbDevice>): CString

public unsafe func MaaToolkitAdbDeviceGetAddress_wrap(device: CPointer<MaaToolkitAdbDevice>): CString {
    return MaaToolkitAdbDeviceGetAddress(device)
}

foreign func MaaToolkitAdbDeviceGetScreencapMethods(device: CPointer<MaaToolkitAdbDevice>): MaaAdbScreencapMethod

public unsafe func MaaToolkitAdbDeviceGetScreencapMethods_wrap(device: CPointer<MaaToolkitAdbDevice>): MaaAdbScreencapMethod {
    return MaaToolkitAdbDeviceGetScreencapMethods(device)
}

foreign func MaaToolkitAdbDeviceGetInputMethods(device: CPointer<MaaToolkitAdbDevice>): MaaAdbInputMethod

public unsafe func MaaToolkitAdbDeviceGetInputMethods_wrap(device: CPointer<MaaToolkitAdbDevice>): MaaAdbInputMethod {
    return MaaToolkitAdbDeviceGetInputMethods(device)
}

foreign func MaaToolkitAdbDeviceGetConfig(device: CPointer<MaaToolkitAdbDevice>): CString

public unsafe func MaaToolkitAdbDeviceGetConfig_wrap(device: CPointer<MaaToolkitAdbDevice>): CString {
    return MaaToolkitAdbDeviceGetConfig(device)
}

foreign func MaaToolkitConfigInitOption(user_path: CString, default_json: CString): MaaBool

public unsafe func MaaToolkitConfigInitOption_wrap(user_path: CString, default_json: CString): MaaBool {
    return MaaToolkitConfigInitOption(user_path, default_json)
}

foreign func MaaToolkitDesktopWindowListCreate(): CPointer<MaaToolkitDesktopWindowList>

public unsafe func MaaToolkitDesktopWindowListCreate_wrap(): CPointer<MaaToolkitDesktopWindowList> {
    return MaaToolkitDesktopWindowListCreate()
}

foreign func MaaToolkitDesktopWindowListDestroy(handle: CPointer<MaaToolkitDesktopWindowList>): Unit

public unsafe func MaaToolkitDesktopWindowListDestroy_wrap(handle: CPointer<MaaToolkitDesktopWindowList>): Unit {
    return MaaToolkitDesktopWindowListDestroy(handle)
}

foreign func MaaToolkitDesktopWindowFindAll(buffer: CPointer<MaaToolkitDesktopWindowList>): MaaBool

public unsafe func MaaToolkitDesktopWindowFindAll_wrap(buffer: CPointer<MaaToolkitDesktopWindowList>): MaaBool {
    return MaaToolkitDesktopWindowFindAll(buffer)
}

foreign func MaaToolkitDesktopWindowListSize(list: CPointer<MaaToolkitDesktopWindowList>): MaaSize

public unsafe func MaaToolkitDesktopWindowListSize_wrap(list: CPointer<MaaToolkitDesktopWindowList>): MaaSize {
    return MaaToolkitDesktopWindowListSize(list)
}

foreign func MaaToolkitDesktopWindowListAt(list: CPointer<MaaToolkitDesktopWindowList>, index: MaaSize): CPointer<MaaToolkitDesktopWindow>

public unsafe func MaaToolkitDesktopWindowListAt_wrap(list: CPointer<MaaToolkitDesktopWindowList>, index: MaaSize): CPointer<MaaToolkitDesktopWindow> {
    return MaaToolkitDesktopWindowListAt(list, index)
}

// Win32: HWND
// macOS: CGWindowID (SCWindow.windowID), force-cast to void*, NOT NSWindow*
foreign func MaaToolkitDesktopWindowGetHandle(window: CPointer<MaaToolkitDesktopWindow>): CPointer<Unit>

// Win32: HWND
// macOS: CGWindowID (SCWindow.windowID), force-cast to void*, NOT NSWindow*
public unsafe func MaaToolkitDesktopWindowGetHandle_wrap(window: CPointer<MaaToolkitDesktopWindow>): CPointer<Unit> {
    return MaaToolkitDesktopWindowGetHandle(window)
}

// Win32: window class name
// macOS: bundle identifier (SCWindow.owningApplication.bundleIdentifier)
foreign func MaaToolkitDesktopWindowGetClassName(window: CPointer<MaaToolkitDesktopWindow>): CString

// Win32: window class name
// macOS: bundle identifier (SCWindow.owningApplication.bundleIdentifier)
public unsafe func MaaToolkitDesktopWindowGetClassName_wrap(window: CPointer<MaaToolkitDesktopWindow>): CString {
    return MaaToolkitDesktopWindowGetClassName(window)
}

// Win32: window name
// macOS: window title (SCWindow.title)
foreign func MaaToolkitDesktopWindowGetWindowName(window: CPointer<MaaToolkitDesktopWindow>): CString

// Win32: window name
// macOS: window title (SCWindow.title)
public unsafe func MaaToolkitDesktopWindowGetWindowName_wrap(window: CPointer<MaaToolkitDesktopWindow>): CString {
    return MaaToolkitDesktopWindowGetWindowName(window)
}

foreign func MaaToolkitGamescopeInstanceListCreate(): CPointer<MaaToolkitGamescopeInstanceList>

public unsafe func MaaToolkitGamescopeInstanceListCreate_wrap(): CPointer<MaaToolkitGamescopeInstanceList> {
    return MaaToolkitGamescopeInstanceListCreate()
}

foreign func MaaToolkitGamescopeInstanceListDestroy(handle: CPointer<MaaToolkitGamescopeInstanceList>): Unit

public unsafe func MaaToolkitGamescopeInstanceListDestroy_wrap(handle: CPointer<MaaToolkitGamescopeInstanceList>): Unit {
    return MaaToolkitGamescopeInstanceListDestroy(handle)
}

foreign func MaaToolkitGamescopeInstanceFindAll(buffer: CPointer<MaaToolkitGamescopeInstanceList>): MaaBool

public unsafe func MaaToolkitGamescopeInstanceFindAll_wrap(buffer: CPointer<MaaToolkitGamescopeInstanceList>): MaaBool {
    return MaaToolkitGamescopeInstanceFindAll(buffer)
}

foreign func MaaToolkitGamescopeInstanceListSize(list: CPointer<MaaToolkitGamescopeInstanceList>): MaaSize

public unsafe func MaaToolkitGamescopeInstanceListSize_wrap(list: CPointer<MaaToolkitGamescopeInstanceList>): MaaSize {
    return MaaToolkitGamescopeInstanceListSize(list)
}

foreign func MaaToolkitGamescopeInstanceListAt(list: CPointer<MaaToolkitGamescopeInstanceList>, index: MaaSize): CPointer<MaaToolkitGamescopeInstance>

public unsafe func MaaToolkitGamescopeInstanceListAt_wrap(list: CPointer<MaaToolkitGamescopeInstanceList>,
    index: MaaSize): CPointer<MaaToolkitGamescopeInstance> {
    return MaaToolkitGamescopeInstanceListAt(list, index)
}

foreign func MaaToolkitGamescopeInstanceGetDisplayNo(instance: CPointer<MaaToolkitGamescopeInstance>): UInt32

public unsafe func MaaToolkitGamescopeInstanceGetDisplayNo_wrap(instance: CPointer<MaaToolkitGamescopeInstance>): UInt32 {
    return MaaToolkitGamescopeInstanceGetDisplayNo(instance)
}

foreign func MaaToolkitGamescopeInstanceGetPipeWireNodeId(instance: CPointer<MaaToolkitGamescopeInstance>): UInt32

public unsafe func MaaToolkitGamescopeInstanceGetPipeWireNodeId_wrap(instance: CPointer<MaaToolkitGamescopeInstance>): UInt32 {
    return MaaToolkitGamescopeInstanceGetPipeWireNodeId(instance)
}

foreign func MaaToolkitGamescopeInstanceGetEisSocketPath(instance: CPointer<MaaToolkitGamescopeInstance>): CString

public unsafe func MaaToolkitGamescopeInstanceGetEisSocketPath_wrap(instance: CPointer<MaaToolkitGamescopeInstance>): CString {
    return MaaToolkitGamescopeInstanceGetEisSocketPath(instance)
}

foreign func MaaToolkitMacOSCheckPermission(perm: MaaMacOSPermission): MaaBool

public unsafe func MaaToolkitMacOSCheckPermission_wrap(perm: MaaMacOSPermission): MaaBool {
    return MaaToolkitMacOSCheckPermission(perm)
}

foreign func MaaToolkitMacOSRequestPermission(perm: MaaMacOSPermission): MaaBool

public unsafe func MaaToolkitMacOSRequestPermission_wrap(perm: MaaMacOSPermission): MaaBool {
    return MaaToolkitMacOSRequestPermission(perm)
}

foreign func MaaToolkitMacOSRevealPermissionSettings(perm: MaaMacOSPermission): MaaBool

public unsafe func MaaToolkitMacOSRevealPermissionSettings_wrap(perm: MaaMacOSPermission): MaaBool {
    return MaaToolkitMacOSRevealPermissionSettings(perm)
}

foreign func MaaToolkitPortalHelperCreate(): CPointer<MaaToolkitPortalHelper>

public unsafe func MaaToolkitPortalHelperCreate_wrap(): CPointer<MaaToolkitPortalHelper> {
    return MaaToolkitPortalHelperCreate()
}

foreign func MaaToolkitPortalHelperDestroy(helper: CPointer<MaaToolkitPortalHelper>): Unit

public unsafe func MaaToolkitPortalHelperDestroy_wrap(helper: CPointer<MaaToolkitPortalHelper>): Unit {
    return MaaToolkitPortalHelperDestroy(helper)
}

foreign func MaaToolkitPortalHelperOpenStream(helper: CPointer<MaaToolkitPortalHelper>): MaaBool

public unsafe func MaaToolkitPortalHelperOpenStream_wrap(helper: CPointer<MaaToolkitPortalHelper>): MaaBool {
    return MaaToolkitPortalHelperOpenStream(helper)
}

foreign func MaaToolkitPortalHelperGetPersist(helper: CPointer<MaaToolkitPortalHelper>): MaaBool

public unsafe func MaaToolkitPortalHelperGetPersist_wrap(helper: CPointer<MaaToolkitPortalHelper>): MaaBool {
    return MaaToolkitPortalHelperGetPersist(helper)
}

foreign func MaaToolkitPortalHelperSetPersist(helper: CPointer<MaaToolkitPortalHelper>, enable: MaaBool): Unit

public unsafe func MaaToolkitPortalHelperSetPersist_wrap(helper: CPointer<MaaToolkitPortalHelper>, enable: MaaBool): Unit {
    return MaaToolkitPortalHelperSetPersist(helper, enable)
}

foreign func MaaToolkitPortalHelperGetPipeWireFD(helper: CPointer<MaaToolkitPortalHelper>): Int32

public unsafe func MaaToolkitPortalHelperGetPipeWireFD_wrap(helper: CPointer<MaaToolkitPortalHelper>): Int32 {
    return MaaToolkitPortalHelperGetPipeWireFD(helper)
}

foreign func MaaToolkitPortalHelperGetPipeWireNodeID(helper: CPointer<MaaToolkitPortalHelper>): UInt32

public unsafe func MaaToolkitPortalHelperGetPipeWireNodeID_wrap(helper: CPointer<MaaToolkitPortalHelper>): UInt32 {
    return MaaToolkitPortalHelperGetPipeWireNodeID(helper)
}

foreign func MaaToolkitPortalHelperGetRestoreToken(helper: CPointer<MaaToolkitPortalHelper>): CString

public unsafe func MaaToolkitPortalHelperGetRestoreToken_wrap(helper: CPointer<MaaToolkitPortalHelper>): CString {
    return MaaToolkitPortalHelperGetRestoreToken(helper)
}

foreign func MaaToolkitPortalHelperSetRestoreToken(helper: CPointer<MaaToolkitPortalHelper>, token: CString): Unit

public unsafe func MaaToolkitPortalHelperSetRestoreToken_wrap(helper: CPointer<MaaToolkitPortalHelper>, token: CString): Unit {
    return MaaToolkitPortalHelperSetRestoreToken(helper, token)
}
