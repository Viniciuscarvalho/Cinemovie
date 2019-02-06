import Foundation

public protocol GenresGateway {
    func list(completion: @escaping ([Genre]?, Error?) -> Void)
}

public class GenresGatewayService: GenresGateway {
    
    var service: Service
    
    init(service: Service) {
        self.service = service
    }
    
    public func list(completion: @escaping ([Genre]?, Error?) -> Void) {
        service.load(resource: Resources.moviesGenres(), completion: { genres, error in
            completion(genres, error)
        })
    }
}
