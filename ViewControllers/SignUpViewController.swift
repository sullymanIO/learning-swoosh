//
//  SignUpViewController.swift
//  learning-swoosh
//
//  Created by Suleman Daud on 1/9/18.
//  Copyright © 2018 Suleman Daud. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var fNameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePassTextField: UITextField!
    
    @IBAction func backBtn(_ sender: Any) {
//        navigationController?.dismiss(animated: true, completion: {
//
//        })
//        self.navigationController?.dismiss(animated: true, completion: nil)

        if let navigator = self.navigationController {
            navigator.popToRootViewController(animated: true)
        }
        
    }
    @IBAction func signUpBtnClick(_ sender: Any) {
        
        if fNameTextField.text != "" && lNameTextField.text != "" && userNameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" &&
            rePassTextField.text != "" {
            
            if passwordTextField.text == rePassTextField.text {
                let usersObj: users = users()
                let userID = usersObj.numberOfUsers()
                
                let addUserMessage = usersObj.addUser(userFname: fNameTextField.text!, userLname: lNameTextField.text!, userEmail: emailTextField.text!, userNameSi: userNameTextField.text!, userPassword: passwordTextField.text!, userId: userID)
                
                let uiAlertSuccess = UIAlertController(title: "Success", message: addUserMessage, preferredStyle: .alert)
                uiAlertSuccess.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(uiAlertSuccess, animated: true, completion: nil)
                
                
                
            }
            else{
                let uiAlert1 = UIAlertController(title: "Error", message: "Password didn't match", preferredStyle: .alert)
                uiAlert1.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(uiAlert1, animated: true, completion: nil)
                
            }
            
        }
        else {
           let uiAlert = UIAlertController(title: "Error", message: "Please enter all fields", preferredStyle: .alert)
            uiAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(uiAlert, animated: true, completion: nil)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
