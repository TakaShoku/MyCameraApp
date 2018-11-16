//
//  ViewController.swift
//  MyCameraApp
//
//  Created by 曽和寛貴 on 2018/11/14.
//  Copyright © 2018 曽和寛貴. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var pictureimage: UIImageView!
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        
//        カメラかフォトライブラリーのどちらから画像取得を選択
        let alertController = UIAlertController(title: "確認", message: "選択してください", preferredStyle: .actionSheet)
        
        
//        カメラが起動可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//        カメラを起動するための選択肢を定義
            let cameraAction = UIAlertAction(title: "カメラ", style: .default, handler: { (action:UIAlertAction) in
//                カメラの起動
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .camera
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
        })
            
        alertController.addAction(cameraAction)
        }
        
        
//        フォトライブラリーが起動可能かどうかチェック
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//        フォトライブラリーを起動するための選択肢を定義
        let photoLibraryAction = UIAlertAction(title: "フォトライブラリー", style: .default, handler:  { (action:UIAlertAction) in
//            フォトライブラリーを起動
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
            self.present(imagePickerController, animated: true, completion: nil)
        })
        alertController.addAction(photoLibraryAction)
        }
        
//        キャンセルの選択肢を定義
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
//        ipadで落ちてまう対策
        alertController.popoverPresentationController?.sourceView = view
        
//        選択肢を画面に表示
        present(alertController, animated: true, completion: nil)
        
        
    }
    
//        撮影が終わった時に呼ばれるdelegateメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
//        撮影したそ写真を、配置したpickerImageに渡す
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
//        モーダルビューを閉じる
        dismiss(animated: true, completion: {
            
//            エフェクト画面に遷移
            self.performSegue(withIdentifier: "showEffectiveView", sender: nil)
            
            })
        }
    
//    次の画面遷移するときに渡す画像を格納する場所
    var captureImage : UIImage?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        次の画面のインスタンスを格納
        if let nextViewController = segue.destination as? EffectiveViewController {
            
//            次の画面のインスタンスに取得した画面を渡す
            nextViewController.orignalImage = captureImage
        }
    }
    
}

