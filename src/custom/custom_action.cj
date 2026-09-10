package maa.custom

import maa.types.*

public abstract class CustomAction {
    public init() {}

    public open func run(context: Context, param: CustomActionParam): CustomActionResult {
        return CustomActionResult.successful()
    }
}
