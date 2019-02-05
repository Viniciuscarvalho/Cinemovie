import Foundation
import UIKit

class UpcomingMoviesPresenter: ListUpcomingMoviesPresenter {
    private weak var delegate: ListUpcomingMoviesDelegate?
    
    init(delegate: ListUpcomingMoviesDelegate) {
        self.delegate = delegate
    }
    
    func loadGenres(genres: [Genre]) {
        DispatchQueue.main.async {
            self.delegate?.didLoad(genres: genres)
        }
    }
    
    func displayMovies(movies: [Movie]) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.delegate?.didList(movies: movies)
        }
    }
    
    func displayError(message: String) {
        
    }
}
