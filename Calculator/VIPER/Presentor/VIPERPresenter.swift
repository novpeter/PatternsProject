//
//  VIPERPresenter.swift
//  Calculator
//
//  Created by Петр on 17/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class VIPERPresenter: VIPERViewOutput, VIPERInteractorOutput {
    
    weak var view: VIPERViewInput!
    var interactor: VIPERInteractorInput!
    var router: VIPERRouterInput!
    
    //MARK: - VIPERViewOutput -
    
    func setupInitialState() {
        interactor.setupInitialState()
    }
    
    func didOperationButtonPressed(_ tag: Int!) {
        interactor.didOperationButtonPressed(tag)
    }
    
    func didNumberButtonPressed(_ tag: Int!) {
        interactor.didNumberButtonPressed(tag)
    }
    
    //MARK: - VIPERInteractorOutput -
    
    func didButtonClickProcessingCompleted(_ result: String?) {
        view.showResult(result)
    }
    
    //MARK: - VIPERRouterOutput -
    
    func handleError(_ message: String?) {
        router.showAlert(message)
    }
}
