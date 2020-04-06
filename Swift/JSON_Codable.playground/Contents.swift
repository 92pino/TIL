import UIKit

struct Coordinate: Codable {
  var latitude: Double
  var longitude: Double
}

struct Landmark: Codable {
  var name: String
  var foundingYear: Int
  var vantagePoints: [Coordinate]
  var location: Coordinate
  
  enum CodingKeys: String, CodingKey {
    case name = "title"
    case foundingYear = "founding_date"
    
    case vantagePoints, location
  }
}

struct GroceryProduct: Codable {
  var name: String
  var points: Int
  var description: String?
}

let pear = GroceryProduct(name: "Pear", points: 250, description: "A ripe pear.")

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

do {
  let data = try encoder.encode(pear)
  print(String(data: data, encoding: .utf8)!)
} catch {
  print(error)
}

let json = """
{
  "name": "Durian",
  "points": 600,
  "description": "A fruit with a distinctive scent."
}
""".data(using: .utf8)!

let decoder = JSONDecoder()

do {
  let product = try decoder.decode(GroceryProduct.self, from: json)
  print(product.name)
} catch {
  print(error)
}
