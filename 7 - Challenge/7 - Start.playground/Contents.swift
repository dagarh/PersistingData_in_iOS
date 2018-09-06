import UIKit
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

try mysteryData.write(to: mysteryDataURL.appendingPathExtension("txt"))
//: ## String
let string = String(data: savedMysteryData, encoding: .utf8)!

let stringURL =
  FileManager.documentDirectoryURL
  .appendingPathComponent("string")
  .appendingPathExtension("txt")

try string.write(to: stringURL, atomically: true, encoding: .utf8)
try String(contentsOf: stringURL)
//: ## Challenge
let challengeString = "low F#"
let challengeStringURL = URL(
  fileURLWithPath: challengeString,
  relativeTo: FileManager.documentDirectoryURL
).appendingPathExtension("txt")

/* Below is what "string.write" method is doing under the hood. */

// It is serializing + encoding, even though strings are already serialized but still from theory perspective.
let challengeStringData = challengeString.data(using: .utf8)!
// It is writing binary data to the disk atomically.
try challengeStringData.write(to: challengeStringURL, options: .atomic)


try String(contentsOf: challengeStringURL)

/* Below is what "String(contentsOf:)" method is doing under the hood */

// It is just bringing the binary data content in memory buffer area.
let savedChallengeStringData = try Data(contentsOf: challengeStringURL)
// It is decoding + de-serialization
print(String(data: savedChallengeStringData, encoding: .utf8)!)


