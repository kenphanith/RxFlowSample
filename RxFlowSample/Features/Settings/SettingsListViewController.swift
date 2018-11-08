//
//  SettingsListViewController.swift
//  RxFlowSample
//
//  Created by ken.phanith on 2018/11/08.
//  Copyright © 2018 PK. All rights reserved.
//

import UIKit
import Reusable
import RxFlow
import RxSwift
import RxCocoa

class SettingsListViewController: UITableViewController, StoryboardBased, Stepper {
    struct SettingItem {
        let step: DemoStep
        let title: String
    }
    
    let settings = [
        SettingItem(step: .login, title: "Login"),
        SettingItem(step: .apiKey, title: "API Key"),
        SettingItem(step: .about, title: "About")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable.of(settings)
            .bind(to: tableView.rx.items(cellIdentifier: "SettingCell")) { _, element, cell in
                cell.textLabel?.text = element.title
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(SettingItem.self)
            .map { $0.step }
            .bind(to: self.step)
            .disposed(by: disposeBag)
    }
}
