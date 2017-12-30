//
//  ViewController.swift
//  ExpandCell
//
//  Created by Park GilNam on 2017. 12. 30..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var heightArr:NSMutableArray = []
    
    var textDataArr = ["shot text",
                       "long long long long long long text",
                       "very long very long very long very long very long very very long very long very long very long very long very very long very long very long very long very long very very long very long very long very long very long very long text",
                       "very long very long very long very long very long very very long very long very long very long very long very very long very long very long very long very long very very long very long very long very long very long very long textvery long very long very long very long very long very very long very long very long very long very long very very long very long very long very long very long very very long very long very long very long very long very long text"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.rowHeight = UITableViewAutomaticDimension
        
        for _ in 0..<textDataArr.count {
            heightArr.add(false)
        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! myCell
        
        cell.myLabel.text = textDataArr[indexPath.row]
        
        if heightArr[indexPath.row] as! Bool == false {
            cell.myLabel.numberOfLines = 1
        } else {
            cell.myLabel.numberOfLines = 0
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if heightArr[indexPath.row] as! Bool == false {
            heightArr.replaceObject(at: indexPath.row, with: true)
        } else {
            heightArr.replaceObject(at: indexPath.row, with: false)
        }
        
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

