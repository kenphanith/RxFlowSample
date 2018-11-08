//
//  AppDelegate.swift
//  RxFlowSample
//
//  Created by ken.phanith on 2018/11/08.
//  Copyright © 2018 PK. All rights reserved.
//

import UIKit
import RxFlow
import RxSwift
import RxCocoa

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let disposeBag = DisposeBag()
    var window: UIWindow?
    var coordinator = Coordinator()
    let moviesService = MoviesService()
    let preferencesService = PreferencesService()
    var appFlow: AppFlow!
    lazy var appServices = {
        return AppServices(moviesService: self.moviesService, preferencesService: self.preferencesService)
    }()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        guard let window = self.window else { return false }
        
        coordinator.rx.didNavigate.subscribe(onNext: { (flow, step) in
            print ("did navigate to flow=\(flow) and step=\(step)")
        }).disposed(by: self.disposeBag)
        
        self.appFlow = AppFlow(withWindow: window, andServices: self.appServices)
        
        coordinator.coordinate(flow: self.appFlow, withStepper: AppStepper(withServices: self.appServices))
        
        return true
    }
    
}

struct AppServices: HasMoviesService, HasPreferencesService {
    let moviesService: MoviesService
    let preferencesService: PreferencesService
}
