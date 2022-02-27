//
//  notesApp.swift
//  notes WatchKit Extension
//
//  Created by Harsh Goutam on 01/02/22.
//

import SwiftUI

@main
struct notesApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
