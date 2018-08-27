//
//  intervalViewController.swift
//  todotest
//
//  Created by 笹倉 一也 on 2018/08/27.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit


class intervalViewController: UIViewController {
    
    
    weak var timer: Timer!
    var startTime = Date()

    
    @IBOutlet weak var minute: UILabel!
    @IBOutlet weak var seconds: UILabel!
    @IBOutlet weak var miniSeconds: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func start(_ sender: Any) {
        
        if timer != nil{
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.timerCounter),
            userInfo: nil,
            repeats: true)
        
        startTime = Date()
        
    }
    
    
    
    @IBAction func reset(_ sender: Any) {
        
        if timer != nil{
            timer.invalidate()
            minute.text = "00"
            seconds.text = "00"
            miniSeconds.text = "00"
            
        }
        
    }
    
    @objc func timerCounter() {
        
        let currentTime = Date().timeIntervalSince(startTime)
        
        let minutelo = (Int)(fmod((currentTime/60), 60))
        
        let second = (Int)(fmod(currentTime, 60))
        
        let msec = (Int)((currentTime - floor(currentTime))*100)
        
        let sMinute = String(format:"%02d", minutelo)
        let sSecond = String(format:"%02d", second)
        let sMsec = String(format:"%02d", msec)
        
        minute.text = sMinute
        seconds.text = sSecond
        miniSeconds.text = sMsec
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    
    
    
    
    
    
    
    
    
}
