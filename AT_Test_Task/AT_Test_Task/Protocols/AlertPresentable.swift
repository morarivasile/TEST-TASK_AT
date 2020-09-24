//
//  AlertPresentable.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import UIKit

protocol AlertPresentable {
    func presentAlert(with title: String?, subtitle: String, actions: [UIAlertAction])
}

extension AlertPresentable where Self: UIViewController {
    func presentAlert(with title: String?, subtitle: String, actions: [UIAlertAction]) {
        let controller = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        
        actions.forEach { controller.addAction($0) }
        
        present(controller, animated: true, completion: nil)
    }
}
