//
//  TableViewController.swift
//  learning-swoosh
//
//  Created by Suleman Daud on 1/12/18.
//  Copyright © 2018 Suleman Daud. All rights reserved.
//

import UIKit

var items = ["apple", "banana", "carrot"]
class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var mapLat: Double?
    var mapLong: Double?
    var mapTitle: String?
    var mapDescription: String?
    @IBOutlet weak var tableViewout: UITableView!
    
    let toDoListObj: toDolatlong = toDolatlong()
    //Add to do item button click
    
    @IBAction func addToDoListItemBtn(_ sender: Any) {
        //1. Create the alert controller.
        var Lat: String?
        var Long: String?
        var Title: String?
        var Description: String?
        let alert = UIAlertController(title: "Please add your to do item", message: "Enter the required data", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (latitudeTextField) in
            latitudeTextField.placeholder = "Enter Latitude"
        }
        alert.addTextField { (longitudeTextField) in
            longitudeTextField.placeholder = "Enter Longitude"
        }
        alert.addTextField { (titleTextField) in
            titleTextField.placeholder = "Enter Title"
            
        }
        alert.addTextField { (descriptionTextField) in
            descriptionTextField.placeholder = "Enter Description"
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (_) in
            // Force unwrapping because we know it exists.
            Lat = alert?.textFields?[0].text
            let latDoubleVal = Double(Lat!)
            Long = alert?.textFields?[1].text
            let longDoubleVal = Double(Long!)
            Title = alert?.textFields?[2].text
            Description = alert?.textFields?[3].text
            let addToDoItem = self.toDoListObj.setValuesLatLong(uLat: latDoubleVal!, uLong: longDoubleVal!, uTitle: Title!, uSnippet: Description!)
            print(addToDoItem)
            self.tableViewout.reloadData()
        }))
   
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        

    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        globalLat = toDoList[indexPath.row].getLat()
        globalLong = toDoList[indexPath.row].getLong()
        globalTitle = toDoList[indexPath.row].getTitle()
        globalDescription = toDoList[indexPath.row].getSnippet()
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as? MapViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
            // Do any additional setup after loading the view, typically from a nib.
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewout.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = toDoList[indexPath.row].getTitle()
        return (cell)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewout.delegate = self
        tableViewout.dataSource = self
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
