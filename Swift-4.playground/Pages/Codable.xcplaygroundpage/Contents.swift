//: [Previous](@previous)
//: # Codable
//: You can now very easily encode and decode objects - into JSON is particularly easy, though not the only option
import Foundation

// A simple data structure
struct Employee : Codable {
    var name : String
    var position : String
    
    init(name: String, position: String) {
        self.name = name
        self.position = position
    }
    
    var started = Date()
}

let mary = Employee(name: "Mary", position: "CEO")

do {
    let json = try JSONEncoder().encode(mary)
    
    let jsonString = String(data: json, encoding: .utf8) ?? "error encoding!"
    
    print (jsonString)
    
} catch let error {
    print("Failed to encode: \(error)")
}

// Decoding works similarly

let inputJson = """
{"name":"Mary", "position":"CEO", "started":0.0}
"""

let inputJsonData = inputJson.data(using: .utf8)!
let mary2 = try? JSONDecoder().decode(Employee.self, from: inputJsonData)

mary2?.name 

//: [Next](@next)
