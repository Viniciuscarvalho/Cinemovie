import Foundation

public class GetMovieBackdropFactory {
    
    public static func make(presenter: GetMovieBackdropPresenter) -> GetMovieBackdropInteractor {
        return GetMovieBackdropInteractor(gateway: MoviesGatewayService(service: WebServiceSession()),
            presenter: presenter)
    }
}
