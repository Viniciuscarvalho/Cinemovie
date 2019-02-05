import UIKit

public protocol MoviesRouter {
    func root()
    func movieDetail(movie: Movie, movieGenres: [Genre], movieBackdropImage: UIImage?)
}

