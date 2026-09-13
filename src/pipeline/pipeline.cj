package maa.pipeline

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

public class Pipeline {
    private var nodes: HashMap<String, Node>

    public init() {
        this.nodes = HashMap<String, Node>()
    }

    public func add(node: Node): Pipeline {
        this.nodes[node.name] = node
        return this
    }

    public func node(name: String): Node {
        let n = Node(name)
        this.nodes[name] = n
        return n
    }

    public func get(name: String): Option<Node> {
        return this.nodes.get(name)
    }

    public func remove(name: String): Option<Node> {
        return this.nodes.remove(name)
    }

    public func clear(): Unit {
        this.nodes.clear()
    }

    public func size(): Int64 {
        return this.nodes.size
    }

    public func toJson(): String {
        let sb = StringBuilder()
        sb.append('{')
        var first = true
        for ((name, node) in this.nodes) {
            if (!first) {
                sb.append(',')
            }
            sb.append('"' + escapeJson(name) + '":' + node.toJson())
            first = false
        }
        sb.append('}')
        return sb.toString()
    }

    public func toString(): String {
        return this.toJson()
    }
}
