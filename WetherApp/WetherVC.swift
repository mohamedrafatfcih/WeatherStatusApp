//
//  MainVC.swift
//  WetherApp
//
//  Created by RANDOM on 10/1/17.
//  Copyright © 2017 RANDOM. All rights reserved.
//

import UIKit
import Alamofire

class WetherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var currentWetherImage: UIImageView!
    @IBOutlet weak var currentWetherType: UILabel!
    @IBOutlet weak var daysDegreeTblView: UITableView!
    
    var weather : CurrentWether!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        daysDegreeTblView.delegate = self
        daysDegreeTblView.dataSource = self
        
        weather = CurrentWether()
        weather.downloadWetherDetails {
            self.downloadWeatherForecast {
                self.updateMainUI()
                // fill table view
            }
            
        }
     //   forecast = Forecast()
        
        
    }
    
    func downloadWeatherForecast(completed: @escaping DownloadComplete) {
        let forecastUrl = URL(string: forecastApi)
        Alamofire.request(forecastUrl!).responseJSON{ response in
            let result = response.result
            if let dic = result.value as? Dictionary<String, AnyObject> {
                if let list = dic["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDic: obj)
                        self.forecasts.append(forecast)
                     //   print(obj)
                    }
                   // self.forecasts.remove(at: 0)
                    self.daysDegreeTblView.reloadData()
                }
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if let cell = daysDegreeTblView.dequeueReusableCell(withIdentifier: "WetherCell", for: indexPath) as? WeatherCell {
            let forecast  = forecasts[indexPath.row]
        cell.configureWeatherCell(forecast: forecast)
        
        return cell
        }
      else {
        return WeatherCell()
        }
    }
    
    func updateMainUI(){
        dateLbl.text = weather.date
        currentTempLbl.text = "\(weather.currentTemp)°"
        currentWetherType.text = weather.wetherType
        locationLbl.text = weather.cityName
        currentWetherImage.image = UIImage(named: weather.wetherType)
    }
}










