import UIKit

try FileManager.copyPNGSubdirectoriesToDocumentDirectory(subdirectoryNames: "Scenes", "Stickers")

FileManager.documentDirectoryURL

FileManager.getPNGFromDocumentDirectory(subdirectoryName: "Scenes", imageName: "Forest")
FileManager.getPNGFromDocumentDirectory(subdirectoryName: "Stickers", imageName: "frog")
