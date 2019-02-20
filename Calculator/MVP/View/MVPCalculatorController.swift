//
//  ViewController.swift
//  Calculator
//
//  Created by Петр on 15/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class MVPCalculatorController: UIViewController, MVPViewInput {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var presenter: MVPViewOutput!
    
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
    
    func showAlert(_ message: String?) {
        
        let alert = UIAlertController(title: "Hey, bro!", message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

}

