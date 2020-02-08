//
//  IErrorHandler.swift
//  Extensions
//
//  Created by Alexander Karpov on 07.02.2020.
//

import Foundation

protocol IErrorHandler {
    func handle(_ error: Error)
}

extension IErrorHandler {
    func handle<Success>(_ result: Result<Success, Error>, pipeSuccessTo handler: (Success)->Void) {
        switch result {
        case .success(let value):
            handler(value)
        case .failure(let error):
            handle(error)
        }
    }
}

extension UIViewController: IErrorHandler {
    func handle(_ error: Error) {
        print(error )
    }
}
