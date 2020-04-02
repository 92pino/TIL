//: A UIKit based Playground for presenting user interface
  
import Foundation
import UIKit
import PlaygroundSupport

let jsonString1 = """
{
    "person": [
        {
            "name": "Bob",
            "age": "16",
            "employed": "No"
        },
        {
            "name": "Vinny",
            "age": "56",
            "employed": "Yes"
        }
    ]
}
"""

let jsonString2 = """
{
    "person": [
        {
            "name": "Bob",
            "age": "16",
            "employed": "No",
            "visited": [
                "Asia": "Korea",
                "America": "USA"
            ]
        }
    ]
}
"""

var persons = [String: Any]()
var ageArr = [String]()
var nameArr = [String]()
var employedArr = [String]()

if let data = try jsonString1.data(using: .utf8) {
    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
    // 전체적인 json 구조가 {"person": [{},{}]} 이므로 [String: Any}
    // 만약 구조가 다를 경우 그에 맞는 타입 캐스팅 필요
    // ex) [{},{},{}] ==> [[String: Any]]
    print(json)
    persons = json
    
    if let person = persons["person"] as? [[String: String]] {
        for personIndex in person {
            nameArr.append(personIndex["name"] as! String)
            ageArr.append(personIndex["age"] as! String)
            employedArr.append(personIndex["employed"] as! String)
        }
    }
}

print(nameArr)
print(ageArr)
print(employedArr)

var persons2 = [String: Any]()
var ageArr2 = [String]()
var employedArr2 = [String]()
var visited2 = [[String: Any]]()

if let data2 = try jsonString2.data(using: .utf8) {
    let json = try! JSONSerialization.jsonObject(with: data2, options: []) as! [String: Any]
    
    print(json)
}

// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()
