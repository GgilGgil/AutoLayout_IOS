//
//  ViewController.swift
//  KakaoChat
//
//  Created by Park GilNam on 2018. 1. 3..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    
    var chatData:NSMutableArray = ["hi", "oh!!! hi!!!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTableView.register(UINib(nibName:"MyBubbleTableViewCell", bundle:nil), forCellReuseIdentifier: "myBubbleCell")
        chatTableView.register(UINib(nibName:"YourBubbleTableViewCell", bundle:nil), forCellReuseIdentifier: "yourBubbleCell")
        
        chatTableView.rowHeight = UITableViewAutomaticDimension
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        inputTextView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(noti:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(noti:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(noti:NSNotification) {
        let notiInfo = noti.userInfo! as NSDictionary
        let keyboardFrame = notiInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
        let height = keyboardFrame.size.height
        
        inputViewBottomMargin.constant = -1 * height
        
        let animationDuration = notiInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(noti:NSNotification) {
        inputViewBottomMargin.constant = 0
        
        let notiInfo = noti.userInfo! as NSDictionary
        let animationDuration = notiInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell:UITableViewCell
        
        let dateformatter = DateFormatter()
        dateformatter.locale = NSLocale(localeIdentifier: "ko_KR") as Locale!
        dateformatter.dateFormat = "a h:mm"
        
        let nowTime = dateformatter.string(from: NSDate() as Date)
        
        if indexPath.row % 2 == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myBubbleCell", for: indexPath) as! MyBubbleTableViewCell
            
            cell.bubbleTextLabel.text = (chatData[indexPath.row] as! String)
            cell.timeTextLabel.text = nowTime
            
            defaultCell = cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "yourBubbleCell", for: indexPath) as! YourBubbleTableViewCell
            
            cell.bubbleTextLabel.text = (chatData[indexPath.row] as! String)
            cell.timeTextLabel.text = nowTime
            
            defaultCell = cell
        }
        
        defaultCell.selectionStyle = UITableViewCellSelectionStyle.none
        return defaultCell
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.contentSize.height <= 83 {
            textViewHeight.constant = textView.contentSize.height
        
            textView.setContentOffset(CGPoint.zero, animated: false)
        
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func textInputDone(_ sender: Any) {
        
        if inputTextView.hasText {
            chatData.add(inputTextView.text)
            chatTableView.reloadData()
            
            inputTextView.text = ""
            
            let lastIndexPath = NSIndexPath(row: chatData.count - 1, section: 0) as IndexPath
            
            self.view.layoutIfNeeded()
            
            chatTableView.scrollToRow(at: lastIndexPath, at: UITableViewScrollPosition.bottom, animated: false)
            
            textViewDidChange(inputTextView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

