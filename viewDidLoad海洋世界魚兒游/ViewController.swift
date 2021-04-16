//
//  ViewController.swift
//  viewDidLoad海洋世界魚兒游
//
//  Created by Rose on 2021/4/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 載入動畫
        guard let url = Bundle.main.url(forResource: "11265478@2x", withExtension: "png") else { return }
        let cfUrl = url as CFURL
        CGAnimateImageAtURLWithBlock(cfUrl, nil) { (_, cgImage, _) in
            self.imageView.image = UIImage(cgImage: cgImage)
        }

        // 鯊魚
        let sharksEmitterCell = CAEmitterCell()
        // 設定粒子顯示的鯊魚圖片。由於 contents 要求的型別是 CGImage，因此我們產生 UIImage 後要再讀取型別 CGImage 的屬性 cgImage。
        sharksEmitterCell.contents = UIImage(named: "小比目魚")?.cgImage
        // 設定每秒發射幾個鯊魚，我們指定一秒一個。
        sharksEmitterCell.birthRate = 4
        // 鯊魚維持的秒數，我們讓鯊魚只停留兩秒鐘。
        sharksEmitterCell.lifetime = 20
        // 鯊魚移動的速度。
        //sharksEmitterCell.velocity = -30
        //sharksEmitterCell.velocityRange = -20
        // 設定向下移動的加速度，沒有加這個會是由左往右移動
        sharksEmitterCell.xAcceleration = 5
        // 鯊魚大小
        sharksEmitterCell.scale = 0.5
        //  控制鯊魚大小的範圍 0.5-0.3=0.2 ~ 0.5+0.3 = 0.8也就是 0.2~0.8
        sharksEmitterCell.scaleRange = 0.1
        
        // 賽巴斯丁
        let sebastianEmitterCell = CAEmitterCell()
        // 設定粒子顯示的賽巴斯丁圖片。由於 contents 要求的型別是 CGImage，因此我們產生 UIImage 後要再讀取型別 CGImage 的屬性 cgImage。
        sebastianEmitterCell.contents = UIImage(named: "Sebastian")?.cgImage
        // 設定每秒發射幾個賽巴斯丁，我們指定一秒一個。
        sebastianEmitterCell.birthRate = 5
        // 賽巴斯丁維持的秒數，我們讓賽巴斯丁只停留兩秒鐘。
        sebastianEmitterCell.lifetime = 20
        // 賽巴斯丁移動的速度。
        //sebastianEmitterCell.velocity = -30
        //sebastianEmitterCell.velocityRange = -20
        // 設定向下移動的加速度，沒有加這個會是由左往右移動
        sebastianEmitterCell.xAcceleration = -5
        // 賽巴斯丁大小
        sebastianEmitterCell.scale = 0.5
        //  控制賽巴斯丁大小的範圍 0.5-0.3=0.2 ~ 0.5+0.3 = 0.8也就是 0.2~0.8
        sebastianEmitterCell.scaleRange = 0.1
        
        
        // 產生 CAEmitterLayer，將它的 emitterCells 指定為剛剛產生的鯊魚粒子 sharksEmitterCell。
        let sharksEmitterLayer = CAEmitterLayer()
        sharksEmitterLayer.emitterCells = [sharksEmitterCell, sebastianEmitterCell]
        // 鯊魚發射的路徑，落到底部
        //畫面上方的水平線發射
        sharksEmitterLayer.emitterPosition = CGPoint(x: -10, y: -10)
        sharksEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        sharksEmitterLayer.emitterShape = .sphere //可控制鯊魚從哪裡發射.line 將讓鯊魚從水平線發射
        // 利用 addSublayer 將 sharksEmitterLayer 的下雪效果加到畫面上。
        view.layer.addSublayer(sharksEmitterLayer)
        
        

        
        
        
        
    }


}

