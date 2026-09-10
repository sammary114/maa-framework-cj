package maa.job

import maa.types.*

public abstract class Job<T> {
    protected var jobId: Int64

    public init(jobId: Int64) {
        this.jobId = jobId
    }

    public func id(): Int64 {
        return this.jobId
    }

    public open func wait(): Status {
        return Status.Invalid
    }

    public open func status(): Status {
        return Status.Invalid
    }

    public func isDone(): Bool {
        return this.status().isDone()
    }

    public func isSucceeded(): Bool {
        return this.status().isSucceeded()
    }

    public func isFailed(): Bool {
        return this.status().isFailed()
    }
}
