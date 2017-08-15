




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

