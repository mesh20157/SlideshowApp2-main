//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Y Iizaka on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var previousImageButton: UIButton!
    @IBOutlet weak var nextImageButton: UIButton!
    
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    // タイマーを宣言
    var timer : Timer!
    
    
    // 画像の配列を宣言
    var imageArray:[UIImage] = [
            UIImage(named: "image1")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のEnlargedViewControllerを取得する
        let enlargedViewController:EnlargedViewController = segue.destination as! EnlargedViewController
        // 遷移先のenlargedViewControllerで宣言しているimageNumberに値を代入して渡す
        enlargedViewController.imageNumber = nowIndex
    }
    
    //拡大した画面から戻る
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    //次の写真を表示
    @IBAction func nextImage(_ sender: Any) {
        
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        
    }
    
    //前の写真を表示
    @IBAction func previousImage(_ sender: Any) {
        
        // indexが0の場合
        if (nowIndex == 0) {
            // indexを一番うしろの数字に戻す
            nowIndex = imageArray.count - 1
        }else{
            // indexを減らして表示する画像を切り替える
            nowIndex -= 1
        }
        
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        
    }

    //スライドショー
    @IBAction func slideShowButton(_ sender: Any) {
        if (timer == nil) {
            
            //再生させる
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            startButton.setTitle("■",for : .normal)
            
            //戻るボタン&次へボタンの非表示&無効化
            previousImageButton.isHidden = true
            previousImageButton.isEnabled = false
            nextImageButton.isHidden = true
            nextImageButton.isEnabled = false
            
            
        } else {
            
            //停止させる
            timer.invalidate()
            
            timer = nil
            startButton.setTitle("▶︎",for : .normal)
            
            //戻るボタン&次へボタンの表示&有効化
            previousImageButton.isHidden = false
            previousImageButton.isEnabled = true
            nextImageButton.isHidden = false
            nextImageButton.isEnabled = true
        
        }
    }

    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    //


}

