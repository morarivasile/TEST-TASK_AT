//
//  LoginResponseStatus.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation

enum LoginResponseStatus: String, CaseIterable {
    case ok = "ok"
    case other
    
    init(rawValue: String) {
        if rawValue == LoginResponseStatus.ok.rawValue {
            self = .ok
        } else {
            self = .other
        }
    }
}
