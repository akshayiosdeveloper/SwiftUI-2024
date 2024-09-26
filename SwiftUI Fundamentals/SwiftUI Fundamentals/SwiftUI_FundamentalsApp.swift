//
//  SwiftUI_FundamentalsApp.swift
//  SwiftUI Fundamentals
//
//  Created by Akshay Kumar on 04/01/24.
//

import SwiftUI

@main
struct SwiftUI_FundamentalsApp: App {
    //let persistenceController = PersistenceController.shared
    let persistenceController = FinanceAppPersistenceStore.shared

    var body: some Scene {
       
        WindowGroup {
           
            //ContentView()
           // ToDo().environment(\.managedObjectContext,persistenceController.container.viewContext)

           // LayoutInterface()
            DashboardView().environment(\.managedObjectContext,persistenceController.container.viewContext)

        }
    }
}
