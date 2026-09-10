package maa.custom

import maa.types.*
import maa.buffer.*

public abstract class CustomRecognition {
    public init() {}

    public open func run(
        context: Context,
        image: ImageBuffer,
        param: CustomRecognitionParam
    ): CustomRecognitionResult {
        return CustomRecognitionResult.missed()
    }
}
