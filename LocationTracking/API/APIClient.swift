
import Alamofire
import CodableAlamofire


class APIClient {
    public static func locationApi(parameters:[String:Any],completion:@escaping (Result<Response>) -> Void) {
        performRequest(route: APIRouter.location(parameters), decoder: jsonDecoder, completion: completion)
    }
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder, keyPath:String? = nil, completion:@escaping (Result<T>)->Void) -> DataRequest {
        return Alamofire.request(route).responseDecodableObject(queue: nil, keyPath: keyPath, decoder: decoder, completionHandler: { (response:DataResponse<T>) in
            
            print("Result:\(String(describing: response))")
//            print("Result:\(String(describing: response.response))")
//            print("Result:\(String(describing: response.request))")
//            print("Result:\(String(describing: response.result.value))")
            completion(response.result)
        })
    }
    private static var jsonDecoder:JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        return jsonDecoder
    }
}
