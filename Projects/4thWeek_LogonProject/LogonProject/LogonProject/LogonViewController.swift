//
//  ViewController.swift
//  LogonProject
//
//  Created by 정교윤 on 2017. 5. 31..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class LogonViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //UITableView
        
        initConfig()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func initConfig() {
        
        // custom navigation bar를 위해 기존 navigation bar를 숨김
        self.navigationController?.isNavigationBarHidden = true
        
        self.view.endEditing(true)
        UserDefaults.standard.set(false, forKey: Authentication.authenticationBool)
        //textFieldEmail.placeholder = "이메일"
        //textFieldPassword.placeholder = "패스워드"
        
        
    }
    
    // 외부를 터치하면 키보드가 내려간다.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 160.0), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 100:
            self.view.viewWithTag(200)?.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            // 바로 로그온 처리를 한다.
            self.loginRequest()
        }
        
        return true
    }
    
    func moveToCreatAccountView() {
        // CreateAccountViewController 인스턴스 생성
        //let vc:CreateAccountViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateAccountViewController") as! CreateAccountViewController
        
        // 이동
        //self.present(vc, animated: true, completion: nil)

    }
    
    func loginRequest() {
        self.view.endEditing(true)
        
        if self.textFieldEmail.text?.isEmpty == false && self.textFieldPassword.text?.isEmpty == false {
            
//            let userList:[[String:Any]] = UserDefaults.standard.array(forKey: "UserList") as! [[String:Any]]
//            
//            // user = [String:Any]
//            for user in userList {
//                let userEmail:String = user[Authentication.email]! as! String
//                let pw:String = user[Authentication.password] as! String
//                if textFieldEmail.text != userEmail && textFieldPassword.text != pw {
//                    UserDefaults.standard.set(true, forKey: Authentication.authenticationBool)
//                    
//                    
//                    
//                }
//            }
            
            if self.textFieldEmail.text! == UserDefaults.standard.string(forKey: Authentication.email) && self.textFieldPassword.text! == UserDefaults.standard.string(forKey: Authentication.password) {
                print("로그인 성공")
                
                UserDefaults.standard.set(true, forKey: Authentication.authenticationBool)
                // main 페이지로 이동 - Entry Point가 메인페이지였다가 다시 로그온페이지로 온 것이므로 이전 단계로 돌아가기 위해 dismiss를 쓴다.
                //self.dismiss(animated: true, completion: nil)
                
               
                
                // Navigation Controller를 썼으므로 아래와 같이 코드를 수정한다.
                let vc:MainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                
                // Navigation Controller가 중심이므로 show 로 이동한다. 
                self.navigationController?.pushViewController(vc, animated: true)
                
                
            }
            else {
                print("로그인 실패")
                //UserDefaults.standard.set(false, forKey: Authentication.authenticationBool)
                
                let alert:UIAlertController = UIAlertController(title: Authentication.loginFailTitle, message: Authentication.loginFailMsg, preferredStyle: .alert) // .actionsheet
                
                let okBtn:UIAlertAction = UIAlertAction(title: Authentication.okBtnTitle, style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction) in
                    print("ok 버튼을 클릭하였습니다.")
                })
                let cancelBtn = UIAlertAction(title: Authentication.cancelBtnTitle, style: UIAlertActionStyle.default, handler: nil) // UIAlertActionStyle.cancel
                
                
                alert.addAction(okBtn)
                alert.addAction(cancelBtn)
                
                self.present(alert, animated: true, completion: nil)
            }
        }
        else {
            print("이메일과 비밀번호를 모두 입력하세요.")
            //UserDefaults.standard.set(false, forKey: Authentication.authenticationBool)
            
            
        }
        
    }
    
    
    @IBAction func touchUpCreateAccount(_ sender: UIButton) {
        //self.moveToCreatAccountView()
    }
    
    @IBAction func touchUpLoginButton(_ sender: UIButton) {
        self.loginRequest()
        
    }

}

