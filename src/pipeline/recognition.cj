package maa.pipeline

import maa.types.Rect
import std.collection.ArrayList

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

public class Recognition {
    public let typeName: String
    public let paramJson: String

    public init(typeName: String, paramJson!: String = "") {
        this.typeName = typeName
        this.paramJson = paramJson
    }

    public static func directHit(): Recognition {
        return Recognition("DirectHit")
    }

    public static func templateMatch(
        template: String,
        roi!: Rect = Rect(0, 0, 0, 0),
        threshold!: Float64 = 0.7
    ): Recognition {
        var p = StringBuilder()
        p.append('{"template":"' + escapeJson(template) + '"')
        if (roi.width > 0 && roi.height > 0) {
            p.append(',"roi":[' + "${roi.x},${roi.y},${roi.width},${roi.height}" + ']')
        }
        p.append(',"threshold":' + "${threshold}")
        p.append('}')
        return Recognition("TemplateMatch", paramJson: p.toString())
    }

    public static func ocr(
        expected!: Array<String> = Array<String>(),
        roi!: Rect = Rect(0, 0, 0, 0),
        threshold!: Float64 = 0.0
    ): Recognition {
        var p = StringBuilder()
        p.append('{')
        var hasPrev = false
        if (!expected.isEmpty()) {
            p.append('"expected":[')
            for (i in 0..expected.size) {
                if (i > 0) {
                    p.append(',')
                }
                p.append('"' + escapeJson(expected[i]) + '"')
            }
            p.append(']')
            hasPrev = true
        }
        if (roi.width > 0 && roi.height > 0) {
            if (hasPrev) { p.append(',') }
            p.append('"roi":[' + "${roi.x},${roi.y},${roi.width},${roi.height}" + ']')
            hasPrev = true
        }
        if (threshold > 0.0) {
            if (hasPrev) { p.append(',') }
            p.append('"threshold":' + "${threshold}")
        }
        p.append('}')
        return Recognition("OCR", paramJson: p.toString())
    }

    public static func colorMatch(
        lower: Array<Int32>,
        upper: Array<Int32>,
        roi!: Rect = Rect(0, 0, 0, 0),
        count!: Int32 = 1
    ): Recognition {
        var p = StringBuilder()
        p.append('{')
        p.append('"lower":[' + "${lower[0]},${lower[1]},${lower[2]}" + '],')
        p.append('"upper":[' + "${upper[0]},${upper[1]},${upper[2]}" + ']')
        if (roi.width > 0 && roi.height > 0) {
            p.append(',"roi":[' + "${roi.x},${roi.y},${roi.width},${roi.height}" + ']')
        }
        if (count > 1) {
            p.append(',"count":' + "${count}")
        }
        p.append('}')
        return Recognition("ColorMatch", paramJson: p.toString())
    }

    public static func custom(customRecognition: String, customParam!: String = "{}"): Recognition {
        let p = '{"custom_recognition":"' + escapeJson(customRecognition) + '","custom_recognition_param":' + customParam + '}'
        return Recognition("Custom", paramJson: p)
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
