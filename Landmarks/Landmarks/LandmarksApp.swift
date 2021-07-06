//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Leo Ho on 2021/7/5.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
