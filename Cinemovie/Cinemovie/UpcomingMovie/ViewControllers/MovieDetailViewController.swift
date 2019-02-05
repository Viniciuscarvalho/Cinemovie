import UIKit

class MovieDetailViewController: UIViewController {
    
    private var movie: Movie?
    private var movieGenres: [Genre]?
    private var movieBackdropImage: UIImage?
    
    @IBOutlet weak var movieBackdrop: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieGenresImages: UIStackView!
    
    convenience init(movie: Movie, movieGenres: [Genre], movieBackdropImage: UIImage?) {
        self.init()
        self.movie = movie
        self.movieGenres = movieGenres
        self.movieBackdropImage = movieBackdropImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureGenres()
    }
    
    private func configureView() {
        guard let movie = movie else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        movieReleaseDate.text = dateFormatter.string(from: movie.releaseDate)
        movieBackdrop.image = movieBackdropImage
        movieTitle.text = movie.title.uppercased()
        movieOverview.text = movie.overview
    }
    
    private func configureGenres() {
        guard let movieGenres = movieGenres else { return }
        for genre in movieGenres {
            let genreImage = UIImage(named: genre.name)
            let genreImageView = UIImageView(image: genreImage)
            genreImageView.contentMode = UIView.ContentMode.scaleAspectFit
            movieGenresImages.addArrangedSubview(genreImageView)
        }
    }
}
