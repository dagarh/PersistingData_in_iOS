
import Foundation

/* Because of sandboxing restriction of an app(each app is inside its own sandbox), we can not access any of the directories or make our own subdirectories anywhere. So that's why apple has given this document directory where we would be doing most of our stuff related to file handling. */

/* All FileManager methods are thread safe. So we can use "FileManager.default" instance directly and it would work fine even if we have multiple threads, so no need to create separate instance of FileManager class.  */
print(FileManager.documentDirectoryURL)
