
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class APIClient: NSObject {
    
    let BASE_URL: URL
    
    static let shared: APIClient = { APIClient(baseUrl: SettingManager.shared.apiURL) }()
    
    required init(baseUrl: String){
        self.BASE_URL = URL(string: baseUrl)!
    }
    
    
    func get<T> (success: @escaping (Int, T?) -> (), failure: @escaping (Int) -> ()) where T: BaseMappable {
        
        AF.request(BASE_URL, method: .get
            , parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<T>) in
                
                switch response.result {
                case let .success(value):
                    success(response.response!.statusCode, value)
                case let .failure(error):
                    break
                }
              
        }
       
    }
        
        
    
    

}
