import Foundation

public typealias JSONDictionary = [String: AnyObject]

public struct Resource<T> {
    
    public let url: URL
    public let parse: (Data) -> T?
    
    public init(url: URL, parseJSON: @escaping (Any) -> T?) {
        self.url = url
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            return json.flatMap(parseJSON)
        }
    }
}

public struct Resources {
    
    private static let baseUrl = "https://api.themoviedb.org/3"
    private static let apiKey = "1f54bd990f1cdfb230adb312546d765d"
    private static let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    
    static func upcomingMovies(page: Int = 1) -> Resource<[Movie]> {
        let upcomingMoviesUrl = URL(string: "\(baseUrl)/movie/upcoming?api_key=\(apiKey)&page=\(page)")!
        return Resource<[Movie]>(url: upcomingMoviesUrl) { json in
            guard let responseDictionary = json as? JSONDictionary,
                let moviesDictionary = responseDictionary["results"] as? [JSONDictionary]
            else { return nil }
            return moviesDictionary.compactMap(MovieEntity.init)
        }
    }
    
    static func moviesGenres() -> Resource<[Genre]> {
        let genresUrl = URL(string: "\(baseUrl)/genre/movie/list?api_key=\(apiKey)")!
        return Resource<[Genre]>(url: genresUrl) { json in
            guard let responseDictionary = json as? JSONDictionary,
                let genresDictionary = responseDictionary["genres"] as? [JSONDictionary]
            else { return nil }
            return genresDictionary.compactMap(GenreEntity.init)
        }
    }
    
    static func movieBackdrop(path: String) -> URL {
        return URL(string: "\(imageBaseUrl)\(path)")!
    }
}
