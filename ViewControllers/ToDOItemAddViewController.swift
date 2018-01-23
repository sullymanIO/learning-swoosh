//
//  ToDOItemAddViewController.swift
//  learning-swoosh
//
//  Created by Suleman Daud on 1/22/18.
//  Copyright © 2018 Suleman Daud. All rights reserved.
//

import UIKit

class ToDOItemAddViewController: UIViewController {
    
    @IBAction func unwindFromAddItemVC (uiUnWingSegue: UIStoryboardSegue)
    {
        
    }

    @IBOutlet weak var inputDesFromUser: UITextField!
    @IBOutlet weak var inputLatFromUser: UITextField!
    @IBOutlet weak var inputLongFromUser: UITextField!
    @IBOutlet weak var inputTitleFromUser: UITextField!
    var latDoubleVal: Double?
    @IBAction func saveBtnTap(_ sender: Any) {

        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableViewController") as? TableViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
                if inputLatFromUser != nil && inputLongFromUser != nil && inputTitleFromUser != nil && inputDesFromUser != nil
                {
                    
                    mapLat = Double(inputLatFromUser.text!)
                    mapLong = Double(inputLongFromUser.text!)
                    mapTitle = inputTitleFromUser.text
                    mapDescription = inputDesFromUser.text
                }
            }
            // Do any additional setup after loading the view, typically from a nib.
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
