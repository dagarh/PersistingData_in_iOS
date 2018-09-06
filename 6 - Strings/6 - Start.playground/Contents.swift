import Foundation
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

let mysteryData = Data(bytes: mysteryBytes)
try mysteryData.write(to: mysteryDataURL)

let savedMysteryData = try Data(contentsOf: mysteryDataURL)
let savedMysteryBytes = Array(savedMysteryData)
savedMysteryBytes == mysteryBytes
savedMysteryData == mysteryData

/* Now save mysteryData to specified location but with an extension. Finder would be able to decode for us now and hence cat would be shown by finders decoding. */
try mysteryData.write(to: mysteryDataURL.appendingPathExtension("txt"), options: .atomic)

//: ## String
/* This is failable initializer, that's why force unwrapping it. It is decoding + deserializing into String form. */
let string = String(data: savedMysteryData, encoding: .utf8)!

let stringURL =
  FileManager.documentDirectoryURL
  .appendingPathComponent("string")
  .appendingPathExtension("txt")

/* So use below methods for working with string instead of going via Data class. */

/* It is serializing + encoding + saving to disk. */
try string.write(to: stringURL, atomically: true, encoding: .utf8)

/* It is bringing file data in memory bytes buffer + decoding + de-serializing. utf8 is by-default decoding here. So you don't need to provide any specific encoding parameter here. */
try String(contentsOf: stringURL)
//: ## Challenge
let challengeString = "low F#"
let challengeStringURL = URL(
  fileURLWithPath: challengeString,
  relativeTo: FileManager.documentDirectoryURL
).appendingPathExtension("txt")
