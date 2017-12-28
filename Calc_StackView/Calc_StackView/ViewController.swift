//
//  ViewController.swift
//  Calc_StackView
//
//  Created by Park GilNam on 2017. 12. 28..
//  Copyright © 2017년 ParkGilNam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var buttonPM: UIButton!
    @IBOutlet weak var buttonMod: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    @IBOutlet weak var buttonMultiplication: UIButton!
    @IBOutlet weak var buttonSubtract: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonEqule: UIButton!
    @IBOutlet weak var buttonPoint: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button0: UIButton!
    
    var buttons:[UIButton] = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [buttonAC, buttonPM, buttonMod, buttonDivision, buttonMultiplication, buttonSubtract, buttonPlus, buttonEqule, buttonPoint, button9, button8, button7, button6, button5, button4, button3, button2, button1, button0]
        
        for button in buttons {
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.borderWidth = 0.3
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

