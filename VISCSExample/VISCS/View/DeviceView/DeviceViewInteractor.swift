//
//  DeviceViewInteractor.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  
//

import OSKit
import RxSwift
import UIKit

public protocol IDeviceViewCoordinator: AnyObject {
    func didCompletePrimaryAction(_ interactor: DeviceViewInteractor)
    func presentAlert(_ viewController: UIViewController)
}

public class DeviceViewInteractor: Interactor<DeviceViewState> {
    
    deinit {
        OSLog.debug(domains: logDomains)
    }
    
    let disposeBag = DisposeBag()
    
    public weak var deviceViewCoordinator: IDeviceViewCoordinator?
    
    private var deviceInteractor: DeviceInteractor
    
    private let logDomains: [OSLog.Domain] = [.interactor, .deviceView]

    public init(coordinator: IDeviceViewCoordinator? = nil, deviceInteractor: DeviceInteractor) {
        OSLog.info(domains: logDomains)
        
        self.deviceViewCoordinator = coordinator
        
        self.deviceInteractor = deviceInteractor
        
        let state = DeviceViewState(deviceStateStore: deviceInteractor.stateStore)
        super.init(state: state)
        
        deviceInteractor.stateStore.addSubscriber(self.stateStore)
        
    }
    
    private func connectDevice() {
        OSLog.info(domains: logDomains)
        
        return deviceInteractor.connect()
            .osLog(domain: .deviceView)
            .reduceState(stateStore, reducer: { state, asyncState in
                var state = state
                state?.connectDeviceAsyncState = asyncState
                return state
            })
            .do(onError: { error in
                // TODO: - 1 coordinate error alert
            }, onCompleted: { [weak self] in
                self?.presentConnectDeviceSuccessAlert()
            })
            .subscribe()
            .disposed(by: disposeBag)
            
    }
    
    private func disconnectDevice() {
        OSLog.info(domains: logDomains)
        
        return deviceInteractor.disconnect()
            .osLog(domain: .deviceView)
            .subscribe()
            .disposed(by: disposeBag)
            
    }
    
    private func presentConnectDeviceSuccessAlert() {
        self.deviceViewCoordinator?.presentAlert(connectDeviceSuccessAlertController)
    }
    
    private var connectDeviceSuccessAlertController: UIViewController {
        let alertController = UIAlertController(title: "Success", message: "Your device connected successfully.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        return alertController
    }
    
}

extension DeviceViewInteractor: IActionViewDelegate {
    
    open func didTapPrimaryButton(_ tag: Int?) {
        OSLog.info(domains: logDomains)
        
        if state?.isConnected ?? false {
            deviceViewCoordinator?.didCompletePrimaryAction(self)
        } else {
            connectDevice()
        }
        
    }
    
    open func didTapSecondaryButton(_ tag: Int?) {
        OSLog.info(domains: logDomains)
        
        if state?.isConnected ?? false {
            disconnectDevice()
        }
        
    }
    
}
