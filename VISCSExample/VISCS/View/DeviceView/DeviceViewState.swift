//
//  DeviceViewState.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit

public struct DeviceViewState: IActionViewState {
    
    private weak var deviceStateStore: StateStore<DeviceState>?
    
    public init(deviceStateStore: StateStore<DeviceState>) {
        self.deviceStateStore = deviceStateStore
    }
    
    public var connectDeviceAsyncState: AsyncState<(), Error>?
    
    public let navigationItemState: NavigationItemState = NavigationItemState(title: "Setup Device")
    public let titleLabelState: LabelState = LabelState(isHidden: true)
    
    public var subtitleLabelState: LabelState {
        let deviceStatusDescription = deviceStateStore?.state?.statusDescription ?? "Unknown"
        let deviceConnectionDescription = String(deviceStateStore?.state?.isConnected ?? false)
        let text = "DeviceState.statusDescription: \(deviceStatusDescription)\nDeviceState.isConnected: \(deviceConnectionDescription)"
        return LabelState(text: text)
    }
    
    public var primaryButtonState: ButtonState {
        let isEnabled = !isBusy
        let title = isConnected ? "Done" : "Connect Device"
        return ButtonState(isEnabled: isEnabled, title: title)
    }
    
    public var secondaryButtonState: ButtonState {
        let isEnabled = isConnected && !isBusy
        let title = isConnected ? "Disconnect Device" : " "
        return ButtonState(isEnabled: isEnabled, title: title)
        
        //let isHidden = !isConnected
        //return ButtonState(isHidden: isHidden, isEnabled: isEnabled, title: "Disconnect Device")
    }
    
    public var activityIndicatorState: ActivityIndicatorViewState {
        let isAnimating = isBusy
        return ActivityIndicatorViewState(isAnimating: isAnimating)
    }
    
    public var isConnected: Bool {
        return deviceStateStore?.state?.isConnected ?? false
    }
    
    private var isBusy: Bool {
        return connectDeviceAsyncState?.isBusy ?? false
    }
    
}
