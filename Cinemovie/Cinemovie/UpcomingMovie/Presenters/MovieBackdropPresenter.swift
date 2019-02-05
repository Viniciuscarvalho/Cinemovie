import Foundation
import UIKit

class MovieBackdropPresenter: GetMovieBackdropPresenter {
    private weak var delegate: ListUpcomingMoviesDelegate?
    
    init(delegate: ListUpcomingMoviesDelegate) {
        self.delegate = delegate
    }
    
    func showBackdrop(movie: Movie, imageData: Data) {
        guard let image = UIImage(data: imageData) else { return }
        DispatchQueue.main.async {
            self.delegate?.didGetAvatar(movie: movie, image: image)
        }
    }
}
