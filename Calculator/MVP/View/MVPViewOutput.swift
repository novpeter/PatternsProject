//
//  MVPViewOutput.swift
//  Calculator
//
//  Created by Петр on 16/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol MVPViewOutput: AnyObject {
    
    /// Set up initial state
    func setupInitialState()
    
    /// Handle opeartion button click
    ///
    /// - Parameter tag: button tag
    func didOperationButtonPressed(_ tag: Int!)
    
    /// Handle number button click
    ///
    /// - Parameter tag: button tag
    func didNumberButtonPressed(_ tag: Int!)
}
