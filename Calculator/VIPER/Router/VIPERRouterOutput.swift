//
//  VIPERRouterOutput.swift
//  Calculator
//
//  Created by Петр on 17/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol VIPERRouterOutput {
    
    /// Handle error
    ///
    /// - Parameter message: displaying in alert
    func handleError(_ message: String?)
}

