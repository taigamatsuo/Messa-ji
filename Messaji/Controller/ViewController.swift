//
//  ViewController.swift
//  Messaji
//
//  Created by 松尾大雅 on 2020/10/08.
//  Copyright © 2020 litech. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

       @IBOutlet weak var AddImage: UIImageView!
       @IBOutlet weak var EmailText: UITextField!
       @IBOutlet weak var NameText: UITextField!
       @IBOutlet weak var TextView: UITextView!
    //置いとくだけ
       @IBOutlet weak var E: UIImageView!
       @IBOutlet weak var N: UIImageView!
    
       var saveData : UserDefaults = UserDefaults.standard
   
      
    override func viewDidLoad() {
        super.viewDidLoad()

        // 画像をタップすることを可能に
        self.AddImage.isUserInteractionEnabled = true
        //userdefaultsの定義1
      
        EmailText.text = saveData.object(forKey: "key_EmailText") as? String
        NameText.text  = saveData.object(forKey: "key_NameText") as? String
        TextView.text  = saveData.object(forKey: "key_TextView") as? String
              
        

        }
         

    //登録ボタンで値をKeyChainへ保存する
    @IBAction func save(){
        print("登録しました")
       
        saveData.set(EmailText.text, forKey: "key_EmailText")
        saveData.set(NameText.text, forKey: "key_NameText")
        saveData.set(TextView.text, forKey: "key_TextView")
       
    }
    
    
      // タップされたときの処理
        @IBAction func tapped(sender: UITapGestureRecognizer){
            print("押されました")
            //アラートを出す
            let alert : UIAlertController = UIAlertController(title: "プロフィール写真を選択", message: "", preferredStyle: .alert)
            
            //OKボタン
            alert.addAction(UIAlertAction(title:"OK",style: .default, handler: { action in
                //ボタンが押された時の動作
                print("OKが押されました")
                
                //フォトライブラリの画像を呼び出す
                let imagePickerController : UIImagePickerController = UIImagePickerController()
                imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
                imagePickerController.allowsEditing = true
                self.present(imagePickerController,animated: true , completion: nil)
                imagePickerController.delegate = self
                }
            ))
            alert.addAction(UIAlertAction(title:"Cancel",style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        }
}
    

        extension ViewController {
        
            
        func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
            //選択された画像を取得
            guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage?
                else {return}
            //画像を変更
            self.AddImage.image = selectedImage
            print("画像が選択されました")
            //imagepickerの削除
            self.dismiss(animated: true, completion: nil)
            }
        }

       



    

