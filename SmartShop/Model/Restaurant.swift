import Foundation
import ObjectMapper

// MARK: - Welcome

struct RestaurantModel: Mappable {
    
    var restaurant_name: String?
    var restaurant_address: String?
    var restaurant_imageURL: String?
    var popular_categories: [PopularCategoryModel]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        restaurant_name     <- map["restaurant_name"]
        restaurant_address  <- map["restaurant_address"]
        restaurant_imageURL <- map["restaurant_image_url"]
        popular_categories  <- map["popular_categories"]
    }

}

struct PopularCategoryModel: Mappable {
    
    var id: Int?
    var title: String?
    var image_url: String?
    var items: [Item]?

    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id        <- map["id"]
        title     <- map["title"]
        image_url <- map["image_url"]
        items     <- map["items"]
    }
    
}

struct Item: Mappable {
    
    var title: String?
    var details: String?
    var price: Double?
    var image_url: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        title     <- map["title"]
        details   <- map["details"]
        price     <- map["price"]
        image_url <- map["image_url"]
    }
}
