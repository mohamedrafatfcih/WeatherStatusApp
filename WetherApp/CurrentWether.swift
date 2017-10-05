//
//  CurrentWether.swift
//  WetherApp
//
//  Created by RANDOM on 10/3/17.
//  Copyright © 2017 RANDOM. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWether {
    
    var _cityName: String!
    var _date: String!
    var _wetherType: String!
    var _currentTemp: Double!
    
    var cityName:String {
            if _cityName == nil {
                _cityName = ""
            }
            return self._cityName
    }
     var date:String {
        if _date == nil {
            _date = ""
        }
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .long
        dateFormater.timeStyle = .none
        let currentDate = dateFormater.string(from: Date())
        _date = "Today,\(currentDate)"
        return self._date
    }
    var wetherType:String {
        if _wetherType == nil {
            _wetherType = ""
        }
        return self._wetherType
    }
    var currentTemp:Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return self._currentTemp
    }
    
    func downloadWetherDetails(completed: @escaping DownloadComplete) {
        let currentWetherUrl = URL(string: fullApiUrl)
        Alamofire.request(currentWetherUrl!).responseJSON { response in
            let result = response.result
          
            if let dic = result.value as? Dictionary<String, AnyObject> {
                
                if let city = dic["name"] as? String {
                    self._cityName = city
                }
                
                if let weather = dic["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let mainWeather = weather[0]["main"] as? String {
                        self._wetherType = mainWeather
                    }
                }
                
                if let mainTemp = dic["main"] as? Dictionary<String,AnyObject> {
                    
                    if let temp = mainTemp["temp"] as? Double {
                        self._currentTemp = temp - 273.15
                    }
                }
            }
            completed()
        }
        
    }
}

