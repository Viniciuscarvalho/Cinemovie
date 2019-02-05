import UIKit

class UpcomingMoviesDataSource<T, U: UITableViewCell>: NSObject, UITableViewDataSource {
    var objects: [T] = []
    var images: [Int: UIImage] = [Int: UIImage]()
    private var cellIdentifier = String(describing: U.self)
    private var configureCell: (T, U) -> Void
    
    init(configureCell: @escaping (T, U) -> Void) {
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? U else {
            return tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        }
        configureCell(objects[indexPath.row], cell)
        return cell
    }
}
