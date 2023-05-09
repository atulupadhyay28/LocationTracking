//
//  NearByUserManager.swift
//  LocationTracking
//
//  Created by Atul Upadhyay on 19/04/23.
//

import Foundation
import CoreData
import UIKit


class NearByUserManager : NSObject {
    
    public static func insertNearByUserIntoTable(_ infoDic: NSMutableDictionary) {
        let nearByUsers = NSEntityDescription.insertNewObject(forEntityName: "NearByUser", into: DatabaseHelper.shareManager.managedObjectContext!) as? NearByUser
        if let latitude = infoDic["latitude"] {
            nearByUsers?.lat = latitude as? String
           
        
        }
        if let longitude = infoDic["longitude"] {
            nearByUsers?.lng = longitude as? String
           
        }
        DatabaseHelper.shareManager.saveContext()
    }
    static func getNearByUsers() -> [NearByUser]? {
        
        let context = DatabaseHelper.shareManager.managedObjectContext
        let fetchRequest:NSFetchRequest = NearByUser.fetchRequest()
        do {
            if let result = try context?.fetch(fetchRequest) {
                return result
            }else {
                return nil
            }
        } catch let error as NSError {
            print("Error in Class:\(NSStringFromClass(self)) With error:\(error.localizedDescription)")
            return nil
        }
    }
    
    
    public static func deleteAllNearByLogs() -> Bool {
        
        let context = DatabaseHelper.shareManager.managedObjectContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "NearByUser")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context!.execute(deleteRequest)
            try context!.save()
            return true
        } catch {
            print ("There was an error")
        }
        
        return false
        
    }
}
