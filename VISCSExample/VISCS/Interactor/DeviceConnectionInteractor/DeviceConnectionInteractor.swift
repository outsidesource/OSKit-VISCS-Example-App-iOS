//
//  DeviceConnectionInteractor.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit
import RxSwift

public protocol IDeviceConnectionInteractor {
    func connect() -> Completable
    func disconnect() -> Completable
}

public class DeviceConnectionInteractor: Interactor<DeviceConnectionState>, IDeviceConnectionInteractor {

    // For convenience we compose Device in both state and interactor, this streamlines calls to connection service without unwrapping state
    let device: Device
    
    let connectionService: IDeviceConnectionService
        
    public init(device: Device, connectionService: IDeviceConnectionService) {
    
        self.device = device
        self.connectionService = connectionService
        
        let state = DeviceConnectionState(device: device)
        super.init(state: state)
        
    }
    
    public func connect() -> Completable {
        OSLog.info(domain: .interactor)
        
        return Completable.create { observer in
            
            self.connectionService.connect(self.device) { result in

                switch result {
                case .success:
                    observer(.completed)
                case .failure(let error):
                    observer(.error(error))
                }

            }

            return Disposables.create()

        }
        .osLog(domain: .interactor)
        .reduceState(stateStore) { state, asyncState in
            OSLog.verbose(asyncState, domain: .interactor)
            
            var state = state
            
            state?.connectAsyncState = asyncState
            
            if case .complete = asyncState {
                state?.isConnected = true
            }
            
            return state
            
        }

    }
    
    public func disconnect() -> Completable {
        OSLog.info(domain: .interactor)
        
        self.connectionService.disconnect(device)
        
        return .empty()
            .osLog(domain: .interactor)
            .reduceState(stateStore) { state, asyncState in
                var state = state
                state?.isConnected = false
                return state
            }

    }
    
}
