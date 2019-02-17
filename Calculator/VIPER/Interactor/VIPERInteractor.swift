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
    
    /// Text on screen
    var textOnScreen: String!
    
    /// Number on screen
    var numberOnScreen: Double!
    /// Previous number
    var previuosNumber: Double!
    
    /// Flag of math operation
    var perfomingMath: Bool = false
    /// Tag of math operation
    var operation: Int!
    
    
    /// Set up initaia state of Calculator controller
    func setupInitialState() {
        
        numberOnScreen = 0
        previuosNumber = 0
        operation = 0
        textOnScreen = ""
        output.didButtonClickProcessingCompleted(textOnScreen)
    }
    
    
    ///  Handle operation button pressing
    ///
    /// - Parameter tag: button tag
    func didOperationButtonPressed(_ tag: Int!) {
        
        if textOnScreen != "" && tag != Operations.Clear.rawValue && tag != Operations.Equal.rawValue {
            
            previuosNumber = numberOnScreen
            
            switch tag {
                
            case Operations.Addition.rawValue:
                
                textOnScreen = "+"
                output.didButtonClickProcessingCompleted(textOnScreen)
                break
                
            case Operations.Substraction.rawValue:
                
                textOnScreen = "-"
                output.didButtonClickProcessingCompleted(textOnScreen)
                break
                
            case Operations.Multiply.rawValue:
                
                textOnScreen = "X"
                output.didButtonClickProcessingCompleted(textOnScreen)
                break
                
            case Operations.Division.rawValue:
                
                textOnScreen = "/"
                output.didButtonClickProcessingCompleted(textOnScreen)
                break
                
            case Operations.Percent.rawValue:
                
                textOnScreen = "%"
                output.didButtonClickProcessingCompleted(textOnScreen)
                break
                
            case Operations.Power.rawValue:
                
                textOnScreen = "^"
                output.didButtonClickProcessingCompleted(textOnScreen)
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
                output.didButtonClickProcessingCompleted(textOnScreen)
                break
                
            case Operations.Substraction.rawValue:
                
                numberOnScreen = previuosNumber - numberOnScreen
                textOnScreen = String(numberOnScreen)
                output.didButtonClickProcessingCompleted(textOnScreen)
                break
                
            case Operations.Multiply.rawValue:
                
                numberOnScreen = previuosNumber * numberOnScreen
                textOnScreen = String(numberOnScreen)
                output.didButtonClickProcessingCompleted(textOnScreen)
                break
                
            case Operations.Division.rawValue:
                
                guard numberOnScreen != 0 else {
                    
                    output.handleError(Errors.DivisionOnZero.rawValue)
                    return
                }
                numberOnScreen = previuosNumber / numberOnScreen
                textOnScreen = String(numberOnScreen)
                output.didButtonClickProcessingCompleted(textOnScreen)
                break
                
            case Operations.Percent.rawValue:
                
                numberOnScreen = previuosNumber / 100 * numberOnScreen
                textOnScreen = String(numberOnScreen)
                output.didButtonClickProcessingCompleted(textOnScreen)
                break
                
            case Operations.Power.rawValue:
                
                numberOnScreen = pow(previuosNumber, numberOnScreen)
                textOnScreen = String(numberOnScreen)
                output.didButtonClickProcessingCompleted(textOnScreen)
                break
                
            default:
                break
            }
            
            operation = tag
        }
        else if tag == Operations.Clear.rawValue {
            
            setupInitialState()
        }
    }
    
    
    ///  Handle number button pressing
    ///
    /// - Parameter tag: button tag
    func didNumberButtonPressed(_ tag: Int!) {
        
        if perfomingMath {
            
            textOnScreen = String(tag - 1)
            numberOnScreen = Double(textOnScreen)
            output.didButtonClickProcessingCompleted(textOnScreen)
            perfomingMath = false
        }
        else if tag == Operations.Dot.rawValue {
            
            guard !textOnScreen.contains(".") else { return }
            
            textOnScreen = textOnScreen + "."
            numberOnScreen = Double(textOnScreen)
            output.didButtonClickProcessingCompleted(textOnScreen)
        }
        else if operation == Operations.Equal.rawValue {
            
            operation = 0
            textOnScreen = String(tag - 1)
            numberOnScreen = Double(textOnScreen)
            output.didButtonClickProcessingCompleted(textOnScreen)
        }
        else {
            
            textOnScreen = textOnScreen + String(tag - 1)
            numberOnScreen = Double(textOnScreen)
            output.didButtonClickProcessingCompleted(textOnScreen)
        }
    }
}
