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

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
       
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "elementsOfArray") != nil {
            showedArray = UserDefaults.standard.object(forKey: "elementsOfArray") as! [String]
        }
        
        tableView.reloadData()
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if UserDefaults.standard.object(forKey: "elementsOfArray") != nil {
            
            selectedText = UserDefaults.standard.object(forKey: "elementsOfArray") as? String
            
            selectedText = showedArray[indexPath.row]

            
            performSegue(withIdentifier: "showSecondView", sender: nil)
            
            
        }
        
    
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showSecondView") {
            let vc2: detailViewController = (segue.destination as? detailViewController)!
           
            vc2.text = selectedText!
          
        }
    }
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }

  

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return showedArray.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elementTodo", for: indexPath)
        
        cell.textLabel?.text = showedArray[indexPath.row]
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           
            showedArray.remove(at: indexPath.row)
           
            UserDefaults.standard.set(showedArray, forKey: "elementsOfArray")
           
            tableView.reloadData()
            
        }
        else if editingStyle == .insert {
           
        }
        
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
        
    }
    
    
   
}


