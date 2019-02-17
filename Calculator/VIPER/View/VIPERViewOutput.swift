//
//  VIPERViewOutput.swift
//  Calculator
//
//  Created by Петр on 17/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol VIPERViewOutput: AnyObject {
    
    
    /// Call interactor to set up initial state
    func setupInitialState()
    
    ///  Call interactor to handle operation button pressed
    ///
    /// - Parameter tag: button tag
    func didOperationButtonPressed(_ tag: Int!)
    
    ///  Call interactor to handle number button pressed
    ///
    /// - Parameter tag: button tag
    func didNumberButtonPressed(_ tag: Int!)
    
}
