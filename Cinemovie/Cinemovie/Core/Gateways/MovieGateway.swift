import Foundation

public protocol MoviesGateway {
    func list(page: Int, completion: @escaping ([Movie]?, Error?) -> Void)
    func getBackdrop(path: String, completion: @escaping (Data?) -> Void)
}

public class MoviesGatewayService: MoviesGateway {
    
    private var webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    public func list(page: Int, completion: @escaping ([Movie]?, Error?) -> Void) {
        webService.load(resource: Resources.upcomingMovies(page: page), completion: {movies, error in
            completion(movies, error)
        })
    }
    
    public func getBackdrop(path: String, completion: @escaping (Data?) -> Void) {
        webService.download(url: Resources.movieBackdrop(path: path)) { data in
            completion(data)
        }
    }
    
}
