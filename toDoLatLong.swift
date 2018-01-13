//
//  toDoLatLong.swift
//  learning-swoosh
//
//  Created by Suleman Daud on 1/12/18.
//  Copyright © 2018 Suleman Daud. All rights reserved.
//

import Foundation

class toDolatlong {
    init()
    {
    }
    
    private var lat: Double?
    private var long: Double?
    private var title: String?
    private var snippet: String?
    
    public func setValuesLatLong(uLat: Double, uLong: Double, uTitle: String, uSnippet: String) -> String {
        
        let toDoListObj: toDolatlong = toDolatlong()
        toDoListObj.lat = uLat
        toDoListObj.long = uLong
        toDoListObj.title = uTitle
        toDoListObj.snippet = uSnippet
        toDoList.append(toDoListObj)
        return "Location Added!"
    }
    public func getLat() -> Double{
        if lat != nil {
            return lat!
        }
        else {
            return 0
        }
    }
    public func getLong() -> Double{
        if long != nil{
            return long!
        }
        else{
            return 0
        }
    }
    public func getTitle() -> String{
        if title != "" {
            return title!
        }
        else {
            return ""
        }
    }
    public func getSnippet() -> String{
        if snippet != "" {
            return snippet!
        }
        else{
            return ""
        }
    }
}
var toDoList = [toDolatlong]()
var globalLat: Double?
var globalLong: Double?
var globalTitle: String?
var globalDescription: String?
