//
//  UITableView+Refreshing.swift
//  Extensions
//
//  Created by Alexander Karpov on 08.11.2019.
//  Copyright © 2019 mifprojects. All rights reserved.
//

import UIKit

public extension UITableView {
    func beginRefreshing() {
        refreshControl?.beginRefreshing()
        setContentOffset(CGPoint(x: 0, y: -200), animated: true)
    }
    
    func endRefreshing() {
        refreshControl?.endRefreshing()
    }
}
