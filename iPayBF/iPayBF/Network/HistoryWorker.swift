//
//  HistoryNetwork.swift
//  iPayBF
//
//  Created by Felipe Miranda on 15/03/21.
//

import Foundation
import Alamofire

class HistoryWorker {
    
    func loadHistory(completion:@escaping(_ success: History?, _ error: NSError?) -> Void) {
        
        let urlString: String = "https://run.mocky.io/v3/787f09d0-bdc1-4bfe-8696-a4048276c91b"
        
        guard let url: URL = URL(string: urlString) else {return}
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        AF.request(urlRequest).responseJSON { (response) in
            
            print("response.response==========>")
            print(response.response)
            print(response.result)
            
            if response.response?.statusCode == 200 {
                
                do {
                    if let _data = response.data {
                        let history: History = try History(data: _data)
                        completion(history, nil)
                    }
                }catch{
                    print(error)
                    completion(nil, error as NSError)
                }
            }else{
                completion(nil, NSError())
            }
            
            print("response.result==========>")
            print(response.result)
    
        }
    }
    
    
    func loadHistoryMock(completion:@escaping(_ success: History) -> Void) {
        
        if let path = Bundle.main.path(forResource: "Historico", ofType: "json") {
            
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let history: History = try History(data: data)
                
                completion(history)
                
            }catch{
                
                print(error)
            
            }
            
            
        }
        
        
        
    }
    
    
}
