package maa.pipeline

import maa.types.Rect

private func escapeJson(s: String): String {
    let sb = StringBuilder()
    for (ch in s.runes()) {
        if (ch == r'"') {
            sb.append("\\\"")
        } else if (ch == r'\\') {
            sb.append("\\\\")
        } else if (ch == r'\n') {
            sb.append("\\n")
        } else if (ch == r'\r') {
            sb.append("\\r")
        } else if (ch == r'\t') {
            sb.append("\\t")
        } else {
            sb.append(ch)
        }
    }
    return sb.toString()
}

public class Action {
    public let typeName: String
    public let paramJson: String

    public init(typeName: String, paramJson!: String = "") {
        this.typeName = typeName
        this.paramJson = paramJson
    }

    public static func click(target!: Option<Rect> = None): Action {
        match (target) {
            case Some(t) =>
                let p = '{"target":[' + "${t.x},${t.y},${t.width},${t.height}" + ']}'
                return Action("Click", paramJson: p)
            case None => return Action("Click")
        }
    }

    public static func swipe(
        x1: Int32,
        y1: Int32,
        x2: Int32,
        y2: Int32,
        duration!: Int32 = 500
    ): Action {
        let p = '{"begin":[' + "${x1},${y1},0,0" + '],"end":[' + "${x2},${y2},0,0" + '],"duration":' + "${duration}" + '}'
        return Action("Swipe", paramJson: p)
    }

    public static func keyClick(key: Int32): Action {
        let p = '{"key":' + "${key}" + '}'
        return Action("KeyClick", paramJson: p)
    }

    public static func inputText(text: String): Action {
        let p = '{"input_text":"' + escapeJson(text) + '"}'
        return Action("InputText", paramJson: p)
    }

    public static func doNothing(): Action {
        return Action("DoNothing")
    }

    public static func custom(customAction: String, customParam!: String = "{}"): Action {
        let p = '{"custom_action":"' + escapeJson(customAction) + '","custom_action_param":' + customParam + '}'
        return Action("Custom", paramJson: p)
    }

    public func toJson(): String {
        if (this.paramJson.isEmpty() || this.paramJson == "{}") {
            return '{"type":"' + escapeJson(this.typeName) + '"}'
        }
        return '{"type":"' + escapeJson(this.typeName) + '","param":' + this.paramJson + '}'
    }

    public func toString(): String {
        return this.toJson()
    }
}
