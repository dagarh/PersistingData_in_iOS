import Foundation

/* We can access the "Resources" folder using "Bundle.main" in playground. */

// Here we got URLs of all the 3 images inside Scenes subdirectory.
Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: "Scenes")

try FileManager.copyPNGSubdirectoriesToDocumentDirectory(subdirectoryNames: "Scenes","Stickers")
