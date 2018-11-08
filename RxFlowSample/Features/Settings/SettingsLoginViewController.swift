//
//  SettingsLoginViewController.swift
//  RxFlowSample
//
//  Created by ken.phanith on 2018/11/08.
//  Copyright © 2018 PK. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import RxFlow

class SettingsLoginViewController: UIViewController, StoryboardBased, Stepper {
    
    @IBOutlet weak var proceedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        proceedButton.rx.tap
            .map { DemoStep.loginIsComplete }
            .bind(to: self.step)
            .disposed(by: disposeBag)
    }
    
}
