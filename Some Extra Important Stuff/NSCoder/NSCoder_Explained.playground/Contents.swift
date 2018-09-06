//: Playground - noun: a place where people can play

import UIKit

/*
 Whatever Angela is telling about NSCoder method, that has already been explained by Raywenderlich saving data people in very detailed manner. Angela is just telling about PropertyListEncoders and PropertyListDecoders. But same kind of encoders are present for JSON format also. So now you are happy with NSCoder saving methodology. Always remember that, in order to encode and decode custom type objects, they have to conform to Encodable & Decodable protocols. Implementation of methods would be provided through protocol extensions by apple, so you don't have to provide implementation. But you could override those in order to provide your own custom encoding and decoding strategies on your own custom objects.
 */


/*
 Real advantage, compared to UserDefaults, here is that we can store our different-2 objects in diff-2 plists. So while accessing some object, no need to load other objects now because their plist location is different. So it is memory efficient way than USerDefaults. Always remember that we can also store our custom types using UserDefaults also by some hack [refer to the UserDefaults.swift playground] i.e by converting custom object in 'Data' data type and then storing it. So, real advantage of NSCoder is not about custom objects and all, it is about storing data in whichever format we want like plist, xml or json. And also storing each object's data at separate-separate locations.
 */


/* Below is an example for NSCoder and I did it for an array of custom objects. And in that custom object there is another custom object. So NSCoder works fine for all sort of custom hierarchies provided they all conform to Codable protocol. And we could have used JSONEncoder() and JSONDecoder(). So that's the power of NSCoder method. And each object you can store at different-2 locations. So memory efficient also. */
class Himanshu : Codable, Equatable {
    var name: String = "Himanshu"
    var age: Int = 24
    var weight: Double = 84.5
    var birthdayDate: Date = Date()
    
    var laptops : [Laptop] = [Laptop(color: "Purple")]
    
    convenience init(age: Int) {
        self.init()
        self.age = age
    }
    
    static func == (lhs: Himanshu, rhs: Himanshu) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.weight == rhs.weight && lhs.laptops == rhs.laptops
    }
}

class Laptop : Codable, Equatable {
    var color : String = "Red"
    init(color: String) {
        self.color = color
    }
    
    static func == (lhs: Laptop, rhs: Laptop) -> Bool {
        return lhs.color == rhs.color
    }
    
}
do {
    let pathURL = try URL(fileURLWithPath: "himanshuArray.plist", relativeTo: FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false))
    
    let objArray = [Himanshu(),Himanshu(age: 25)]
    let dataArray : Data = try PropertyListEncoder().encode(objArray)
    try dataArray.write(to: pathURL, options: .atomic)
    
    let savedDataArray = try Data(contentsOf: pathURL)
    let savedObjArray = try PropertyListDecoder().decode([Himanshu].self, from: savedDataArray)
    dataArray == savedDataArray
    objArray == savedObjArray
} catch {
    print(error)
}
