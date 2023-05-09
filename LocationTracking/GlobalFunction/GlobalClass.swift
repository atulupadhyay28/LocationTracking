//
//  GlobalClass.swift
//  LocationTracking
//
//  Created by user on 27/04/23.
//

import Foundation
import UIKit


class Global: NSObject{
    
    static func showRootView(withIdentifier identifier:String) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
        //let navVC = UINavigationController.init(rootViewController: vc)
        let navVC = UINavigationController(rootViewController: vc)
        navVC.isNavigationBarHidden = true
        appDelegate.window?.rootViewController = navVC
    }
    
    public static func checkObjectBlankOrNull(_ checkObject: Any?) -> Bool {
        
        if let obj = checkObject {
            
            if (obj is NSNull) {
                return true
            } else if (obj is [Any]) {
                let arrayob = obj as? [Any]
                if arrayob?.count == 0 {
                    return true
                }
            } else if (obj is [AnyHashable: Any]) {
                
            } else if (obj is String) {
                let str = obj as? String
                if (str?.count ?? 0) == 0 {
                    return true
                }
                if (str == "<null>") {
                    return true
                } else if (str == "(null)") {
                    return true
                }
            }
            return false
        }
        return true
    }
}
