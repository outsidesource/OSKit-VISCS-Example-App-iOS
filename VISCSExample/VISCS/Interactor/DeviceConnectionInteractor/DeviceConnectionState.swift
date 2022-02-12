//
//  DeviceConnectionState.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit

public struct DeviceConnectionState: IState {
    
    let device: Device
    var isConnected = false
    var connectAsyncState: AsyncState<(), Error>?
    
    /// Returns a description best describing the current connection status of the device
    public var statusDescription: String {
        
        if connectAsyncState?.isBusy ?? false {
            return "Connecting"
        } else {
            return isConnected ? "Connected" : "Disconnected"
        }
        
    }
    
}
