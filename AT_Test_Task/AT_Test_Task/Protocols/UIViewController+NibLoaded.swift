//
//  UIViewController+NibLoaded.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import UIKit

extension UIViewController {
    class var nibLoaded: Self {
        return Self.init(nibName: String(describing: Self.self), bundle: nil)
    }
}
