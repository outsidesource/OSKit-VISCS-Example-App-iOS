//
//  Device.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import Foundation

public struct Device {
    
    let id: UUID
    
    public init(id: UUID = UUID()) {
        self.id = id
    }
    
}
