//
//  ViewController.swift
//  Messaji
//
//  Created by 松尾大雅 on 2020/10/08.
//  Copyright © 2020 litech. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import os

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

       @IBOutlet weak var AddImage: UIImageView!
       @IBOutlet weak var EmailText: UITextField!
       @IBOutlet weak var NameText: UITextField!
       @IBOutlet weak var TextView: UITextView!
       @IBOutlet weak var DateLabel: UILabel!
       @IBOutlet var DateLabel2 : UILabel!
       @IBOutlet weak var E: UIImageView!
       @IBOutlet weak var N: UIImageView!
    
       var saveData : UserDefaults = UserDefaults.standard
       var Userimage : UIImage!
       var request:UNNotificationRequest!
      
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //judgeDate()
        // 画像をタップすることを可能に
        self.AddImage.isUserInteractionEnabled = true
        //userdefaultsの定義
        EmailText.text = saveData.object(forKey: "key_EmailText") as? String
        NameText.text  = saveData.object(forKey: "key_NameText") as? String
        TextView.text  = saveData.object(forKey: "key_TextView") as? String
        
         if saveData.object(forKey: "key_AddImage") != nil {
        let ImageData = saveData.data(forKey: "key_AddImage")
       // Data型からUIImage型へ変換
        let Userimage2 = UIImage(data: ImageData!)
        Userimage = Userimage2
        AddImage.image = Userimage
        }
        
        
    }
    
    func judgeDate(){
        
    //現在のカレンダ情報を設定
    let calender = Calendar.current
    //日本時間を設定
    let now_day = Date(timeIntervalSinceNow: 60 * 60 * 9)
    //日付判定結果
    var judge = Bool()
    // 日時経過チェック
    if saveData.object(forKey: "today") != nil {
         let past_day = saveData.object(forKey: "today") as! Date
         let now = calender.component(.minute, from: now_day)
         let past = calender.component(.minute, from: past_day)
         let diff = calender.dateComponents([.minute], from: past_day, to: now_day)
         print(diff.minute!)
         DateLabel.text = String(diff.minute!)
    
        //日にちが変わっていた場合
                 if now != past {
                    judge = true
        
                 }
                 else {
                    judge = false
                   
                 }
             }
             //初回実行のみelse(nilならば、)
             else {
                 judge = true
                 /* 今の日時を保存 */
                 saveData.set(now_day, forKey: "today")
                 
             }

             /* 日付が変わった場合はtrueの処理 */
             if judge == true {
                  judge = false
                //日付が変わった時の処理
               
             }
             else {
              //日付が変わっていない時の処理をここに書く
                DateLabel.text = "0"
             }
    }
         
    //登録ボタンで値をuserdefaultsへ保存する
        @IBAction func save() {
            
            saveData.set(EmailText.text, forKey: "key_EmailText")
            saveData.set(NameText.text, forKey: "key_NameText")
            saveData.set(TextView.text, forKey: "key_TextView")
            let data = Userimage.pngData()
            saveData.set(data, forKey: "key_AddImage")
            judgeDate()
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
            
            Userimage = selectedImage
            //画像を変更
            self.AddImage.image = Userimage
            print("画像が選択されました")
            //imagepickerの削除
            self.dismiss(animated: true, completion: nil)
            }
        }


    

