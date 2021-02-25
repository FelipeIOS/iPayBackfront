

import Foundation


class HomeController {
    
    var arrayNameImages: [String] = ["Image-1","Image-2","Image-3","Image-4","Image-5",]
    var arrarUser:[User] = []
    var sorteUser:User?
    
    func sortUser() {
        self.sorteUser = self.arrarUser.randomElement()
        
    }
    
    func addUser(name: String?) {
        
        self.arrayUser.append (User(name: name ?? "", iamgeName: Self.arrayNameImages.randomElement() ?? "")
        
        
    }
    
    
    func coutn() -> Int{
        return self.arrarUser.count
    }
    
    func loadCurrentUser(indexPath: IdenxPath) -> User {
        
        return self.arrarUser(indexPath.row)
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
