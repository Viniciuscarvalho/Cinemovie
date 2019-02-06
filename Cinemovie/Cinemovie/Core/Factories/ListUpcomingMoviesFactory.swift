import Foundation

public class ListUpcomingMoviesFactory {
    
    public static func make(presenter: ListUpcomingMoviesPresenter) -> ListUpcomingMoviesInteractor {
        return ListUpcomingMoviesInteractor(moviesGateway: MoviesGatewayService(service: WebServiceSession()),
                                            genresGateway: GenresGatewayService(service: WebServiceSession()),
                                            presenter: presenter)
    }
}
