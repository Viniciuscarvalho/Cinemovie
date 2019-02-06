import UIKit

class UpcomingMoviesDelegate: NSObject, UITableViewDelegate {
    var selectedRow: (Int) -> Void
    var indexPathPage: (IndexPath) -> Void
    
    init(selectedRow: @escaping (Int) -> Void, willDisplay: @escaping (IndexPath) -> Void) {
        self.selectedRow = selectedRow
        self.indexPathPage = willDisplay
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        indexPathPage(indexPath)
    }
}
