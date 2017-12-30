//
//  PopupViewController.swift
//  Popup
//
//  Created by Park GilNam on 2017. 12. 30..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var popupImgView: UIImageView!
    @IBOutlet weak var popupImgHeight: NSLayoutConstraint!
    @IBOutlet weak var popupCenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupCenterY.constant = 1000
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        popupCenterY.constant = 0
        
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLayoutSubviews() {
        let ratio = (popupImgView.image?.size.width)! / popupImgView.frame.size.width
        
        let calcHeight = (popupImgView.image?.size.height)! / ratio
        
        popupImgHeight.constant = calcHeight 
    }
    
    @IBAction func disMiss(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
