//
//  MVPModuleConfigurator.swift
//  Calculator
//
//  Created by Петр on 15/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class MVPModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let view = viewController as? MVPCalculatorController else { fatalError() }
        
        let presenter = MVPPresenter()
        let calculatorManager = CalculatorManager()
        
        view.presenter = presenter
        presenter.calculatorManager = calculatorManager
        presenter.view = view
    }
}
