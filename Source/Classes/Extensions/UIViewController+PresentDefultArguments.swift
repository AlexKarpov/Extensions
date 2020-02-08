//
//  UIViewController+PresentDefultArguments.swift
//  Extensions
//
//  Created by Alexander Karpov on 04.02.2020.
//  Copyright © 2020 Alexander Karpov. All rights reserved.
//

import UIKit

extension UIViewController {
    enum Error: Swift.Error {
        case viewControllerIsNil
    }
    
    public func present(_ viewController: UIViewController?, animated: Bool = true) throws {
        guard let viewController = viewController else { throw Error.viewControllerIsNil }
        present(viewController, animated: animated)
    }
    
    public func present(_ viewController: UIViewController) {
        present(viewController, animated: true)
    }
    
    public func dismiss(completion: (() -> Void)?) {
        dismiss(animated: true, completion: completion)
    }
}

public extension UIViewController {
    func handle(_ error: Swift.Error) {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .actionSheet
        )
        
        alert.addAction(.ok)
        
        present(alert)
    }
}

public extension UIViewController {
    func handle<Success>(_ result: Result<Success, Swift.Error>, successHandler: (Success) -> Void) {
        switch result {
        case .success(let success):
            successHandler(success)
        case .failure(let error):
            handle(error)
        }
    }
}
