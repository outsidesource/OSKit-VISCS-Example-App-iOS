//
//  DeviceViewError.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  
//

import Foundation

public enum DeviceViewError: Error, LocalizedError {
    
    public var errorDescription: String? {
        
        switch self {
        default:
            return String(describing: self)
        }
        
    }
    
}
