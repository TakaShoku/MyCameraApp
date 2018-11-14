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
        }
        
            print("カメラは利用できません。")
    }
    
    @IBAction func snsButtonAction(_ sender: Any) {
    }
    
}

