//
//  MVPPresenter.swift
//  Calculator
//
//  Created by Петр on 15/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class MVPPresenter: MVPViewOutput {
    
    weak var view: MVPViewInput!
    var calculatorManager: CalculatorManager!
    
    
    /// Set up initaial state of Calculator controller
    func setupInitialState() {
        
        calculatorManager.setupInititalState { (calculationResult) in
            
            switch calculationResult {
                
            case .success(let result):
                view.showResult(result)
            case .failure(let error):
                view.showAlert(error)
            }
        }
    }
    
    
    ///  Handle operation button pressing
    ///
    /// - Parameter tag: button tag
    func didOperationButtonPressed(_ tag: Int?) {
                
        calculatorManager.handleOperationButtonPressed(tag, completionBlock: { (calculationResult) in
            
            switch calculationResult {
                
            case .success(let result):
                view.showResult(result)
            case .failure(let error):
                view.showAlert(error)
            }
        })
    }
    
    
    ///  Handle number button pressing
    ///
    /// - Parameter tag: button tag
    func didNumberButtonPressed(_ tag: Int?) {
        
        calculatorManager.handleNumberButtonPressed(tag, completionBlock: { (calculationResult) in
            
            switch calculationResult {
                
            case .success(let result):
                view.showResult(result)
            case .failure(let error):
                view.showAlert(error)
            }
        })
    }

}
