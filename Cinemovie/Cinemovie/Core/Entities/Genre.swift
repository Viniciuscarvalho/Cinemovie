
public protocol Genre {
    var id: Int { get }
    var name: String { get }
}

public struct GenreEntity: Genre {
    
    public var id: Int
    public var name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    public init?(dictionary: JSONDictionary) {
        guard let id = dictionary["id"] as? Int,
            let name = dictionary["name"] as? String
            else { return nil }
        
        self.init(id: id, name: name)
    }
    
}
