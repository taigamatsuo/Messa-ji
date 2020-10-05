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
    
    var UserPhoto = ["爺.jpg","ばあ.jpg",""]
    var UserName = ["taro","hanako",""]
    var Date = ["10","20",""]
    
    //*遷移先の値に渡したい変数を格納する変数を定義する
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       UserTable.delegate = self
       UserTable.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ UserTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.UserTable.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as?
        UserTableViewCell
        
        cell?.profileDate.text = self.Date[indexPath.row]
        cell?.profileName.text = self.UserName[indexPath.row]
        cell?.profileImage.image = UIImage(named: self.UserPhoto[indexPath.row])
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    
    
    
}

