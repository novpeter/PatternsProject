//
//  ViewController.swift
//  Calculator
//
//  Created by Петр on 15/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class VIPERCalculatorController: UIViewController, VIPERViewInput {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var presenter: VIPERViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
    }

    @IBAction func didNumberButtonPressed(_ sender: UIButton) {
        presenter.didNumberButtonPressed(sender.tag)
    }
    
    @IBAction func didOperationButtonPressed(_ sender: UIButton) {
        presenter.didOperationButtonPressed(sender.tag)
    }
    
    func showResult(_ result: String?) {
        resultLabel.text = result;
    }
    
}

