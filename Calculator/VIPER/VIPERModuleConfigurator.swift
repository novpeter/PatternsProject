//
//  VIPERModuleConfigurator.swift
//  Calculator
//
//  Created by Петр on 17/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class VIPERModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let view = viewController as? VIPERCalculatorController else { fatalError() }
        
        let presenter = VIPERPresenter()
        let interactor = VIPERInteractor()
        let router = VIPERRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.view = view
    }
}
