import Foundation

public class GetMovieBackdropInteractor {
    
    var presenter: GetMovieBackdropPresenter
    var gateway: MoviesGateway
    
    init(gateway: MoviesGateway, presenter: GetMovieBackdropPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    public func get(movie: Movie) {
        if !movie.backDropPath.isEmpty {
            gateway.getBackdrop(path: movie.backDropPath) { imageData in
                imageData.flatMap({
                    self.presenter.showBackdrop(movie: movie, imageData: $0)
                })
            }
        }
    }
}
