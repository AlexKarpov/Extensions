//
//  UINavigationController+Root.swift
//  Extensions
//
//  Created by Alexander Karpov on 04.02.2020.
//  Copyright © 2020 Alexander Karpov. All rights reserved.
//

import UIKit

public extension UINavigationController {
    var root: UIViewController? {
        viewControllers.first
    }
}
