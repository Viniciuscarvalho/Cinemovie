import UIKit

class UpcomingMoviesDelegate: NSObject, UITableViewDelegate {
    var selectedRow: (Int) -> Void
    
    init(selectedRow: @escaping (Int) -> Void) {
        self.selectedRow = selectedRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow(indexPath.row)
    }
}
