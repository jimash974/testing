//
//  Persistence.swift
//  BLINK
//
//  Created by mitun,felix on 21/06/23.
//

import CoreData
import SwiftUI

class ApplicationData : ObservableObject{
    let container : NSPersistentContainer
    
    init(){
        container = NSPersistentContainer (name : "BLINK")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: {
            storeDesrciption, error in
            if let error = error as NSError? {
                fatalError("error di container")
            }
        })
    }
}
