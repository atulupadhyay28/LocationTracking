//
//  UserModel.swift
//  LocationTracking
//
//  Created by Atul upadhyay on 09/05/23.
//

import Foundation

class User {
 
    public static func saveUserDetailIntoDefaults(userDetail:LoginData) {
//
//        if !Global.checkObjectBlankOrNull(userDetail.userId) {
//            self.userId =  userDetail.userId
//        } else {
//            self.userId = ""
//        }
    }
    
    public static var isActive:Bool? {
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: "is_active")
        }
        get {
            return UserDefaults.standard.value(forKey: "is_active") as? Bool
        }
    }
    
    public static var userId:String? {
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: "user_id")
        }
        get {
            return UserDefaults.standard.value(forKey: "user_id") as? String
        }
    }
    
    public static var permissionInfo:[String]? {
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: "permission_info")
        }
        get {
            return UserDefaults.standard.value(forKey: "permission_info") as? [String]
        }
    }
    

    
    public static var lastLogin:String? {
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: "last_login")
        }
        get {
            return UserDefaults.standard.value(forKey: "last_login") as? String
        }
    }

    
    
    
    
    
    
    
    public static func saveEditUserDetailIntoDefaults(userData:[String:Any]) {
        
       
        
        
    }
    
}

