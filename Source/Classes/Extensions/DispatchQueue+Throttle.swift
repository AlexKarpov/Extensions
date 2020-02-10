//
//  DispatchQueue+Throttle.swift
//  Extensions
//
//  Created by Alexander Karpov on 10.02.2020.
//

private var throttleWorkItems = [AnyHashable: DispatchWorkItem]()
private let nilContext: AnyHashable = arc4random()

public extension DispatchQueue {
    /**
     - parameters:
     - deadline: The timespan to delay a closure execution
     - context: The context in which the throttle should be executed
     - action: The closure to be executed
     Delays a closure execution and ensures no other executions are made during deadline
     */
    func throttle(deadline: DispatchTime, context: AnyHashable? = nil, action: @escaping () -> Void) {
        let worker = DispatchWorkItem {
            defer { throttleWorkItems.removeValue(forKey: context ?? nilContext) }
            action()
        }
        
        asyncAfter(deadline: deadline, execute: worker)
        
        throttleWorkItems[context ?? nilContext]?.cancel()
        throttleWorkItems[context ?? nilContext] = worker
    }
}
