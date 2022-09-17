//
//  ApiService.swift
//  animeapp
//
//  Created by YONCA YEPREM on 16.09.2022.
//

import Foundation
import Alamofire
import UIKit


protocol ApiServiceProtocol{
    func fetchAnime(params: [String: Any]?, completionHandler: @escaping Handler, url:String?)
}

class ApiService:ApiServiceProtocol {
    func fetchAnime(params: [String : Any]?, completionHandler: @escaping Handler, url: String?) {
        AF.request(url ?? "", method: .get , encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let responseData):
                print(responseData)
                do {
                    let data = try JSONDecoder().decode(AnimeModel.self, from: response.data!)
                    completionHandler(.success(response.data!))
                } catch {
                    completionHandler(.failure(true))
                    print(error)
                }
            case .failure(let error):
                let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                print(error)
                completionHandler(.failure(true))
            }
                
        }
    }
    
    
    static var instance: ApiService?
    
    class func sharedInstamce() -> ApiService {
        self.instance = (self.instance ?? ApiService())
        return self.instance!
    }
    
    
    
    
}
