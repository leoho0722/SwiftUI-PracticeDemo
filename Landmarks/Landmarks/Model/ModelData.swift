//
//  JSONDecoder.swift
//  Landmarks
//
//  Created by Leo Ho on 2021/7/6.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
   @Published var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("無法在 Main Bundle 裡找到 \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("無法從 Main Bundle 裡載入 \(filename)\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("無法解析 \(filename) as \(T.self):\n\(error)")
    }
}
