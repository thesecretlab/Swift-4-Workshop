//: [Previous](@previous)

import Foundation

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

//: [Next](@next)
