import UIKit

public struct Sticker: Codable {
    
    // Bydefault initializer is not public, that's why needed to define it.
    public init(
        name: String,
        birthday: Date?,
        normalizedPosition: CGPoint,
        imageName: String
        ) {
        self.name = name
        self.birthday = birthday
        self.normalizedPosition = normalizedPosition
        self.imageName = imageName
    }
    
    public let name: String
    public let birthday: Date?
    public let normalizedPosition: CGPoint
    public let imageName: String
    
    public var image: UIImage? {
        return FileManager.getPNGFromDocumentDirectory(subdirectoryName: "Stickers", imageName: imageName)
    }
}

// Because of this we can compare saved and loaded Sticker object to check ourselves.
extension Sticker: Equatable {
    public static func == (sticker0: Sticker, sticker1: Sticker) -> Bool {
        return sticker0.name == sticker1.name
            && sticker0.birthday == sticker1.birthday
            && sticker0.normalizedPosition == sticker1.normalizedPosition
            && sticker0.imageName == sticker1.imageName
    }
}
