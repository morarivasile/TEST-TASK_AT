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
        let viewController = LoginViewController.nibLoaded
        
        navigationController.pushViewController(viewController, animated: true)
    }
}

