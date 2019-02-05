import Foundation

public class ListUpcomingMoviesInteractor {
    
    private var moviesGateway: MoviesGateway
    private var genresGateway: GenresGateway
    private var presenter: ListUpcomingMoviesPresenter
    
    public init(moviesGateway: MoviesGateway, genresGateway: GenresGateway, presenter: ListUpcomingMoviesPresenter) {
        self.moviesGateway = moviesGateway
        self.genresGateway = genresGateway
        self.presenter = presenter
    }
    
    public func list() {
        genresGateway.list { genres, error in
            if let genres = genres {
                self.presenter.loadGenres(genres: genres)
            } else if let error = error {
                self.presenter.displayError(message: error.localizedDescription)
            }
        }
        
        moviesGateway.list(page: 1) { movies, error in
            if let movies = movies {
                self.presenter.displayMovies(movies: movies)
            } else if let error = error {
                self.presenter.displayError(message: error.localizedDescription)
            }
        }
    }
}
