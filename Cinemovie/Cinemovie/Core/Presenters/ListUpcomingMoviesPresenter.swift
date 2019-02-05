import Foundation

public protocol ListUpcomingMoviesPresenter {
    
    func displayMovies(movies: [Movie])
    func loadGenres(genres: [Genre])
    func displayError(message: String)
}
