//
//  AddUser.swift
//  Messaji
//
//  Created by 松尾大雅 on 2020/10/05.
//  Copyright © 2020 litech. All rights reserved.


import UIKit

class AddUserViewController: UIViewController, UIImagePickerControllerDelegate {

     
    @IBOutlet weak var AddImage: UIImageView!
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var NameText: UITextField!
    //置いとくだけ
    @IBOutlet weak var E: UIImageView!
    @IBOutlet weak var N: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // imagePickerController.delegate = self
        // 画像をタップすることを可能に
        self.AddImage.isUserInteractionEnabled = true
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
    
    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
        AddImage.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    
      // タップされたときの処理
    @IBAction func tapped(sender: UITapGestureRecognizer){
        print("押されました")
        //アラートを出す
        let alert : UIAlertController = UIAlertController(title: "プロフィール写真を選択", message: "", preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(UIAlertAction(title:"OK",style: .default, handler: { action in
            //ボタンが押された時の動作
            print("押されました!")
            var imagePickerController : UIImagePickerController = UIImagePickerController()
            imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePickerController.allowsEditing = true
        }
        ))
        alert.addAction(UIAlertAction(title:"Cancel",style: .default, handler: nil))
    
        present(alert,animated: true, completion: nil)
          //プロフィール写真を選択


          //選択ボタンが押された時の動作
    }

}
   
