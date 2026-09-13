package maa.pipeline

import maa.types.Rect
import std.collection.ArrayList
import std.collection.HashMap

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

public class Node {
    public let name: String
    private var reco: Option<Recognition>
    private var act: Option<Action>
    private var nextList: ArrayList<String>
    private var onErrorList: ArrayList<String>
    private var optRateLimit: Option<Int64>
    private var optTimeout: Option<Int64>
    private var optPreDelay: Option<Int64>
    private var optPostDelay: Option<Int64>
    private var isInverse: Bool
    private var isEnabled: Bool
    private var optMaxHit: Option<UInt64>
    private var optFocus: Option<String>
    private var anchorMap: HashMap<String, String>

    public init(name: String) {
        this.name = name
        this.reco = None
        this.act = None
        this.nextList = ArrayList<String>()
        this.onErrorList = ArrayList<String>()
        this.optRateLimit = None
        this.optTimeout = None
        this.optPreDelay = None
        this.optPostDelay = None
        this.isInverse = false
        this.isEnabled = true
        this.optMaxHit = None
        this.optFocus = None
        this.anchorMap = HashMap<String, String>()
    }

    public func recognition(reco: Recognition): Node {
        this.reco = Some(reco)
        return this
    }

    public func templateMatch(
        template: String,
        roi!: Rect = Rect(0, 0, 0, 0),
        threshold!: Float64 = 0.7
    ): Node {
        return this.recognition(Recognition.templateMatch(template, roi: roi, threshold: threshold))
    }

    public func ocr(
        expected!: Array<String> = Array<String>(),
        roi!: Rect = Rect(0, 0, 0, 0),
        threshold!: Float64 = 0.0
    ): Node {
        return this.recognition(Recognition.ocr(expected: expected, roi: roi, threshold: threshold))
    }

    public func directHit(): Node {
        return this.recognition(Recognition.directHit())
    }

    public func action(act: Action): Node {
        this.act = Some(act)
        return this
    }

    public func click(target!: Option<Rect> = None): Node {
        return this.action(Action.click(target: target))
    }

    public func swipe(
        x1: Int32,
        y1: Int32,
        x2: Int32,
        y2: Int32,
        duration!: Int32 = 500
    ): Node {
        return this.action(Action.swipe(x1, y1, x2, y2, duration: duration))
    }

    public func doNothing(): Node {
        return this.action(Action.doNothing())
    }

    public func next(nodes: Array<String>): Node {
        for (n in nodes) {
            this.nextList.add(n)
        }
        return this
    }

    public func next(nodeName: String): Node {
        this.nextList.add(nodeName)
        return this
    }

    public func onError(nodes: Array<String>): Node {
        for (n in nodes) {
            this.onErrorList.add(n)
        }
        return this
    }

    public func onError(nodeName: String): Node {
        this.onErrorList.add(nodeName)
        return this
    }

    public func rateLimit(ms: Int64): Node {
        this.optRateLimit = Some(ms)
        return this
    }

    public func timeout(ms: Int64): Node {
        this.optTimeout = Some(ms)
        return this
    }

    public func preDelay(ms: Int64): Node {
        this.optPreDelay = Some(ms)
        return this
    }

    public func postDelay(ms: Int64): Node {
        this.optPostDelay = Some(ms)
        return this
    }

    public func inverse(enable!: Bool = true): Node {
        this.isInverse = enable
        return this
    }

    public func enabled(enable: Bool): Node {
        this.isEnabled = enable
        return this
    }

    public func maxHit(hit: UInt64): Node {
        this.optMaxHit = Some(hit)
        return this
    }

    public func focus(focusData: String): Node {
        this.optFocus = Some(focusData)
        return this
    }

    public func anchor(anchorName: String, targetNode: String): Node {
        this.anchorMap[anchorName] = targetNode
        return this
    }

    public func toJson(): String {
        let sb = StringBuilder()
        sb.append('{')
        var hasPrev = false

        match (this.reco) {
            case Some(r) =>
                sb.append('"recognition":' + r.toJson())
                hasPrev = true
            case None => ()
        }

        match (this.act) {
            case Some(a) =>
                if (hasPrev) { sb.append(',') }
                sb.append('"action":' + a.toJson())
                hasPrev = true
            case None => ()
        }

        if (!this.nextList.isEmpty()) {
            if (hasPrev) { sb.append(',') }
            sb.append('"next":[')
            for (i in 0..this.nextList.size) {
                if (i > 0) { sb.append(',') }
                sb.append('"' + escapeJson(this.nextList[i]) + '"')
            }
            sb.append(']')
            hasPrev = true
        }

        if (!this.onErrorList.isEmpty()) {
            if (hasPrev) { sb.append(',') }
            sb.append('"on_error":[')
            for (i in 0..this.onErrorList.size) {
                if (i > 0) { sb.append(',') }
                sb.append('"' + escapeJson(this.onErrorList[i]) + '"')
            }
            sb.append(']')
            hasPrev = true
        }

        match (this.optRateLimit) {
            case Some(v) =>
                if (hasPrev) { sb.append(',') }
                sb.append('"rate_limit":' + "${v}")
                hasPrev = true
            case None => ()
        }

        match (this.optTimeout) {
            case Some(v) =>
                if (hasPrev) { sb.append(',') }
                sb.append('"timeout":' + "${v}")
                hasPrev = true
            case None => ()
        }

        match (this.optPreDelay) {
            case Some(v) =>
                if (hasPrev) { sb.append(',') }
                sb.append('"pre_delay":' + "${v}")
                hasPrev = true
            case None => ()
        }

        match (this.optPostDelay) {
            case Some(v) =>
                if (hasPrev) { sb.append(',') }
                sb.append('"post_delay":' + "${v}")
                hasPrev = true
            case None => ()
        }

        if (this.isInverse) {
            if (hasPrev) { sb.append(',') }
            sb.append('"inverse":true')
            hasPrev = true
        }

        if (!this.isEnabled) {
            if (hasPrev) { sb.append(',') }
            sb.append('"enabled":false')
            hasPrev = true
        }

        match (this.optMaxHit) {
            case Some(v) =>
                if (hasPrev) { sb.append(',') }
                sb.append('"max_hit":' + "${v}")
                hasPrev = true
            case None => ()
        }

        match (this.optFocus) {
            case Some(v) =>
                if (hasPrev) { sb.append(',') }
                sb.append('"focus":' + v)
                hasPrev = true
            case None => ()
        }

        if (!this.anchorMap.isEmpty()) {
            if (hasPrev) { sb.append(',') }
            sb.append('"anchor":{')
            var firstAnchor = true
            for ((k, v) in this.anchorMap) {
                if (!firstAnchor) { sb.append(',') }
                sb.append('"' + escapeJson(k) + '":"' + escapeJson(v) + '"')
                firstAnchor = false
            }
            sb.append('}')
            hasPrev = true
        }

        sb.append('}')
        return sb.toString()
    }

    public func toString(): String {
        return this.toJson()
    }
}
