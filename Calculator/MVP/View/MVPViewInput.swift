//
//  MVPViewInput.swift
//  Calculator
//
//  Created by Петр on 16/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol MVPViewInput: AnyObject {
    
    /// Show result
    ///
    /// - Parameter result: result of calculating
    func showResult(_ result: String?)
    
    /// Show alert
    ///
    /// - Parameter message: alert message
    func showAlert(_ message: String?)
}
