//
//  CreateAccountViewController.swift
//  LogonProject
//
//  Created by 정교윤 on 2017. 5. 31..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldNickName: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var textFieldPassworldConfirm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initConfig()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initConfig() {
        //textFieldEmail.placeholder = "이메일"
        //textFieldNickName.placeholder = "별명"
        //textFieldPassword.placeholder = "패스워드"
        //textFieldPassworldConfirm.placeholder = "패스워드 확인"
        
    }
    
    // 외부를 터치하면 키보드가 내려간다.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
        textFieldNickName.resignFirstResponder()
        textFieldPassworldConfirm.resignFirstResponder()
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 200.0), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1...300:
            self.view.viewWithTag(textField.tag + 100)?.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            self.signupRequest()
        }
        
        return true
    }

    
    @IBAction func touchUpCancelButton(_ sender: UIButton) {
        // 로그온 페이지로 돌아간다.
        //self.dismiss(animated: true, completion: nil)
        
        // Navigation Controller가 중심이므로 show 로 이동하도록 수정한다. push 로 들어왔을 때 돌아가는 게 pop이다.
        //self.navigationController?.popViewController(animated: true)
        
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func touchUpJoinButton(_ sender: UIButton) {
        
        self.signupRequest()
        
    }
    
    func signupRequest() {
        
        self.view.endEditing(true)
        
        if textFieldEmail.text?.isEmpty == false && textFieldNickName.text?.isEmpty == false && textFieldPassword.text?.isEmpty == false {
            if textFieldPassword.text == textFieldPassworldConfirm.text {
                // UserDefaults 에 저장
                UserDefaults.standard.set(textFieldEmail.text!, forKey: Authentication.email)
                UserDefaults.standard.set(textFieldNickName.text!, forKey: Authentication.nickname)
                UserDefaults.standard.set(textFieldPassword.text!, forKey: Authentication.password)
                
                print(UserDefaults.standard.string(forKey: Authentication.email)!)
                print(UserDefaults.standard.string(forKey: Authentication.nickname)!)
                print(UserDefaults.standard.string(forKey: Authentication.password)!)
                
                // var user:[String:Any] = [:]
                // user.updateValue(textFieldEmail.text!, forKey: Authentication.email)
                // user.updateValue(textFieldNickName.text!, forKey: Authentication.nickname)
                // user.updateValue(textFieldPassword.text!, forKey: Authentication.password)
                
                // var userList:[Any] = UserDefaults.standard.array(forKey: "UserList") ?? [] // nil-coalescing operation
                
                // userList.append(user)
                
                // UserDefaults.standard.set(userList, forKey: "UserList")
                
                
                // UnwindToMain 세그 써서 로그온했다고 판단하고 바로 Main 화면으로 간다.
                UserDefaults.standard.set(true, forKey: Authentication.authenticationBool)
                
                self.performSegue(withIdentifier: Authentication.unwindMainSegueID, sender: self)
            }
            else {
                print("입력하신 패스워드와 확인을 위해 입력하신 패스워드가 서로 일치하지 않습니다!")
            }
        } else {
            print("전부 입력해주세요!")
        }

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
