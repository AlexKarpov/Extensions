//
//  UIAlertAction+DefaultActions.swift
//  Extensions
//
//  Created by Alexander Karpov on 28.01.2020.
//  Copyright © 2020 Alexander Karpov. All rights reserved.
//

import UIKit

public extension UIAlertAction {
    static var cancel: UIAlertAction {
        .init(title: "Cancel", style: .cancel)
    }
    
    static var ok: UIAlertAction {
        .init(title: "OK", style: .default)
    }
}
