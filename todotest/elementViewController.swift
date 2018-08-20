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
    var oneSetKG = [String]()

    @IBOutlet weak var textElement: UITextField!
    @IBOutlet weak var firstKG: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    @IBAction func registerElement(_ sender: Any) {
       
        if UserDefaults.standard.object(forKey: "elementsOfArray") != nil {
            
            elements = UserDefaults.standard.object(forKey: "elementsOfArray") as! [String]
        
        }
        
        elements.append(textElement.text!)

        UserDefaults.standard.set(elements, forKey: "elementsOfArray")
        
        
        self.navigationController?.popViewController(animated: true)
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
