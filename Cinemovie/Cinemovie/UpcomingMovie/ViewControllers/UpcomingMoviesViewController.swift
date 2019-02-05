import UIKit

protocol ListUpcomingMoviesDelegate: class {
    func didList(movies: [Movie])
    func didLoad(genres: [Genre])
    func didGetAvatar(movie: Movie, image: UIImage)
}

class UpcomingMoviesViewController: UIViewController, ListUpcomingMoviesDelegate {
    
    private var cellIdentifier = String(describing: MovieTableViewCell.self)
    private lazy var tableViewDataSource = UpcomingMoviesDataSource<Movie, MovieTableViewCell> { (movie, cell) in
        
        let movieGenres = self.genres.filter({ movie.genresIds.contains($0.id) })
        guard let image = self.tableViewDataSource.images[movie.id] else {
            self.getMovieBackdropInteractor?.get(movie: movie)
            return
        }
        
        UpcomingMoviesCellFactory.generateCell(movie: movie, genres: movieGenres, image: image, cell: cell)
    }
    private var tableViewDelegate: UpcomingMoviesDelegate? = nil
    private var listUpcomingMoviesInteractor: ListUpcomingMoviesInteractor?
    private var getMovieBackdropInteractor: GetMovieBackdropInteractor?
    private var genres: [Genre] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        configureGetMovieBackdropInteractor()
        configureTableView()
        configureUpcomingMoviesInteractor()
        super.viewDidLoad()
    }
    
    private func configureGetMovieBackdropInteractor() {
        getMovieBackdropInteractor = GetMovieBackdropFactory.make(presenter: MovieBackdropPresenter(delegate: self))
    }
    
    private func configureTableView() {
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
        configureTableViewDataSource()
        configureTableViewDelegate()
    }
    
    private func configureTableViewDataSource() {
        tableView.dataSource = tableViewDataSource
    }
    
    private func configureTableViewDelegate() {
        tableViewDelegate = UpcomingMoviesDelegate(selectedRow: { row  in
            if let navigationController = self.navigationController {
                let movie = self.tableViewDataSource.objects[row]
                let movieImage = self.tableViewDataSource.images[movie.id]
                let movieGenres = self.genres.filter({ movie.genresIds.contains($0.id) })
                MoviesRouterNavigation(navigationController: navigationController).movieDetail(movie: movie, movieGenres: movieGenres, movieBackdropImage: movieImage)
            }
        })
        tableView.delegate = tableViewDelegate
    }
    
    private func configureUpcomingMoviesInteractor() {
        listUpcomingMoviesInteractor = ListUpcomingMoviesFactory.make(presenter: UpcomingMoviesPresenter(delegate: self))
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        listUpcomingMoviesInteractor?.list()
    }
    
    func didList(movies: [Movie]) {
        self.tableViewDataSource.objects = self.tableViewDataSource.objects + movies
        tableView.reloadData()
    }
    
    func didLoad(genres: [Genre]) {
        self.genres = genres
    }
    
    func didGetAvatar(movie: Movie, image: UIImage) {
        guard let rowToReload = tableViewDataSource.objects.index(where: {$0.id == movie.id})
            else { return }
        tableViewDataSource.images[movie.id] = image
        self.tableView.reloadRows(at: [IndexPath.init(row: rowToReload, section: 0)], with: .none)
    }
}
