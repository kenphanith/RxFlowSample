//
//  CastDetailViewModel.swift
//  RxFlowSample
//
//  Created by ken.phanith on 2018/11/08.
//  Copyright © 2018 PK. All rights reserved.
//

class CastDetailViewModel: ServicesViewModel {
    
    typealias Services = HasMoviesService
    
    var services: Services! {
        didSet {
            let cast = self.services.moviesService.cast(forId: castId)
            self.name = cast.name
            self.image = cast.image
            self.bio = cast.bio
        }
    }
    
    private(set) var name = ""
    private(set) var image = ""
    private(set) var bio = ""
    
    public let castId: Int
    
    init(withCastId id: Int) {
        self.castId = id
    }
}
