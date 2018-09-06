import Foundation

/* Before starting with below material, first read things from this link about encoding,serialization and de-serialization : chrome://bookmarks/?id=1610  */

/* You should know about the difference between process of serialization & encoding and decoding & de-serialization.  */

/*
 There are 3 things you do when you want to persist data on file system : First convert swift data structure or class/struct/enum objects into some standard format that represents single string[this process is called serialization] and then encoding(utf8) is done to convert that format into binary data or bytes data[this process is called Encoding]. And then finally at the end, we store that binary data, from buffer area,  onto file which is on drive.
 
 Encoding comes into picture when converting serialized data into bytes/binary form.
 
 There are again 3 things you do while loading data from file system : First you bring binary data from file to memory buffer area. Then decode(utf8) that binary data, which is in memory buffer area, into some standard format that represents a single string[this process is called decoding]. Then at the end de-serialize that standard string format back into swift data structure or class/struct/enum objects. So de-serialization is just opposite process of serialization.
 */


/* Q: What is NSData and Data in Swift? : read about this at below link :
    file:///Users/hdagar3/Desktop/Swift_Code_Files/Ray%20Wenderlich%20Saving%20Data/5%20-%20Foundation%20Data/Screen%20Shot%202018-08-08%20at%2012.51.14%20AM.png  */

/*
 In future, you would notice that we have "write" method on all standard swift data types if you upcast the reference to NS<...>. So if you call this 'write' method on those swift standard types, then it will do 3 things for you: (a) it will serialize those types in string format directly as it is. And (b) also do utf8 encoding for you, hence converting that into bytes form. So result of that is bytes/binary data which we can write on to disk directly. And c) as part of this last step it writes that binary data for us in file on disk.
 
 Always remember in swift that if you want to serialize an object then it must conform to Codable[Encodable and Decodable] protocol. This Codable concept is new in swift. Before swift4, they were using NSCoding. Have a read about that on this link: https://medium.com/if-let-swift-programming/migrating-to-codable-from-nscoding-ddc2585f28a4
 */
//: ## Bytes
let mysteryBytes: [UInt8] = [
  240,          159,          152,          184,
  240,          159,          152,          185,
  0b1111_0000,  0b1001_1111,  0b1001_1000,  186,
  0xF0,         0x9F,         0x98,         187
]

let mysteryDataURL = URL(
  fileURLWithPath: "mystery",
  relativeTo: FileManager.documentDirectoryURL
)

// Read from here : https://developer.apple.com/documentation/foundation/data


/* It is doing serialization + encoding for this bytes array and hence mysteryData is in bytes/binray form which you can write on disk like below. */
let mysteryData = Data(bytes: mysteryBytes)

/* It is just putting the bytes data from memory buffer in file on disk. */
try mysteryData.write(to: mysteryDataURL)

/* It is just reading the bytes/binary data from the given file URL and then bringing that in memory buffer. So in memory buffer still that binary data or bytes data is present. */
let savedMysteryData = try Data(contentsOf: mysteryDataURL)

/* It is doing decoding + deserialization for us. */
let savedMysteryBytes = Array(savedMysteryData)

mysteryData == savedMysteryData
mysteryBytes == savedMysteryBytes

/* All swift data types are bydefault serializable and de-serializable because they all conform to Codable protocol. If you want your custom object to be serializable or de-serializable then it has to conform to Codable protocol. */
//: ## String
let stringURL =
  FileManager.documentDirectoryURL
  .appendingPathComponent("string")
  .appendingPathExtension("txt")
//: ## Challenge
let challengeString = "low F#"
let challengeStringURL = URL(
  fileURLWithPath: challengeString,
  relativeTo: FileManager.documentDirectoryURL
).appendingPathExtension("txt")
