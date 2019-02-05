import Foundation
import UIKit

class MoviesRouterNavigation: MoviesRouter {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func root() {
        let upcomingMoviesViewController = UpcomingMoviesViewController()
        addTitleNavigation(at: upcomingMoviesViewController, with: "Upcoming Movies")
        navigationController.viewControllers = [upcomingMoviesViewController]
    }
    
    func movieDetail(movie: Movie, movieGenres: [Genre], movieBackdropImage: UIImage?) {
        let movieDetailViewController = MovieDetailViewController(movie:
            movie, movieGenres: movieGenres, movieBackdropImage: movieBackdropImage)
        navigationController.pushViewController(movieDetailViewController, animated: true)
    }
    
    private func addTitleNavigation(at viewController: UIViewController, with text: String) {
        viewController.navigationItem.title = text
    }
}
