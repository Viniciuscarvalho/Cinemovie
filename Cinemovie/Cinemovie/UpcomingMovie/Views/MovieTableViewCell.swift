import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieBackdrop: UIImageView!
    @IBOutlet weak var movieGenresImages: UIStackView!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieBackdropPlaceholder: UIView!
    
    func configure(movie: Movie) {
        movieTitle.text = movie.title.uppercased()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        movieReleaseDate.text = dateFormatter.string(from: movie.releaseDate)
    }
    
    func configure(image: UIImage) {
        movieBackdrop.image = image
        movieBackdropPlaceholder.isHidden = true
    }
    
    func configure(genres: [Genre]) {
        for genre in genres {
            let genreImage = UIImage(named: genre.name)
            let genreImageView = UIImageView(image: genreImage)
            genreImageView.contentMode = UIView.ContentMode.scaleAspectFit
            movieGenresImages.addArrangedSubview(genreImageView)
        }
        movieGenresImages.arrangedSubviews
            .filter({$0.isHidden})
            .forEach(movieGenresImages.removeArrangedSubview)
    }
    
    override func prepareForReuse() {
        movieBackdrop.image = #imageLiteral(resourceName: "Movie")
        movieBackdropPlaceholder.isHidden = false
        movieGenresImages.arrangedSubviews.forEach( {$0.isHidden = true} )
    }
}
