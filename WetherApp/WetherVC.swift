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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        daysDegreeTblView.delegate = self
        daysDegreeTblView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = daysDegreeTblView.dequeueReusableCell(withIdentifier: "WetherCell", for: indexPath)
        return cell
    }
}










