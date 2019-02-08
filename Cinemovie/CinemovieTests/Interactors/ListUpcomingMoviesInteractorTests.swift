import XCTest

class ListUpcomingMoviesInteractorTests: XCTestCase {
    
    var interactor: ListUpcomingMoviesInteractor!
    var presenter: ListUpcomingMoviesPresenterStub!
    var moviesGateway: MoviesGateway!
    var genresGateway: GenresGateway!
    var moviesService: ServiceFake<[Movie]>!
    var genresService: ServiceFake<[Genre]>!
    
    override func setUp() {
        moviesService = ServiceFake()
        genresService = ServiceFake()
        moviesGateway = MoviesGatewayService(service: moviesService)
        genresGateway = GenresGatewayService(service: genresService)
        presenter = ListUpcomingMoviesPresenterStub()
        interactor = ListUpcomingMoviesInteractor(moviesGateway: moviesGateway, genresGateway: genresGateway, presenter: presenter)
    }
    
    func testNotListMoviesWhenAnErrorOcurrsWhenGetGenresFromWebService() {
        genresService.error = ErrorFake.error
        
        interactor.list()
        
        XCTAssertEqual(0, presenter.movies.count)
        XCTAssertEqual(0, presenter.genres.count)
        XCTAssertNotNil(presenter.errorMessage)
    }
    
    func testNotListMoviesWhenAnErrorOcurrsWhenGetMoviesFromWebService() {
        moviesService.error = ErrorFake.error
        
        interactor.list()
        
        XCTAssertEqual(0, presenter.movies.count)
        XCTAssertEqual(0, presenter.genres.count)
        XCTAssertNotNil(presenter.errorMessage)
    }
    
    func testListMoviesWhenHasMovies() {
        moviesService.returnedEntity = [MovieEntity(
            id: 0,
            title: "",
            overview: "",
            releaseDate: Date(),
            posterPath: "",
            backDropPath: "",
            genresIds: [] )]
        
        interactor.list()
        
        XCTAssertTrue(presenter.movies.count > 0)
        XCTAssertNil(presenter.errorMessage)
    }
    
}

