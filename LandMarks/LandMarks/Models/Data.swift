//
//  Data.swift
//  LandMarks
//
//  Created by AnatoleZhou on 2019/10/9.
//  Copyright © 2019 AnatoleZhou. All rights reserved.
//

import SwiftUI
import UIKit
import CoreLocation
import ImageIO

let landmarkData: [Landmark] = load("landmarkData.json")
let features = landmarkData.filter { $0.isFeatured }
let hikeData: [Hike] = load("hikeData.json")


func load<T: Decodable>(_ fileName: String, as type: T.Type = T.self) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't  parse \(fileName) as \(T.self): \n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]
    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(verbatim: name))
    }
    
    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: ".jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) {
            return index
        }
        
        images[name] = ImageStore.loadImage(name: name)
        
        return images.index(forKey: name)!
    }
}




