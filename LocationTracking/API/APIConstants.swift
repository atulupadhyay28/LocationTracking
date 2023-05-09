
import Foundation

struct K {
    struct ProductionServer {
        static let baseURL = "https://location.aibiztools.com/"
       
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case merchantId = "x-oc-merchant-id"
    case sessionId = "X-oc-session"
}

enum ContentType: String {
    case json = "application/json"
}


