//
//  Webservice.swift
//  MVVM-iOS
//
//  Created by Sanket Bhamare on 07/10/21.
//

import Foundation

struct Webservice {
    
    func BooksListServiceCall(url:URL, completion : @escaping (BooksModelClass?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let err = error {
                print(err)
            } else if let data = data {
                print(data)
                
                let resData = try? JSONDecoder().decode(BooksModelClass.self, from: data)
                
                if let resData = resData {
                    completion(resData)
                }
                
            } else {
                //                completion(nil)
            }
        }.resume()
    }
}

//struct WebserviceWithGenerics {
//    
//    enum APIError : Error {
//        case ParseError
//        case InternalError
//        case ServerError
//    }
//    
//    enum Method {
//        case GET
//        case POST
//    }
//    
//    func GenericServiceCall<T : Codable>(url:String,method:Method, completion : @escaping (Result<T , APIError>) -> Void) {
//        
//        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
//            
//            if let err = error {
//                print(err)
//                completion(Result.failure(.ServerError))
//            } else if let data = data {
//                let resData = try? JSONDecoder().decode(T.self, from: data)
//                print(resData!)
//                if let resData = resData {
//                    completion(Result.success(resData))
//                } else {
//                    completion(Result.failure(.InternalError))
//                }
//                
//            }
//            
//        }.resume()
//    }
//    
//}
