//
//  TodoTableViewCell.swift
//  learning-swoosh
//
//  Created by Suleman Daud on 1/18/18.
//  Copyright © 2018 Suleman Daud. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var toDoTitle: UILabel!
    @IBOutlet weak var toDoDes: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    
    @IBAction func checkBtnClick(_ sender: Any) {
        
        if (checkBtn.backgroundImage(for: UIControlState.normal) == UIImage(named:"icon_todo")){
            checkBtn.setBackgroundImage(UIImage(named:"icon_done"), for: .normal)
        }
        else{
            checkBtn.setBackgroundImage(UIImage(named:"icon_todo"), for: .normal)
        }
        
    }
}

