import Foundation

public protocol GenresGateway {
    func list(completion: @escaping ([Genre]?, Error?) -> Void)
}

public class GenresGatewayService: GenresGateway {
    
    var webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    public func list(completion: @escaping ([Genre]?, Error?) -> Void) {
        webService.load(resource: Resources.moviesGenres(), completion: { genres, error in
            completion(genres, error)
        })
    }
}
