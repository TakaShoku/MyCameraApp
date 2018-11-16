//
//  EffectiveViewController.swift
//  MyCameraApp
//
//  Created by 曽和寛貴 on 2018/11/16.
//  Copyright © 2018 曽和寛貴. All rights reserved.
//

import UIKit

class EffectiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        せ画面遷移時に元の画像を表示
        effectImage.image = orignalImage

    
    }
    
    @IBOutlet weak var effectImage: UIImageView!
    
    let filterArray = ["CIPhotoEffectMono",
                       "CIPhotoEffectChrome",
                       "CIPhotoEffectFade",
                       "CIPhotoEffectInstant",
                       "CIPhotoEffectNoir",
                       "CIPhotoEffectProcess",
                       "CIPhotoEffectTonal",
                       "CIPhotoEffectTransfer",
                       "CISepiaTone",
                       ]
    
//    選択中のエフェクト
    var filterSelectNumber = 0
    
    
//    前の画面から画像を設定
    var orignalImage : UIImage?
    
    @IBAction func effectButtonAction(_ sender: Any) {
        
//        エフェクト前の画像をアンラップしてエフェクト用画像として取り出す
        if let image = orignalImage {
            
//            フィルター名を指定
            let filterName = filterArray[filterSelectNumber]
            
//            次に選択するエフェクトに更新
            filterSelectNumber += 1
        
//            配列と同じか？チェック
            if filterSelectNumber == filterArray.count {
                
//                同じ場合は最後まで選択されたので先頭に戻す
                filterSelectNumber = 0
            }
            
//            元々の画像の回転角度を取得
            let rorate = image.imageOrientation
            
//            UIImage形式の画像をCIImage形式にの画像に変換
            let inputImage = CIImage(image: image)
            
//            フィルターの種類を引数で指定された種類をしてCIFilterのインスタンスを取得
            guard let effectFilter = CIFilter(name: filterName) else {
                
                return
            }
            
//            エフェクトのパラメータを初期化
            effectFilter.setDefaults()
            
//            インスタンスにエフェクトにする元画像を設定
            effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
            
//            エフェクト後のCIImage形式の画像を取り出す
            guard let outPutImage = effectFilter.outputImage else {
                
                return
            }
            
//            CIContextのインスタンスを取得
            let ciContext = CIContext(options: nil)
            
//            エフェクト後の画像をCIContext上に描画し、結果をcgImageとしてCGImage形式の画像を取得
            guard let cgImage = ciContext.createCGImage(outPutImage, from: outPutImage.extent) else {
                
                return
            }
            
//            エフェクト後のあ画像をCGImage形式からUIImage形式に変更、その際に回転角度を指定、ImageViewに表示
            effectImage.image = UIImage(cgImage: cgImage, scale: 1.0, orientation: rorate)
        }
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        
        //        表示画像をアンラップしてシェア画像を取り出す
        if let shareImage = effectImage.image {
            
            //            UIActivityViewControllerに渡す配列を作成
            let shareItems = [shareImage]
            
            //            UIActivityViewControllerにシェア画像を渡す
            let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            
            //            ipadで落ちてまう対策
            controller.popoverPresentationController?.sourceView = view
            
            //            UIActivityViewControllerで表示
            present(controller, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        
//        画面を閉じてめ前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
}
