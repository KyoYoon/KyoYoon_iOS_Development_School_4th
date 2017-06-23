//
//  ViewController.swift
//  NotificationTest
//
//  Created by 정교윤 on 2017. 6. 22..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var index:Int = 0

    @IBOutlet weak var labelFirstView: UILabel!
    @IBOutlet weak var labelKeyboard: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelTextChange: UILabel!
    
    var text:String = ""
    
    // memory warning이 일어나서 뷰가 지워졌을 때 다시 viewDidLoad를 호출한다.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 아래 구문을 두 번 쓰면 두 번 callNoti 가 실행된다.
        // selector 안에 메소드는 objective C 문법을 따른다.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.callNoti(_:)), name: Notification.Name("postNoti"), object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.keyboardAppear(_:)),
                                               name: Notification.Name.UIKeyboardWillShow,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.keyboardDisappear),
                                               name: Notification.Name.UIKeyboardWillHide,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.textChange(_:)),
                                               name: Notification.Name.UITextFieldTextDidChange,
                                               object: nil)
        
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(ViewController.trackingPostTwo(_:)),
//                                               name: Notification.Name.UIKeyboardWillShow,
//                                               object: nil)
        
        //self.performSelector(inBackground: trackingPost(<#T##noti: Notification##Notification#>), with: <#T##Any?#>)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(ViewController.trackingPost(_:)),
//                                               name: Notification.Name.UIKeyboardWillShow,
//                                               object: "키보드")
        
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.endEditing(true)
    }
    
    func callNoti(_ sender:Notification) {
        index += 1
        print("noti call \(index)")
        labelFirstView.text = sender.object as? String
    }
    
    @IBAction func textFieldValueChanged(_ sender: UITextField) {
        
        print(sender.text!)
        
        //NotificationCenter.default.post(name: Notification.Name.UIKeyboardWillShow, object: sender.text ?? "")
        
    }
    
    
//    @IBAction func textEditingDidEnd(_ sender: UITextField) {
//        
//        print("textEditingDidEnd")
//        
//        NotificationCenter.default.post(name: Notification.Name.UIKeyboardWillShow, object: sender.text ?? "")
//        
//    }
    
    
    func trackingPostTwo(_ sender:Notification) {
        print("tracking post two")
        //print(text)
        
        labelKeyboard.text = sender.object as? String
    }
    
    func keyboardAppear(_ noti:Notification) {
        print("keyboard appear")
        
        print(noti.userInfo)
        labelKeyboard.text = "키보드 나타남"
    }
    
    func keyboardDisappear() {
        labelKeyboard.text = "키보드 사라짐"
    }
    
    func textChange(_ noti:Notification) {
        print("textChange")
        labelTextChange.text = textField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        NotificationCenter.default.removeObserver(self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }


}

