//
//  VIPERViewInput.swift
//  Calculator
//
//  Created by Петр on 17/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol VIPERViewInput: AnyObject {
    
    ///  Show given result ib view
    ///
    /// - Parameter result: result after button click
    func showResult(_ result: String?)
}
