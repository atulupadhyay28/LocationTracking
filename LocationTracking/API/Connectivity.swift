

import Foundation
import Alamofire

class Connectivity {
    
    static let msgNoNetwork = "The Internet connection appears to be offline"
    
    //  Check if device is connected to internet
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
}
