//
//  ViewController.swift
//  Animation
//
//  Created by Masaki Horimoto on 2015/12/18.
//  Copyright © 2015年 Masaki Horimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var positionViewLeft: UIView!
    @IBOutlet weak var positionViewRight: UIView!
    @IBOutlet weak var orangeColorView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    var animationFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        print("\(__FUNCTION__) is called!!")
        
        /**
        アニメーション移動後のViewの座標を設定します。
        アニメション後の座標の管理方法はアプリによって異なると思われます。
        */

        //アニメーションするか否か確認。アニメーションしない場合にはreturnする。
        if animationFlag == false {
            return
        }
        
        orangeColorView.center = positionViewRight.center   //移動後のorangeColorViewの座標を設定
        animationFlag = false                               //アニメーションフラグをfalseに
        
        
    }

    /**
     ボタンを押した時の動作。アニメーション実行のトリガ
     */
    @IBAction func pressButton(sender: AnyObject) {
        
        print("\(__FUNCTION__) is called!!")
        
        animationFlag = true            //アニメーションフラグをtrueにする
        
        self.textLabel.text = "After"   //テキストをafterへ変更 (←これがアニメーションが意図しない動きになる原因！！)
 
        animationLocateWithView(orangeColorView, targetPoint: positionViewRight.center) //アニメーション実行
        
    }
    
    /**
     指定されたViewを指定された中心座標へアニメーションする
     
     - parameter targetView:アニメーションさせるView
     - parameter targetPoint:異動先の座標
     */
    func animationLocateWithView(targetView :UIView, targetPoint :CGPoint) {
        
        print("\(__FUNCTION__) is called!!")
        
        let animationSpeed = 1.0
        
        UIView.animateWithDuration(animationSpeed, animations: { () -> Void in

            targetView.center = targetPoint
            }, completion: nil)
    }


}

