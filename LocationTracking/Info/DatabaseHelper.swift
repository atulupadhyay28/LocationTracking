//
//  DatabaseHelper.swift
//  LocationTracking
//
//  Created by user on 19/04/23.
//

import UIKit
import CoreData

class DatabaseHelper: NSObject {
    
    static let shareManager = DatabaseHelper()
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "LocationTracking")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    lazy var managedObjectModel:NSManagedObjectModel = {
        let modelUrl = Bundle.main.url(forResource: "LocationTracking", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf:modelUrl)!
    }()
    
    lazy var persistanceStoreCoordinator:NSPersistentStoreCoordinator? = {
        var coordinator:NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory().appendingPathComponent("LocationTracking.sqlite")
        var error:NSError? = nil
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            if try coordinator?.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil) == nil{
                fatalError("Persistance coordinator not added")
            }
            
        }catch let error as NSError{
            print("Unresolved Error:\(error.userInfo)")
        }
        return coordinator
    }()
    
    lazy var managedObjectContext:NSManagedObjectContext? = {
        if #available (iOS 10.0, *){
            
            return self.persistentContainer.viewContext
            
        }else{
            let coordinator = self.persistanceStoreCoordinator
            if coordinator == nil{
                return nil
            }
            var managedObjectContext = NSManagedObjectContext(concurrencyType:.mainQueueConcurrencyType)
            
            managedObjectContext.persistentStoreCoordinator = coordinator
            return managedObjectContext
            
        }
    }()
    
    func applicationDocumentsDirectory() -> URL {
        return (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
    }
    
    func deleteAllData(entity: String)
    {
        func resetAllRecords(in NearByUser : String) 
            {

                let context = persistentContainer.viewContext
                let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: NearByUser)
                let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
                do
                {
                    try context.execute(deleteFetch)
                    try context.save()
                }
                catch
                {
                    print ("There was an error")
                }
            }
    }
    

    
    
    
    
}

