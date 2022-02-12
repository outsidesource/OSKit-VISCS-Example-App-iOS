//
//  DeviceConnectionService.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit

public protocol IDeviceConnectionService {
    func connect(_ device: Device, _ completion: ((Result<(), Error>) -> ())?)
    func disconnect(_ device: Device)
}

public class DeviceConnectionService: IDeviceConnectionService {
    
    public func connect(_ device: Device, _ completion: ((Result<(), Error>) -> ())?) {
        OSLog.info(domain: .service)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            completion?(.success(()))
            //completion(.failure(DeviceConnectionServiceError.connect(DeviceConnectionServiceError.unavailable)))
        }
        
    }
    
    public func disconnect(_ device: Device) {
        OSLog.info(domain: .service)
    }
    
}
