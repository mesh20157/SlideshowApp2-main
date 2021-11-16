//
//  EnlargedViewController.swift
//  SlideshowApp
//
//  Created by Y Iizaka on 2021/11/10.
//

import UIKit

class EnlargedViewController: UIViewController {
    
    @IBOutlet weak var enlargedImage: UIImageView!
    
    var imageNumber:Int = 0

    // 画像の配列を宣言
    var imageArray:[UIImage] = [
            UIImage(named: "image1")!,
            UIImage(named: "image2")!,
            UIImage(named: "image3")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nowIndex = imageNumber
        // indexの画像をstoryboardの画像にセットする
        enlargedImage.image = imageArray[nowIndex]
        // Do any additional setup after loading the view.
        
    }
    //
    
    //左にスワイプ
    @IBAction func didSwipeLeft(_ sender: Any) {
        // indexを増やして表示する画像を切り替える
        imageNumber += 1

        // indexが表示予定の画像の数と同じ場合
        if (imageNumber == imageArray.count) {
            // indexを一番最初の数字に戻す
            imageNumber = 0
        }
        // indexの画像をstoryboardの画像にセットする
        enlargedImage.image = imageArray[imageNumber]
        
    }
    
    //右にスワイプ
    @IBAction func didSwipe(_ sender: Any) {
        // indexが0の場合
        if (imageNumber == 0) {
            // indexを一番うしろの数字に戻す
            imageNumber = imageArray.count - 1
        }else{
            // indexを減らして表示する画像を切り替える
            imageNumber -= 1
        }
        
        // indexの画像をstoryboardの画像にセットする
            enlargedImage.image = imageArray[imageNumber]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のViewControllerを取得する
        let viewController:ViewController = segue.destination as! ViewController
        // 遷移先のviewControllerで宣言しているnowIndexに値を代入して渡す
        viewController.nowIndex = imageNumber
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    ///final2
}
