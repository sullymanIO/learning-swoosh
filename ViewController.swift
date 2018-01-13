//
//  ViewController.swift
//  learning-swoosh
//
//  Created by Suleman Daud on 1/8/18.
//  Copyright © 2018 Suleman Daud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBAction func signup_btclick(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    @IBAction func signINBtnClick(_ sender: Any) {
        
        var success: Bool = false
        for val in usersAll {
            if userNameTextField.text != nil && userPasswordTextField.text != nil
            {
                print(userNameTextField.text!)
                print(userPasswordTextField.text!)
                
                if val.getUserName() == userNameTextField.text && val.getPassword() == userPasswordTextField.text
                {
                    success = true
                }
            }
        }
        if success
        {
            //let UIAlert = UIAlertController(title: "Success", message: "You're Signed IN!", preferredStyle: .alert)
            //UIAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            //self.present(UIAlert, animated: true, completion: nil)
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableViewController") as? TableViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
                // Do any additional setup after loading the view, typically from a nib.
            }
        
        }
        else{
            let UIAlert = UIAlertController(title: "Error", message: "Username or Password is incorrect", preferredStyle: .alert)
            UIAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(UIAlert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

