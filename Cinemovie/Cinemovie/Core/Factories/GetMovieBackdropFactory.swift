import Foundation

public class GetMovieBackdropFactory {
    
    public static func make(presenter: GetMovieBackdropPresenter) -> GetMovieBackdropInteractor {
        return GetMovieBackdropInteractor(gateway: MoviesGatewayService(webService: WebServiceSession()),
            presenter: presenter)
    }
}
