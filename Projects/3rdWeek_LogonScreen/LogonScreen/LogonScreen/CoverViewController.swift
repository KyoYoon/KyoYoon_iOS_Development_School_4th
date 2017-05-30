//
//  ViewController.swift
//  LogonScreen
//
//  Created by 정교윤 on 2017. 5. 28..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class CoverViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldID: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initConfig()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 외부를 터치하면 키보드가 내려간다.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textFieldID.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
    }
    
    func initConfig() {
        textFieldID.layer.borderWidth = 0.5
        textFieldID.layer.cornerRadius = 6
        textFieldID.placeholder = "아이디 (예: abcd1234@gmail.com)"
        textFieldID.delegate = self
        
        textFieldPassword.layer.borderWidth = 0.5
        textFieldPassword.layer.cornerRadius = 6
        textFieldPassword.placeholder = "비밀번호를 입력하세요."
        textFieldPassword.delegate = self
        
        //textFieldPassword.isSecureTextEntry = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 1:
            print(textField.tag)
            textFieldPassword.becomeFirstResponder() // 아이디 입력 칸에서 리턴키 입력했을 때
        case 2:
            print(textField.tag)
            textField.resignFirstResponder() // 비밀번호 입력 칸에서 리턴키 입력했을 떼
        default:
            print("wrong")
            textField.resignFirstResponder()
        }
        
        
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
//        switch textField.tag {
//        case 1:
//            print(textField.tag)
//            
//        case 2:
//            print(textField.tag)
//            
//            // 패스워드
//            
//        default:
//            print("wrong")
//            
//        }
        
//        guard let text = textField.text else { return true }
//        let newLength = text.characters.count + string.characters.count - range.length
//        return newLength <= limitLength
        
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
    
    @IBAction func touchUpLoginButton(_ sender: UIButton) {
        
        print("로그인버튼이 눌려졌습니다.")
        
        // 다음 페이지로 전송 
        
    }
    
    @IBAction func touchUpForgotPasswordButton(_ sender: UIButton) {
        
        
        
    }

    @IBAction func touchUpCreateAccountButton(_ sender: UIButton) {
    }

}

