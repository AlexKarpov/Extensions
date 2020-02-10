//
//  DispatchQueue+Debounce.swift
//  Extensions
//
//  Created by Alexander Karpov on 10.02.2020.
//

private var lastDebounceCallTimes = [AnyHashable: DispatchTime]()
private let nilContext: AnyHashable = arc4random()

extension DispatchQueue {
    /**
     - parameters:
     - interval: The interval in which new calls will be ignored
     - context: The context in which the debounce should be executed
     - action: The closure to be executed
     Executes a closure and ensures no other executions will be made during the interval.
     */
    func debounce(interval: Double, context: AnyHashable? = nil, action: @escaping () -> Void) {
        if let last = lastDebounceCallTimes[context ?? nilContext], last + interval > .now() {
            return
        }

        lastDebounceCallTimes[context ?? nilContext] = .now()
        async(execute: action)

        // Cleanup & release context
        throttle(deadline: .now() + interval) {
            lastDebounceCallTimes.removeValue(forKey: context ?? nilContext)
        }
    }
}
