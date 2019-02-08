import XCTest
@testable import Cinemovie

class EntityTestCase: XCTestCase {
    
    func loadJson(resource: String) -> JSONDictionary? {
        let bundleTest = Bundle(for: type(of: self))
        if let path = bundleTest.path(forResource: resource, ofType: "json"),
            let jsonNSData = try? NSData(contentsOfFile: path,
                                         options: .dataReadingMapped) {
            let jsonData = jsonNSData as Data
            if let dictionaryFromJson: JSONDictionary = (try? JSONSerialization.jsonObject(with: jsonData, options: [])) as? JSONDictionary {
                return dictionaryFromJson
            }
        }
        return nil
    }

}
