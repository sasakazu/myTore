//
//  detailViewController.swift
//  todotest
//
//  Created by 笹倉 一也 on 2018/08/18.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    
    var text = ""
    var oneKGLabel = ""
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var oneSetKGLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        label.text = text
        oneSetKGLabel.text = oneKGLabel
   
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
