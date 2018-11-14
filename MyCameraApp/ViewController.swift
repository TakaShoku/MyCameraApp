//
//  ViewController.swift
//  MyCameraApp
//
//  Created by 曽和寛貴 on 2018/11/14.
//  Copyright © 2018 曽和寛貴. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationBarDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var pictureimage: UIImageView!
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        
//        カメラが利用可能かをチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            print("カメラは利用できます。")
            
//            UIImagePickerControllerのインスタンス作成
            let imagePickerController = UIImagePickerController()
            
//            sourceTypeにcameraを設定
            imagePickerController.sourceType = .camera
            
//            delegateの設定
            imagePickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            
//            モーダルビューで表示
            present(imagePickerController, animated: true, completion: nil)
        }
        
            print("カメラは利用できません。")
    }
    
    @IBAction func snsButtonAction(_ sender: Any) {
        
        }
    
//        撮影が終わった時に呼ばれるdelegateメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
//        撮影したそ写真を、配置したpickerImageに渡す
            pictureimage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
//        モーダルビューを閉じる
            dismiss(animated: true, completion: nil)
        }
    
}

