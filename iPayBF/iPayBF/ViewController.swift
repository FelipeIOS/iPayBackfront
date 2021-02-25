import UIKit

class ViewController: UIViewController {
    
   
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        
        
    }
    
    func configTableView () {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.nameTextField.delegate = self
    }

  
    @IBAction func sortearTappedButton(_ sender: UIButton) {
    }
}
    



extension ViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}

