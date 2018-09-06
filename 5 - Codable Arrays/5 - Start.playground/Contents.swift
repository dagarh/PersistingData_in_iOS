import UIKit

try FileManager.copyPNGSubdirectoriesToDocumentDirectory(subdirectoryNames: "Scenes", "Stickers")

let sticker = Sticker(
  name: "David Meowie",
  birthday: DateComponents(
    calendar: .current,
    year: 1947, month: 1, day: 8
  ).date!,
  normalizedPosition: CGPoint(x: 0.3, y: 0.5),
  imageName: "cat"
)

FileManager.documentDirectoryURL

let anotherSticker = Sticker(
    name: "Frog",
    birthday: DateComponents(
        calendar: .current,
        year: 1980, month: 8, day: 26
        ).date!,
    normalizedPosition: CGPoint(x: 1, y: 0.9),
    imageName: "frog"
)

let stickerArray = [sticker,anotherSticker]

do {
    
    let jsonURL = URL(fileURLWithPath: "stickers", relativeTo: FileManager.documentDirectoryURL.appendingPathComponent("Stickers")).appendingPathExtension("json")
    
    let jsonEncoder = JSONEncoder()
    let jsonData = try jsonEncoder.encode(stickerArray)
    try jsonData.write(to: jsonURL, options: .atomic)
    
    let jsonDecoder = JSONDecoder()
    let savedJSONData = try Data(contentsOf: jsonURL)
    let savedStickersArray =  try jsonDecoder.decode(Array<Sticker>.self, from: savedJSONData)
    stickerArray == savedStickersArray
    jsonData == savedJSONData
}catch {
    print(error)
}

let imagesArray = stickerArray.map { (sticker) -> UIImage? in
    return sticker.image
}
