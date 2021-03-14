//
//  AccountController.swift
//  iPayBF
//
//  Created by Felipe Miranda on 08/03/21.
//

import Foundation
import Alamofire

class AccountController {
    
    private var account: Account?
    
    var count: Int {
        
        let count = (self.account?.productList.count ?? 0) + 1

        return count
    }
    
    func loadCurrentProduct(indexPath: IndexPath) -> ProductList? {
        return self.account?.productList[indexPath.row]
    }
    
    func loadTotalValue() -> Float {
        
        if let _totalValue = self.account?.totalValue {
            return _totalValue
        }
        
        return 0
    }
    
    func checkIfLastIndex(indexPath: IndexPath) -> Bool {
        
        if indexPath.row == self.account?.productList.count ?? 0 {
            return true
        }
        return false
    }
    
    func loadAccount(completion:@escaping(_ success: Bool, _ error: NSError?) -> Void){
    
        AccountWorker().loadAccount { (account, error) in
            
            if account != nil {
                self.account = account
                completion(true, nil)
            }else{
                completion(false, error)
            }
        }
    }
    
    func loadAccountMock(completion:@escaping(_ success:  Bool, _ error: NSError?) -> Void) {
    }
}
