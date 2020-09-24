//
//  RegexValidator.swift
//  AT_Test_Task
//
//  Created by Vasile Morari on 24.09.2020.
//

import Foundation

final class RegexValidator {
    
    func validate(_ input: String, type: RegexType) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: type.regex, options: [.caseInsensitive]) else {
            assertionFailure("Regex not valid")
            return false
        }
        
        let range = NSRange(location: 0, length: input.count)
        let regexFirstMatch = regex.firstMatch(in: input, options: [], range: range)
        
        return regexFirstMatch != nil
    }
    
}

enum RegexType {
    case email
    case password
    case custom(String)
    
    var regex: String {
        switch self {
        case .email: return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .password: return "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"
        case .custom(let regex): return regex
        }
    }
}
