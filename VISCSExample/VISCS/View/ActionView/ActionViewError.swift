//
//  ActionViewError.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  
//

import Foundation

public enum ActionViewError: Error, LocalizedError {
    
    public var errorDescription: String? {
        
        switch self {
        default:
            return String(describing: self)
        }
        
    }
    
}
