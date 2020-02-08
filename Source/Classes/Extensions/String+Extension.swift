//
//  String+Extension.swift
//  Extensions
//
//  Created by Alexander Karpov on 28.01.2020.
//  Copyright © 2020 Alexander Karpov. All rights reserved.
//

public extension String {
    var `extension`: String {
        components(separatedBy: ".").last ?? ""
    }
}
