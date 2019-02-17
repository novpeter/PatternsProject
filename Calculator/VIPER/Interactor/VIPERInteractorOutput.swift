//
//  VIPERInteractorOutput.swift
//  Calculator
//
//  Created by Петр on 17/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol VIPERInteractorOutput: AnyObject, VIPERRouterOutput {
    
    /// Handle the result after button click
    ///
    /// - Parameter result: result of calculating
    func didButtonClickProcessingCompleted(_ result: String?)
    
}
