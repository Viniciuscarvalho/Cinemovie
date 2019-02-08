import XCTest

class GetMovieBackdropInteractorTests: XCTestCase {

    var interactor: GetMovieBackdropInteractor!
    var gateway: MoviesGateway!
    var presenter: GetMovieBackdropPresenterStub!
    var service: ServiceFake<Data>!
    var movie: MovieEntity!
    
    override func setUp() {
        presenter = GetMovieBackdropPresenterStub()
        service = ServiceFake()
        gateway = MoviesGatewayService(service: service)
        interactor = GetMovieBackdropInteractor(gateway: gateway, presenter: presenter)
        movie = MovieEntity(
            id: 0,
            title: "",
            overview: "",
            releaseDate: Date(),
            posterPath: "",
            backDropPath: "/some",
            genresIds: [])
        super.setUp()
    }
    
    func testNotShowImageWhenDataIsNone() {
        interactor.get(movie: movie)
        
        XCTAssertNil(presenter.imageData)
        XCTAssertNil(presenter.movie)
    }
    
    func testNotShowImageWhenAvatarUrlIsNone() {
        movie.backDropPath = ""
        
        interactor.get(movie: movie)
        
        XCTAssertNil(presenter.imageData)
        XCTAssertNil(presenter.movie)
    }
    
    func testShowImageWhenAvatarDataIsSome() {
        service.returnedEntity = Data()
        
        interactor.get(movie: movie)
        
        XCTAssertNotNil(presenter.imageData)
        XCTAssertNotNil(presenter.movie)
    }
}
