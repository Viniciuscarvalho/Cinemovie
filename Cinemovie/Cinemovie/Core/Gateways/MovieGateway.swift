import Foundation

public protocol MoviesGateway {
    func list(page: Int, completion: @escaping ([Movie]?, Error?) -> Void)
    func getBackdrop(path: String, completion: @escaping (Data?) -> Void)
}

public class MoviesGatewayService: MoviesGateway {
    
    private var service: Service
    
    init(service: Service){
        self.service = service
    }
    
    public func list(page: Int, completion: @escaping ([Movie]?, Error?) -> Void) {
        service.load(resource: Resources.upcomingMovies(page: page), completion: {movies, error in
            completion(movies, error)
        })
    }
    
    public func getBackdrop(path: String, completion: @escaping (Data?) -> Void) {
        service.download(url: Resources.movieBackdrop(path: path)) { data in
            completion(data)
        }
    }
    
}
