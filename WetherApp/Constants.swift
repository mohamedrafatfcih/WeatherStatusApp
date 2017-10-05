//
//  Constants.swift
//  WetherApp
//
//  Created by RANDOM on 10/3/17.
//  Copyright © 2017 RANDOM. All rights reserved.
//

import Foundation
    // api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=5c8738385b7df0af7444bc5fbf4d5b14
     let api: String = "http://api.openweathermap.org/data/2.5/weather?"
     let latitude: String = "lat="
     let longitude: String = "&lon="
     let appId: String = "&appid="
     let apiKey: String = "5c8738385b7df0af7444bc5fbf4d5b14"
     typealias DownloadComplete = () -> ()
     var fullApiUrl: String = "\(api)\(latitude)35\(longitude)139\(appId)\(apiKey)"
    
