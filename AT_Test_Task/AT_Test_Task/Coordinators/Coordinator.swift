//
//  Coordinator.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
