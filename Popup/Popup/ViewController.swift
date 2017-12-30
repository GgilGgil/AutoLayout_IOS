//
//  ViewController.swift
//  Popup
//
//  Created by Park GilNam on 2017. 12. 30..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func showPopup(_ sender: Any) {
        let popupVC:PopupViewController = UIStoryboard(name: "Popup", bundle: nil).instantiateViewController(withIdentifier: "popupVC") as! PopupViewController
        
        popupVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupVC, animated: false) {}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

