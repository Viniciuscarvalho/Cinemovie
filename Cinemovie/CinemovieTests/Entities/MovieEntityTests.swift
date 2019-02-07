import XCTest
@testable import Cinemovie

class MovieEntityTests: EntityTestCase {

    var movieDictionary: JSONDictionary!
    
    override func setUp() {
        super.setUp()
        movieDictionary = loadJson(resource: "Movies")
    }
    
    func testConvertJSONDictionaryToMovieEntity() {
        let movies = movieDictionary["results"] as! [JSONDictionary]
        let createdMovies = movies.compactMap(MovieEntity.init)
        
        XCTAssertEqual(1, createdMovies.count)
    }

}
