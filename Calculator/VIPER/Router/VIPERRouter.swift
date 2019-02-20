//
//  VIPERRouter.swift
//  Calculator
//
//  Created by Петр on 17/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class VIPERRouter: VIPERRouterInput {
    
    weak var view: UIViewController!
    
    func showAlert(_ message: String?) {
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okButton)
        view.present(alert, animated: true, completion: nil)
    }
}
