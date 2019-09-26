import Foundation
import RealmSwift

class CartItem: Object {
    @objc dynamic var title: String? = ""
    @objc dynamic var price = 0.0
    @objc dynamic var count = 0
    
    convenience init(title: String, price: Double, count: Int) {
        self.init()
        self.title = title
        self.price = price
        self.count = count
    }
    
}

