import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty else {
            print("Name is empty")
            return
        }
        
        // Save data to Firestore
        db.collection("users").addDocument(data: ["name": name]) { error in
            if let error = error {
                print("Error adding document: \(error.localizedDescription)")
            } else {
                print("Document added successfully")
            }
        }
    }
}
