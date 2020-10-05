//
//  AddUser.swift
//  Messaji
//
//  Created by 松尾大雅 on 2020/10/05.
//  Copyright © 2020 litech. All rights reserved.


import UIKit

class AddUserViewController: UIViewController {

    @IBOutlet weak var AddImage: UIImageView!
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var NameText: UITextField!
    //置いとくだけ
    @IBOutlet weak var E: UIImageView!
    @IBOutlet weak var N: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //空の配列を用意
               var EmailArray : [String] = [""]
               var NameArray  : [String] = [""]
               var ImageArray : [String] = [""]
        //imageView,Email,Nameをそれぞれ値渡し
        if NameText != nil {
              var ET = NameText.text
               EmailArray.append("\(ET)")
           }
        
        if segue.identifier == "toUserTable" {
            
            let next = segue.destination as? MainViewController
        
            next?.outputValue = self.NameText.text
     }
    }
    
        //画面遷移実行
        @IBAction func tapAction(_ sender: Any) {
                performSegue(withIdentifier: "toUserTable", sender: nil)
           }


}
   
