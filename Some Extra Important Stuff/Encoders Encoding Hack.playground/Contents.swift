//: Playground - noun: a place where people can play

/* Below code is a proof that what these kind of encoders do as part of their formatting behaviour. */


import UIKit

class Himanshu : Codable {
    
    let name: String
    let weight: Int
    let isWhite: Bool
    
    init(name: String, weight: Int, isWhite: Bool) {
        self.name = name
        self.weight = weight
        self.isWhite = isWhite
    }
}

let himanshuObject = Himanshu(name: "Himanshu Dagar", weight: 84, isWhite: true)

let jsonEncoder = JSONEncoder()
let jsonData = try jsonEncoder.encode(himanshuObject)

var array : [UInt8] = []
for character in jsonData {
    array.append(character)
}

for item in array {
    print(Character(UnicodeScalar(item)), terminator: "")
}
print("\n\n")


let arr = ["Manny", "Moe", "Jack"]

let penc = PropertyListEncoder()
penc.outputFormat = .xml
let d = try! penc.encode(himanshuObject)

var array1 : [UInt8] = []
for character in d {
    array1.append(character)
}

for item in array1 {
    print(Character(UnicodeScalar(item)), terminator: "")
}





