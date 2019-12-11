//  Ztopwatch.swift
//  Ztopwatch
//
//  Created by Slava Zubrin on 12/11/19.
//  Copyright © 2019 Slava Zubrin. All rights reserved.
//

import Foundation

public protocol ZtopwatchI {
    mutating func start()
    mutating func stop()
    
    mutating func reset()
    
    var isRunning: Bool { get }
    var duration: TimeInterval { get }
}

public struct Ztopwatch: ZtopwatchI {
    
    private var startTik: DispatchTime? = nil
    private var stopTik: DispatchTime? = nil
    
    // MARK: - Lifecycle
    
    public init() {}
    
    // MARK: - Public
    
    mutating public func start() {
        guard !isRunning, !isDone else { return }
        startTik = DispatchTime.now()
    }
    
    mutating public func stop() {
        guard isRunning, !isDone else { return }
        stopTik = DispatchTime.now()
    }
    
    mutating public func reset() {
        startTik = nil
        stopTik = nil
    }
    
    public var isRunning: Bool {
        return startTik != nil && stopTik == nil
    }
    
    /// Measured duration in seconds
    public var duration: TimeInterval {
        guard let stop = stopTik, let start = startTik else { return .nan }
        let nanoTime = stop.uptimeNanoseconds - start.uptimeNanoseconds // Difference in nanoseconds (UInt64)
        return TimeInterval(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
    }
    
    // MARK: - Private
    
    private var isDone: Bool {
        return startTik != nil && stopTik != nil
    }
}

