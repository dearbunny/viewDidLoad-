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
        sharksEmitterCell.contents = UIImage(named: "sharks")?.cgImage
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
        
        // 鯊魚發射的角度範圍，讓它們有些往左下，有些往右下
        //sharksEmitterCell.emissionRange = CGFloat.pi
        
        // 產生 CAEmitterLayer，將它的 emitterCells 指定為剛剛產生的鯊魚粒子 sharksEmitterCell。
        let sharksEmitterLayer = CAEmitterLayer()
        sharksEmitterLayer.emitterCells = [sharksEmitterCell]
        // 鯊魚發射的路徑，落到底部
        //畫面上方的水平線發射
        sharksEmitterLayer.emitterPosition = CGPoint(x: -10, y: 110)
        sharksEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        sharksEmitterLayer.emitterShape = .circle //可控制鯊魚從哪裡發射.line 將讓鯊魚從水平線發射
        // 利用 addSublayer 將 sharksEmitterLayer 的下雪效果加到畫面上。
        view.layer.addSublayer(sharksEmitterLayer)
        
        

        
        
        
        
    }


}

