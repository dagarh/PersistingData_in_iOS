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


do {
    let jsonURL = URL(fileURLWithPath: "Stickers", relativeTo: FileManager.documentDirectoryURL).appendingPathComponent("sticker").appendingPathExtension("json")
    
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    /* Here you can change date formatting strategies. It means how you want to represent date in JSON. */
    jsonEncoder.dataEncodingStrategy = .deferredToData
    
    /* It is serializing + encoding. So jsonData is containing bytes */
    let jsonData : Data = try jsonEncoder.encode(sticker)
    /* It is just storing bytes data on specified location. */
    try jsonData.write(to: jsonURL, options: .atomic)
    
    let jsonDecoder = JSONDecoder()
    /* This brought bytes data from file location in memory buffer area. */
    let savedJSONData = try Data(contentsOf: jsonURL)
    
    /* Sticker.self is a meta type. "decode" method is decoding + de-serializing. */
    let jsonSticker : Sticker = try jsonDecoder.decode(Sticker.self, from: savedJSONData)
    jsonSticker == sticker
    
}catch let err as NSError {
    print(err)
}
