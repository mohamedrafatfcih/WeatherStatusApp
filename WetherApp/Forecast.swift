//
//  Forecast.swift
//  WetherApp
//
//  Created by RANDOM on 10/6/17.
//  Copyright © 2017 RANDOM. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    init(weatherDic : Dictionary<String,AnyObject>) {
        if let temp = weatherDic["main"] as? Dictionary<String,AnyObject> {
            if let min = temp["temp_min"] as? Double {
                self._lowTemp = "\((min - 273.15))"                
            }
            if let max = temp["temp_max"] as? Double {
                self._highTemp = "\((max - 273.15))"
            }
        }
        if let weather = weatherDic["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        if let date = weatherDic["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "EEEE"
            dateFormater.dateStyle = .full
            dateFormater.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
