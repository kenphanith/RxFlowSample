//
//  SettingsApiKeyViewModel.swift
//  RxFlowSample
//
//  Created by ken.phanith on 2018/11/08.
//  Copyright © 2018 PK. All rights reserved.
//

import Foundation
import RxFlow
import RxSwift

class SettingsApiKeyViewModel: Stepper, ServicesViewModel {
    
    typealias Services = HasPreferencesService
    
    var services: Services!
    
    func setApiKey() -> Single<DemoStep> {
        return Single.create { [services] single in
            guard let services = services else { fatalError("Missing services") }
            
            if !services.preferencesService.isOnboarded() {
                services.preferencesService.setOnboarding()
            }
            
            single(.success(.apiKeyIsComplete))
            
            return Disposables.create { }
        }
    }
}
