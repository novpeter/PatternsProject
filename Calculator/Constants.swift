//
//  Constants.swift
//  Calculator
//
//  Created by Петр on 17/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation


enum Operations: Int {
    case Addition = 13
    case Substraction = 14
    case Multiply = 15
    case Division = 16
    case Percent = 17
    case Power = 18
    case Equal = 12
    case Clear = 19
    case Dot = 11
}

enum Errors: String {
    case DivisionOnZero = "Devision on zero"
    case WrongTag = "Wrong tag"
}

let defaultNumberOnScreen: Double = 0
let defaultPreviuosNumber: Double = 0
let defaultOperation = 0
let defaultTextOnScreen = ""

enum Signs: String {
    case dot = "."
    case addition = "+"
    case substruction = "-"
    case multiplication = "x"
    case division = "/"
    case power = "^"
    case percent = "%"
}
