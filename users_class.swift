//
//  users_class.swift
//  learning-swoosh
//
//  Created by Suleman Daud on 1/9/18.
//  Copyright © 2018 Suleman Daud. All rights reserved.
//

import Foundation

class users {
    init() {
        
    }
    
    private var email: String?
    private var fname: String?
    private var lname: String?
    private var username: String?
    private var password: String?
    
    
    public func addUser (userFname: String, userLname: String, userEmail: String, userNameSi: String, userPassword: String, userId: Int) -> String
    {
        
        let usersObj: users = users()
        usersObj.email = userEmail
        usersObj.fname = userFname
        usersObj.lname = userLname
        usersObj.password = userPassword
        usersObj.username = userNameSi
        usersAll.append(usersObj)
        
        return "User Added"
    }
    public func numberOfUsers() -> Int
    {
        return usersAll.count
    }
    public func getUserName() -> String{
        if username != ""
        {
        return username!
        }
        else{
            return ""
        }
    }
    public func getPassword() -> String{
        if password != ""
        {
        return password!
        }
        else{
            return ""
        }
    }
        
}
var usersAll = [users]()
