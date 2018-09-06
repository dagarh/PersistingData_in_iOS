import Foundation

public extension FileManager {
    static func copyPNGSubdirectoriesToDocumentDirectory(subdirectoryNames: String...) throws {
        for subdirectoryName in subdirectoryNames {
            
            let documentSubdirectoryURL = URL(fileURLWithPath: subdirectoryName, isDirectory: true, relativeTo: FileManager.documentDirectoryURL)
            
            /* Here we are making use of "createDirectory" instance method of FileManager class. This method will throw an error if subdirectory already exists so we have to put try here. */
            try? FileManager.default.createDirectory(at: documentSubdirectoryURL, withIntermediateDirectories: false, attributes: nil)
            
            guard let imageURLs = Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: subdirectoryName) else {
                continue
            }
            
            for imageURL in imageURLs {
                /* It is just fetching the image bytes data in memory buffer from the image file in our "Resources" folder. */
                let data = try Data(contentsOf: imageURL)
                
                /* It is finally writing image bytes data at specified URL(on drive) atomically.  */
                try data.write(to: documentSubdirectoryURL.appendingPathComponent(imageURL.lastPathComponent), options: .atomic)
            }
        }
    }
    
    static var documentDirectoryURL: URL {
        return try! FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
    }
}
