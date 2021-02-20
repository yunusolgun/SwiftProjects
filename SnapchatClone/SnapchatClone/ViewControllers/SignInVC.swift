//
//  ViewController.swift
//  SnapchatClone
//
//  Created by yunus olgun on 16.02.2021.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        if passwordText.text != "" && emailText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (result, error) in
                if error != nil {
                    self.makeAlert("Error", error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            makeAlert("Error", "Password/Email ?")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if userNameText.text! != "" && passwordText.text != "" && emailText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert("Error", error?.localizedDescription ?? "Error")
                } else {
                    
                    let fireStore = Firestore.firestore()
                    let userDictionary = ["email": self.emailText.text!, "username": self.userNameText.text!] as [String:Any]
                    fireStore.collection("UserInfo").addDocument(data: userDictionary) { (error) in
                        if error != nil {
                            //
                        }
                    }
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            makeAlert("Error", "Username/Password/Email ?")
        }
    }
    
    func makeAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

