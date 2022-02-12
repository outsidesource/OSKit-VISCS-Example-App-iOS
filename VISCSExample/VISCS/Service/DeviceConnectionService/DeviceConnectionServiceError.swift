//
//  DeviceConnectionServiceError.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import Foundation

public enum DeviceConnectionServiceError: Error, LocalizedError {
    
    // Context
    case connect(Error)
    
    // Statuses
    case unavailable
    
}
