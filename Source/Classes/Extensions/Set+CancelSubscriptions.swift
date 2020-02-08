//
//  Set+CancelSubscriptions.swift
//  Extensions
//
//  Created by Alexander Karpov on 12.11.2019.
//  Copyright © 2019 mifprojects. All rights reserved.
//

import Foundation
import Combine

@available(iOS 13.0, *)
public extension Set where Element: AnyCancellable {
    func cancel() {
        forEach { $0.cancel() }
    }
}
