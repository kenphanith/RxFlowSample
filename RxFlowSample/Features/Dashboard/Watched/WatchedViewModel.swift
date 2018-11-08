//
//  WatchedViewModel.swift
//  RxFlowSample
//
//  Created by ken.phanith on 2018/11/08.
//  Copyright © 2018 PK. All rights reserved.
//

import RxFlow
import RxSwift

class WatchedViewModel: ServicesViewModel {
    
    typealias Services = HasMoviesService
    
    private(set) var movies = [MovieViewModel]()
    
    var services: Services! {
        didSet {
            // we can do some data refactoring in order to display things exactly the way we want (this is the aim of a ViewModel)
            self.movies = self.services.moviesService.watchedMovies().map({ (movie) -> MovieViewModel in
                return MovieViewModel(id: movie.id, title: movie.title, image: movie.image)
            })
        }
    }
}

extension WatchedViewModel: Stepper {
    public func pick (movieId: Int) {
        self.step.accept(DemoStep.moviePicked(withMovieId: movieId))
    }
}
