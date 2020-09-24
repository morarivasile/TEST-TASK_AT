//
//  MainCoordinator.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import UIKit

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let view = LoginViewController.nibLoaded
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        navigationController.pushViewController(view, animated: true)
    }
}

