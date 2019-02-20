//
//  CalculationManager.swift
//  Calculator
//
//  Created by Петр on 20/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

enum CalculationResult {
    case success(result: String)
    case failure(error: String)
}

class CalculatorManager {
    
    /// Text on screen
    var textOnScreen: String! = defaultTextOnScreen
    
    /// Number on screen
    var numberOnScreen: Double! = defaultNumberOnScreen
    
    /// Previous number
    var previuosNumber: Double! = defaultPreviuosNumber
    
    /// Flag of math operation
    var perfomingMath: Bool = false
    
    /// Tag of math operation
    var operation: Int! = defaultOperation
    
    
    func setupInititalState(completionBlock: (CalculationResult) -> ()) {
        completionBlock(.success(result: textOnScreen))
    }
    
    ///  Handle operation button pressing
    ///
    /// - Parameter tag: button tag
    func handleOperationButtonPressed(_ tag: Int?, completionBlock: (CalculationResult) -> ()) {
        
        if textOnScreen != "" && tag != Operations.Clear.rawValue && tag != Operations.Equal.rawValue {
            
            previuosNumber = numberOnScreen
            
            switch tag {
                
            case Operations.Addition.rawValue:
                
                textOnScreen = "+"
                completionBlock(.success(result: textOnScreen))
                break
                
            case Operations.Substraction.rawValue:
                
                textOnScreen = "-"
                completionBlock(.success(result: textOnScreen))
                break
                
            case Operations.Multiply.rawValue:
                
                textOnScreen = "X"
                completionBlock(.success(result: textOnScreen))
                break
                
            case Operations.Division.rawValue:
                
                textOnScreen = "/"
                completionBlock(.success(result: textOnScreen))
                break
                
            case Operations.Percent.rawValue:
                
                textOnScreen = "%"
                completionBlock(.success(result: textOnScreen))
                break
                
            case Operations.Power.rawValue:
                
                textOnScreen = "^"
                completionBlock(.success(result: textOnScreen))
                break
                
            default:
                break
            }
            
            operation = tag
            perfomingMath = true
        }
        else if tag == Operations.Equal.rawValue {
            
            switch operation {
                
            case Operations.Addition.rawValue:
                
                numberOnScreen = previuosNumber + numberOnScreen
                textOnScreen = String(numberOnScreen)
                completionBlock(.success(result: textOnScreen))
                break
                
            case Operations.Substraction.rawValue:
                
                numberOnScreen = previuosNumber - numberOnScreen
                textOnScreen = String(numberOnScreen)
                completionBlock(.success(result: textOnScreen))
                break
                
            case Operations.Multiply.rawValue:
                
                numberOnScreen = previuosNumber * numberOnScreen
                textOnScreen = String(numberOnScreen)
                completionBlock(.success(result: textOnScreen))
                break
                
            case Operations.Division.rawValue:
                
                guard numberOnScreen != 0 else {
        
                    completionBlock(.failure(error: Errors.DivisionOnZero.rawValue))
                    return
                }
                numberOnScreen = previuosNumber / numberOnScreen
                textOnScreen = String(numberOnScreen)
                completionBlock(.success(result: textOnScreen))
                break
                
            case Operations.Percent.rawValue:
                
                numberOnScreen = previuosNumber / 100 * numberOnScreen
                textOnScreen = String(numberOnScreen)
                completionBlock(.success(result: textOnScreen))
                break
                
            case Operations.Power.rawValue:
                
                numberOnScreen = pow(previuosNumber, numberOnScreen)
                textOnScreen = String(numberOnScreen)
                completionBlock(.success(result: textOnScreen))
                break
                
            default:
                break
            }
            
            operation = tag
        }
        else if tag == Operations.Clear.rawValue {
            
            textOnScreen = defaultTextOnScreen
            numberOnScreen = defaultNumberOnScreen
            previuosNumber = defaultPreviuosNumber
            perfomingMath = false
            operation = defaultOperation
            completionBlock(.success(result: textOnScreen))
        }
    }
    
    
    ///  Handle number button pressing
    ///
    /// - Parameter tag: button tag
    func handleNumberButtonPressed(_ tag: Int?, completionBlock: (CalculationResult) -> ()) {
        
        guard let tag = tag else {
            
            completionBlock(.failure(error: Errors.WrongTag.rawValue))
            return
        }
        
        if perfomingMath {
            
            textOnScreen = String(tag - 1)
            numberOnScreen = Double(textOnScreen)
            completionBlock(.success(result: textOnScreen))
            perfomingMath = false
        }
        else if tag == Operations.Dot.rawValue {
            
            guard !textOnScreen.contains(".") else { return }
            
            textOnScreen = textOnScreen + "."
            numberOnScreen = Double(textOnScreen)
            completionBlock(.success(result: textOnScreen))
        }
        else if operation == Operations.Equal.rawValue {
            
            operation = 0
            textOnScreen = String(tag - 1)
            numberOnScreen = Double(textOnScreen)
            completionBlock(.success(result: textOnScreen))
        }
        else {
            
            textOnScreen = textOnScreen + String(tag - 1)
            numberOnScreen = Double(textOnScreen)
            completionBlock(.success(result: textOnScreen))
        }
    }
}
