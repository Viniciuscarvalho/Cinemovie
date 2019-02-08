import Foundation

class ListUpcomingMoviesPresenterStub: ListUpcomingMoviesPresenter {
    
    var movies: [Movie] = []
    var genres: [Genre] = []
    var errorMessage: String?
    
    func displayMovies(movies: [Movie]) {
        self.movies = movies
    }
    
    func loadGenres(genres: [Genre]) {
        self.genres = genres
    }
    
    func displayError(message: String) {
        self.errorMessage = message
    }
    
}
