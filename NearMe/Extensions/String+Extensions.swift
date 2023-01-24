//
//  String+Extensions.swift
//  NearMe
//
//  Created by chirag arora on 24/01/23.
//

import Foundation

extension String {
    
    
    var formatPhoneForCall: String {
        self.replacingOccurrences(of: " ", with: "")
        .replacingOccurrences(of: "+", with: "")
        .replacingOccurrences(of: "(", with: "")
        .replacingOccurrences(of: ")", with: "")
        .replacingOccurrences(of: "-", with: "")
        
        
        
    }
}
