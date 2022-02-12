//
//  AppInteractor.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit
import Resolver
import RxSwift

public protocol IAppInteractor { }

public class AppInteractor: Interactor<AppState>, IAppInteractor {

    let logDomains: [OSLog.Domain] = [.interactor, .app]
    let disposeBag = DisposeBag()
    
    public init() {
        OSLog.info(domains: logDomains)
        super.init(state: AppState())

        //logAppState()
        //logRxAppState()
        
    }
    
    private func logAppState() {
        self.stateStore.addSubscriber(self)
    }
    
    private func logRxAppState() {
        
        self.rx.state
            .osLog(domain: .interactor)
            .subscribe()
            .disposed(by: disposeBag)
        
    }
    
}

extension AppInteractor: IStateStoreSubscriber {

    public func didUpdate(_ state: IState?) {
        OSLog.info(String(describing: state), domain: .interactor)
    }

}
