//
//  StringExtension.swift
//  WalkingBuddy
//
//  Created by Umesh Basnet on 2025-06-20.
//

import Foundation


extension String {
    
    func isValidEmail() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicaet = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailPredicaet.evaluate(with: self)
    }
}
