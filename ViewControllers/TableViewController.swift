//
//  TableViewController.swift
//  learning-swoosh
//
//  Created by Suleman Daud on 1/12/18.
//  Copyright © 2018 Suleman Daud. All rights reserved.
//

import UIKit
var mapLat: Double?
var mapLong: Double?
var mapTitle: String?
var mapDescription: String?

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewout: UITableView!

    let toDoListObj: toDolatlong = toDolatlong()
    
    @IBAction func addToDoListItemBtn(_ sender: Any) {


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
        let cell = tableViewout.dequeueReusableCell(withIdentifier: "cell") as! TodoTableViewCell

        cell.toDoTitle.text = toDoList[indexPath.row].getTitle()
        cell.toDoDes.text = toDoList[indexPath.row].getSnippet()
        
        return (cell)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewout.delegate = self
        tableViewout.dataSource = self
        
        
            let objTodoList = toDolatlong()
        if mapTitle != nil {
            let returnVal = objTodoList.setValuesLatLong(uLat: mapLat!, uLong: mapLong!, uTitle: mapTitle!, uSnippet: mapDescription!)
           print(returnVal)
        }
            self.tableViewout.reloadData()
            
        
        
        }
    
    }
