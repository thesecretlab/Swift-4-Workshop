//: [Previous](@previous)
//: # Strings
import Foundation

// Strings are collections now

var message = "Hello, everyone!"

// Swift 3
for character in message.characters {
    print (character)
}

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


//: [Next](@next)
