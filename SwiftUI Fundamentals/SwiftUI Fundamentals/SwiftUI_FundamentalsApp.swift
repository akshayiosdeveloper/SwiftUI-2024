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
          //  DashboardView().environment(\.managedObjectContext,persistenceController.container.viewContext)
        
           // AppStoreCardView(isShowContent: $items)
           // AppStoreCardView(category: sampleArticles1[1].category, headline: sampleArticles1[1].headline, subHeadline: sampleArticles1[1].subHeadline, image:  sampleArticles1[1].image, isShowContent: .constant(false)).previewLayout(.fixed(width: 380, height: 500))
            
            AppStoreDashboardView()

        }
    }
}
