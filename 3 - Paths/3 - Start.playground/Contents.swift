import Foundation

/* Since each app is in its own sandbox so, document directory path is going to be different for each iOS app and even for playground indeed. */
print(FileManager.documentDirectoryURL.path,terminator:"\n\n")
// It is just a location of users document folder.

let mysteryDataURL = URL(fileURLWithPath: "mystry", relativeTo: FileManager.documentDirectoryURL)
print(mysteryDataURL.path,terminator:"\n\n")

let stringURL = FileManager.documentDirectoryURL.appendingPathComponent("string").appendingPathExtension("txt")
print(stringURL.path,terminator:"\n\n")
print(stringURL.lastPathComponent)
/* There is no file created at this time, we are just making URL here.  */

