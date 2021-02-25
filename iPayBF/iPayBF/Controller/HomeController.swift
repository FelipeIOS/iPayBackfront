//
//  HomeController.swift
//  iPayBF
//
//  Created by ANDRE LUIZ TONON on 24/02/21.
//

import Foundation


class HomeController{
    
    var arrrayImage:[String] = ["Image-1","Image-2","Image-3","Image-4","Image-5"]
    var arrayUser:[String] = []
    
    
    func sortUser(){
        
        self.sortedUser = self.arrayUser.randomElement()
        }

    func addUser[name: String?){
    
    self.arrayUser.append(User(name:name?? "", imageName: self.arrayNameImages.ramdomElement() ?? ""))
    }
    
    func count() -> Int {
    
    return self.arrayUser.count
    }
    
    func loadCurrentUser(indexPath: Index Path) -> User {
}

