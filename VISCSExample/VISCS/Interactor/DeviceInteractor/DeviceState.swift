//
//  DeviceState.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit

public struct DeviceState: IState {
    
    public let device: Device
    
    weak var deviceConnectionStateStore: StateStore<DeviceConnectionState>?
    
    /// Returns the current state of device connection
    ///
    /// This is a projection of DeviceConnectionState.isConnected
    public var isConnected: Bool {
        deviceConnectionStateStore?.state?.isConnected ?? false
    }
    
    /// Returns a description best describing the current status of the device
    public var statusDescription: String? {
        return deviceConnectionStateStore?.state?.statusDescription
    }
    
}
