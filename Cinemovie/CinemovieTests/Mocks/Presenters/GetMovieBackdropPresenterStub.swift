import Foundation
@testable import Cinemovie

class GetMovieBackdropPresenterStub: GetMovieBackdropPresenter {
    
    var movie: Movie?
    var imageData: Data?
    
    func showBackdrop(movie: Movie, imageData: Data) {
        self.movie = movie
        self.imageData = imageData
    }
    
}

