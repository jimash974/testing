//
//  BLINKApp.swift
//  BLINK
//
//  Created by Jeremy Christopher on 21/06/23.
//

import SwiftUI

@main
struct BLINKApp: App {

    @StateObject var appData = ApplicationData()

    var body: some Scene {
        WindowGroup {
            inputDataView()
                .environmentObject(appData)
                .environment(\.managedObjectContext,appData.container.viewContext)
//            ContentView()
//               .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
