//
//  CastDetailViewController.swift
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

class CastDetailViewController: UIViewController, StoryboardBased, ViewModelBased {
    
    var viewModel: CastDetailViewModel!
    
    @IBOutlet private weak var castBanner: UIImageView!
    @IBOutlet private weak var castBio: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.castBanner.image = UIImage(named: self.viewModel.image)
        self.castBio.text = self.viewModel.bio
    }
    
}
