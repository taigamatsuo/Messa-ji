//
//  ViewController.swift
//  Messaji
//
//  Created by 松尾大雅 on 2020/10/05.
//  Copyright © 2020 litech. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var UserTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       UserTable.delegate = self
       UserTable.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ UserTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.UserTable.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as?
        UserTableViewCell
        
        return cell!
    }
    
    
    
    
}

