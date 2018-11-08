//
//  DemoStep.swift
//  RxFlowSample
//
//  Created by ken.phanith on 2018/11/08.
//  Copyright © 2018 PK. All rights reserved.
//

import RxFlow

enum DemoStep: Step {
    // Onboarding
    case onboarding
    case apiKey
    case apiKeyIsComplete
    case login
    case loginIsComplete
    case onboardingIsComplete
    
    // Dashboard
    case dashboard
    case movieList
    
    // Movies
    case moviePicked (withMovieId: Int)
    case castPicked (withCastId: Int)
    
    // Settings
    case settings
    case about
    case settingsIsComplete
}
