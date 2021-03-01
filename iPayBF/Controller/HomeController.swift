//
//  HomeController.swift
//  iPayBF
//
//  Created by Wagner Ongaro Junior on 24/02/21.
//

import Foundation

class HomeController {
    
    var arrayNameImages:[String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    var arrayUser:[User] = []
    var sortedUser:User?
    
    func sortUser(){
        self.sortedUser = self.arrayUser.randomElement()
    }

    func addUser(name:String?){
        self.arrayUser.append(User(name: name ?? "", imageName: self.arrayNameImages.randomElement() ?? ""))
    }
    
    func count() -> Int {
        return self.arrayUser.count
    }
    
    func loadCurrentUser(indexPath: IndexPath) -> User {
        return self.arrayUser[indexPath.row]
    }
    
    func checkUserPayer(indexPath: IndexPath) -> Bool {
        if self.sortedUser === self.arrayUser[indexPath.row] {
            return true
        } else {
            self.arrayUser.remove(at: indexPath.row)
            return false
        }
    }
    
}
