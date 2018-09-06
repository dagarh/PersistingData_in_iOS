import Foundation

/* Below things are just about URL, we are not creating any kind of file or directory inside documents directory. */


let mysteryDataURL = URL(
  fileURLWithPath: "mystery",
  relativeTo: FileManager.documentDirectoryURL
)

print(mysteryDataURL.pathComponents,terminator:"\n\n")
print(mysteryDataURL.absoluteURL,terminator:"\n\n")

//: ## String
let stringURL =
  FileManager.documentDirectoryURL
  .appendingPathComponent("string")
  .appendingPathExtension("txt")

print(stringURL.pathExtension,terminator:"\n\n")
print(stringURL.lastPathComponent,terminator:"\n\n")
//: ## Challenge
let challengeString = "himanshu"
let challengeStringURL: URL = URL(fileURLWithPath: challengeString, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")
print(challengeStringURL.path,terminator:"\n\n")
print(challengeStringURL.absoluteURL,terminator:"\n\n")
print(challengeStringURL.lastPathComponent)
