//
//  simpleListController.swift
//  todotest
//
//  Created by 笹倉 一也 on 2018/08/18.
//  Copyright © 2018年 sasakura.company. All rights reserved.
//

import UIKit

class simpleListController: UITableViewController {
    
    var showedArray = [String]()
    var selectedText: String?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    //viewDidLoadが呼ばれない可能性があるため
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //保存されたelementsを取り出す
        if UserDefaults.standard.object(forKey: "elementsOfArray") != nil {
            showedArray = UserDefaults.standard.object(forKey: "elementsOfArray") as! [String]
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if UserDefaults.standard.object(forKey: "elementsOfArray") != nil {
            
            selectedText = UserDefaults.standard.object(forKey: "elementsOfArray") as? String
            
            // 8. SecondViewControllerに渡す文字列をセット
            selectedText = showedArray[indexPath.row]

            
            performSegue(withIdentifier: "showSecondView", sender: nil)
            
            
        }
        
        
    }
    
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return showedArray.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elementTodo", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = showedArray[indexPath.row]
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //elementsの各cellについてdeleteする配列番号の消去
            showedArray.remove(at: indexPath.row)
            //その配列を再び保存
            UserDefaults.standard.set(showedArray, forKey: "elementsOfArray")
            //TableViewの更新
            tableView.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showSecondView") {
            let vc2: detailViewController = (segue.destination as? detailViewController)!
            // ViewControllerのtextVC2にメッセージを設定
            vc2.text = selectedText!
        }
    }

}


