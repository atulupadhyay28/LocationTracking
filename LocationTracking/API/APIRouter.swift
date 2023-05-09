import Alamofire

enum APIRouter: URLRequestConvertible {
    static let kMerchentId = "VNvJVYHp5LJkYzpUWr28b7hmAkQ0TJWg"
    
   
    case location([String:Any])
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
    
        case .location:
            return .post
        }
    }
    
    private var basePath:String {
        return ""
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .location:
          return "services/saveuserlocation2/data"

        }
    }
    // MARK: - Parameters
    private var parameters: Parameters? {
        
        switch self {
       
        case .location(let parameters):
                    return parameters
    
        }
        
    }
        
    var parameterEncoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.queryString
        case .post:
            return JSONEncoding.default
                
        case .delete:
            return URLEncoding.queryString
            
        default:
            return JSONEncoding.default
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let strUrl = K.ProductionServer.baseURL.appending(path) //"https://8245-122-180-84-118.in.ngrok.io/api/v1/auth/login"//
        
        print(strUrl)
        
        let url = try strUrl.asURL()
        
        var urlRequest = URLRequest(url: url)
        
        // HTTP Method
        if parameters != nil
        {
            urlRequest.httpMethod = "POST"//method.rawValue
            //urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")  // the request is JSON
        }
        
        if (UserDefaults.standard.string(forKey: "AccessToken") != nil)
        {
            let auth = String(format:"Bearer %@",UserDefaults.standard.string(forKey: "AccessToken")!)
            urlRequest.setValue(auth, forHTTPHeaderField: "Authorization")
        }
        
        urlRequest = try parameterEncoding.encode(urlRequest, with: parameters)
        print(urlRequest.url)
        return urlRequest
    }
}

