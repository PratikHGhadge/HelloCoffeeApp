import Foundation

struct Order: Codable, Identifiable, Hashable {
    var id: Int?
    var name: String
    var coffeeName: String
    var total: Double
    var size: CoffeeSize
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}
