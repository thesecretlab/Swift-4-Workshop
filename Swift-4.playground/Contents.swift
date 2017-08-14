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


//: # Key paths
//: Key paths allow you to describe a "path" to a value, through multiple nested types.

// A driver has a vehicle, and a vehicle has a paint color

struct Driver {
    var name : String
    var vehicle : Vehicle
}

struct Vehicle {
    enum PaintColor {
        case red, green, blue
    }
    var color: PaintColor
}

// Create the key path to "the colour of the vehicle of a driver"
let carColor = \Driver.vehicle.color

/*:
 Note that the type of `carColor` depends on whether `Vehicle.color` is mutable.
It will be `KeyPath` if `Vehicle.color` is `let`, and `WritableKeyPath` if `var`.
 */

// Create some objects to test with
var bigRedCar = Vehicle(color: .red)
var me = Driver(name: "Jon", vehicle: bigRedCar)

// Get a value via the key path
me[keyPath: carColor] // = .red
me[keyPath: carColor] = .green

// Changing values through key paths works the same as though
// you'd done it by hand
me.vehicle.color // = .green

//: # Strings

// Strings are collections now

var message = "Hello, everyone!"

for character in message {
    print(character)
    // We don't have to say message.characters anymore!
    // Though we can if you want to!
    message.characters
}

// Graphemes are a little easier to deal with now
"💏".count // in swift 3, this was 4; is now 1

// Multi-line strings are now a thing!

var intro = """
    Space: the final frontier.

    These are the voyages of the starship Enterprise.

    Its five-year mission:
        to explore strange new worlds,
        to seek out new life and new civilizations,
        to boldly go where no man has gone before.
    """

//: The indentation of the string is controlled by the indentation of the closing delimiter. This means that only the last three lines in this string are indented.

//: # One-sided ranges

// We can now represent a range that's infinite on one side
var fromOneToInfinity = 1...
var upToTwenty = ...20

//: Let's print each character, with a number before each one!

// Zip together the message and a sequence that starts at 1
var numberedLetters = zip(message, 1...)

for entry in numberedLetters {
    print("\(entry.1): \(entry.0)")
}

// We can also use one-sided ranges for pattern matching

var temperature = 25

switch temperature {
case ...20:
    print("Too cold!")
case 21...30:
    print("Nice!")
case 31...:
    print("Too hot!")
default:
    print("Not representable in these ranges!")
}

//: # Dictionaries with sequences

// Split apart the string by spaces and newlines, resulting in an array
// of words
var words = intro.components(separatedBy: CharacterSet.whitespacesAndNewlines)

var wordDictionary = Dictionary(uniqueKeysWithValues: zip(1..., words))

wordDictionary[12] // "starship"

// Creating a dictionary with word counts

let wordsAndOnes = zip(words, repeatElement(1, count: words.count))

// This produces a sequence that looks like this:
//  ("Space:", 1),
//  ("the", 1),
//  ("final", 1),

// (and so on)

var wordCount = Dictionary(wordsAndOnes, uniquingKeysWith: { (value1, value2) -> Int in
    // We can't have two identical keys in the dictionary, so one of them will be kept.
    // In this method, we're given the two conflicting values, and asked to return one
    // For this example, we resolve it by adding them
    return value1 + value2
})

// We could also just as easily use +:
// var wordCount = Dictionary(wordsAndOnes, uniquingKeysWith: +)

wordCount["the"] // = 3

// You can now filter dictionaries and sets

let popularWords = wordCount
    .filter { $0.value > 2 } // only include words that appear twice or more
    .map { $0.key.uppercased() } // map each entry to an uppercased string

// = ["NEW", "THE", "TO", ""]

