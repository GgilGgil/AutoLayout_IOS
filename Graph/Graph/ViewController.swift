//
//  ViewController.swift
//  Graph
//
//  Created by Park GilNam on 2017. 12. 29..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    func changMultipliar(changMultipliar:CGFloat) -> NSLayoutConstraint{
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(item: self.firstItem as Any, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: changMultipliar, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var graph1Height: NSLayoutConstraint!
    @IBOutlet weak var graph2Height: NSLayoutConstraint!
    @IBOutlet weak var graph3Height: NSLayoutConstraint!
    @IBOutlet weak var graph4Height: NSLayoutConstraint!
    @IBOutlet weak var graph5Height: NSLayoutConstraint!
    @IBOutlet weak var graph6Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func change1(_ sender: Any) {
        graph1Height = graph1Height.changMultipliar(changMultipliar: 0.5)
        graph2Height = graph2Height.changMultipliar(changMultipliar: 0.8)
        graph3Height = graph3Height.changMultipliar(changMultipliar: 1)
        graph4Height = graph4Height.changMultipliar(changMultipliar: 0.3)
        graph5Height = graph5Height.changMultipliar(changMultipliar: 0.9)
        graph6Height = graph6Height.changMultipliar(changMultipliar: 0.2)
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func change2(_ sender: Any) {
        graph1Height = graph1Height.changMultipliar(changMultipliar: 1)
        graph2Height = graph2Height.changMultipliar(changMultipliar: 0.3)
        graph3Height = graph3Height.changMultipliar(changMultipliar: 0.6)
        graph4Height = graph4Height.changMultipliar(changMultipliar: 0.8)
        graph5Height = graph5Height.changMultipliar(changMultipliar: 0.2)
        graph6Height = graph6Height.changMultipliar(changMultipliar: 0.5)
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

