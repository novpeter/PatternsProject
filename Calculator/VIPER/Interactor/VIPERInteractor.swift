//
//  ViperInteractor.swift
//  Calculator
//
//  Created by Петр on 17/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class VIPERInteractor: VIPERInteractorInput {
    
    weak var output: VIPERInteractorOutput!
    var calculatorManager: CalculatorManager!
    
    
    /// Set up initaia state of Calculator controller
    func setupInitialState() {
        calculatorManager.setupInititalState { (calculationResult) in
            
            switch calculationResult {
                
            case .success(let result):
                output.didButtonClickProcessingCompleted(result)
            case .failure(let error):
                output.handleError(error)
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
                output.didButtonClickProcessingCompleted(result)
            case .failure(let error):
                output.handleError(error)
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
                output.didButtonClickProcessingCompleted(result)
            case .failure(let error):
                output.handleError(error)
            }
        })
    }
}
