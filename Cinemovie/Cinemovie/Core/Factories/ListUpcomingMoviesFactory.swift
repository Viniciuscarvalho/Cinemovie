import Foundation

public class ListUpcomingMoviesFactory {
    
    public static func make(presenter: ListUpcomingMoviesPresenter) -> ListUpcomingMoviesInteractor {
        return ListUpcomingMoviesInteractor(moviesGateway: MoviesGatewayService(webService: WebServiceSession()),
                                            genresGateway: GenresGatewayService(webService: WebServiceSession()),
                                            presenter: presenter)
    }
}
