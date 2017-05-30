//
//  ViewController.swift
//  DelegateTest
//
//  Created by 정교윤 on 2017. 5. 26..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldTF1: UITextField! // tag = 1
    @IBOutlet weak var textFieldTF2: UITextField! // tag = 2
    @IBOutlet weak var textFieldTF3: UITextField! // tag = 3
    @IBOutlet weak var textViewTV1: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initConfig()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initConfig() {
        //textFieldTF1.text = "텍스트필드 1"
        textFieldTF1.placeholder = "고정 텍스트"
        textFieldTF1.delegate = self // delegate 설정
        
        textFieldTF2.delegate = self // delegate 설정
        
        textFieldTF3.delegate = self // delegate 설정
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 1:
            print(textField.tag)
            textFieldTF2.becomeFirstResponder() // textFieldTF1 에서 리턴키 입력했을 떼
        case 2:
            print(textField.tag)
            textFieldTF3.becomeFirstResponder() // textFieldTF2 에서 리턴키 입력했을 떼
        case 3:
            print(textField.tag)
            textField.resignFirstResponder() // textFieldTF3 에서 리턴키 입력했을 떼
        default:
            print("wrong")
            textField.resignFirstResponder()
        }
        
        
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        print("location: \(range.location)")
        print(range.length)
        print(currentText)
        print(range)
        print(string)
        
        //let length = prospectiveText.characters.count
        
        return prospectiveText.characters.count <= 10
       
    }
        
    

}

