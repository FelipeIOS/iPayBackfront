//
//  AccountController.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 08/03/21.
//

import Foundation
import Alamofire

class AccountController {
    
    private var account: Account?
    
    var count:Int {
        return self.account?.productList.count ?? 0
    }
    
    func loadCurrentProduct(indexPath: IndexPath) -> ProductList? {
        return self.account?.productList[indexPath.row]
    }
    
    func loadAccount(completion:@escaping(_ success: Bool, _ error: NSError?) -> Void) {
        
    let urlString: String = "https://run.mocky.io/v3/82375610-cc6d-4261-9581-7ec9f0ee1fbe"
    
    guard let url: URL = URL(string: urlString) else {return}
    var urlRequest:URLRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    urlRequest.setValue("application/jason; charset=utf-8", forHTTPHeaderField: "Content-Type")
    
    AF.request(urlRequest).responseJSON { (response) in
        
        print("response.response========>")
        print(response.response)
        
        if response.response?.statusCode == 200 {
            
            do {
                if let _data = response.data {
                    let account:Account = try Account(data: _data)
                    self.account = account
                    completion(true, nil)
                }
            }catch{
                print(error)
                completion(false, error as NSError)
            }
            
        }else{
            completion(false, NSError())
        }
        
        print("response.result========>")
        print(response.result)
        
        
        
    }
    
        
    }
    
    public func loadAccountMock(completion:@escaping(_ account: Account) -> Void) {
         
         if let path = Bundle.main.path(forResource: "Account", ofType: "json") {
             
             do {
                 
                 let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                 
                 let account: Account = try Account(data: data)
                 
                 completion(account)
                 
             } catch{
                 
                 print(error)
             }
             
         }
         
     }
    
}
