//
//  elementViewController.swift
//  todotest
//
//  Created by 笹倉 一也 on 2018/08/18.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit

class elementViewController: UIViewController {
    
     var elements = [String]()

    @IBOutlet weak var textElement: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    @IBAction func registerElement(_ sender: Any) {
        //以前に登録していたelementsを読み出す
        if UserDefaults.standard.object(forKey: "elementsOfArray") != nil {
            
            elements = UserDefaults.standard.object(forKey: "elementsOfArray") as! [String]
        
        }
        
        
        //Add element to elementsArray
        elements.append(textElement.text!)
        
        //App内にelementsデータを保存
        UserDefaults.standard.set(elements, forKey: "elementsOfArray")
        
        //状態を保持して戻る
        self.navigationController?.popViewController(animated: true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
