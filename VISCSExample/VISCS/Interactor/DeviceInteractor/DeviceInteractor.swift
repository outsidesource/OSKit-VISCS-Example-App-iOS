//
//  DeviceInteractor.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit
import RxSwift

/// IDeviceInteractor exposes interface of aggregated interactors for convenience
public protocol IDeviceInteractor: IDeviceConnectionInteractor { }

public class DeviceInteractor: Interactor<DeviceState>, IDeviceInteractor {
    
    let connectionInteractor: DeviceConnectionInteractor
    
    public init(device: Device, connectionInteractor: DeviceConnectionInteractor) {
        
        self.connectionInteractor = connectionInteractor
        
        let state = DeviceState(device: device, deviceConnectionStateStore: connectionInteractor.stateStore)
        super.init(state: state)
        
        connectionInteractor.addSubscriber(self.stateStore)
        
    }
        
}

extension DeviceInteractor: IDeviceConnectionInteractor {
    
    public func connect() -> Completable {
        OSLog.info(domain: .interactor)
        
        return connectionInteractor.connect()
            .osLog(domain: .interactor)
    }
    
    public func disconnect() -> Completable {
        OSLog.info(domain: .interactor)
        
        return connectionInteractor.disconnect()
            .osLog(domain: .interactor)
    }
    
}
