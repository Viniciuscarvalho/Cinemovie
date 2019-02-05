import Foundation

public protocol Movie {
    
    var id: Int { get }
    var title: String { get }
    var overview: String { get }
    var releaseDate: Date { get }
    var posterPath: String { get }
    var backDropPath: String { get }
    var genresIds: [Int] { get }
    
}

public struct MovieEntity: Movie {
    
    public var id: Int
    public var title: String
    public var overview: String
    public var releaseDate: Date
    public var posterPath: String
    public var backDropPath: String
    public var genresIds: [Int]
    
    public init(id: Int, title: String, overview: String, releaseDate: Date,
                posterPath: String, backDropPath: String, genresIds: [Int]) {
        self.id = id
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterPath = posterPath
        self.backDropPath = backDropPath
        self.genresIds = genresIds
        
    }
    
    public init?(dictionary: JSONDictionary) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let id = dictionary["id"] as? Int,
            let title = dictionary["title"] as? String,
            let overview = dictionary["overview"] as? String,
            let releaseDateString = dictionary["release_date"] as? String,
            let releaseDate = dateFormatter.date(from: releaseDateString),
            let posterPath = dictionary["poster_path"] as? String,
            let backDropPath = dictionary["backdrop_path"] as? String,
            let genresIds = dictionary["genre_ids"] as? [Int]
        else { return nil }
        
        self.init(id: id, title: title, overview: overview, releaseDate: releaseDate, posterPath: posterPath, backDropPath: backDropPath,
                  genresIds: genresIds)
        
    }
}
