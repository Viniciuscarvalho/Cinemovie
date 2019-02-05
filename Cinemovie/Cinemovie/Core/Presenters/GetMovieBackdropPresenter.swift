import Foundation

public protocol GetMovieBackdropPresenter {
    func showBackdrop(movie: Movie, imageData: Data)
}
