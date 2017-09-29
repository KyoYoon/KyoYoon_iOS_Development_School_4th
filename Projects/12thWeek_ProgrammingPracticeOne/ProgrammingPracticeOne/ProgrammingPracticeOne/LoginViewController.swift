//
//  LoginViewController.swift
//  ProgrammingPracticeOne
//
//  Created by 정교윤 on 2017. 7. 24..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController:UIViewController {
    
    let loginButton:UIButton = {
        
        // UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.layer.cornerRadius = 5
        
        btn.setTitleColor(.white, for: .normal)
        
        btn.addTarget(self, action: #selector(loginActionHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        btn.backgroundColor = UIColor.rgbColor(149, 204, 244)
        
        btn.isEnabled = false
        
        return btn
        
        
    }()
    
    func loginActionHandler() {
        print ("action Login")
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if let error = error
            {
                print("error://",error)
                return
            
            }
            
            // success 
            print("userID", user?.uid)
            
            // main tab bar controller 로 이동 
            //self.moveToMainTabBarController()
            self.navigationController?.dismiss(animated: true, completion: nil)
            
        }
    }
    
    func moveToMainTabBarController() {
        let nextVC = MainTabBarController()
        
        self.present(nextVC, animated: true, completion: nil)
    }

    
    let loginBackgroundImageView:UIImageView = {
        
        let bgImgView = UIImageView()
        
        bgImgView.image = UIImage(named: "Instagram_Rainbow_Banner.jpg")
        bgImgView.backgroundColor = .white
        
        return bgImgView
        
    }()
    
    
    let verticalStackView:UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .red
        stackView.spacing = 7
        
        
        return stackView
        
    }()

    let horizontalStackView:UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .red
        stackView.spacing = 7
        
        
        return stackView
        
    }()
    
    let signUpMessageLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "회원가입을 아직 하지 않으셨나요?"
        
        
        return label
        
    }()
    
    let goToSignUpPageButton: UIButton = {
       
        let btn = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.rgbColor(17, 154, 237)]))
        
//        btn.setTitle("SignUp", for: .normal)
//        btn.setTitleColor(UIColor.black, for: .normal)
//        
//        btn.setTitleColor(UIColor.rgbColor(150, 150, 150), for: .normal)
        
        btn.setAttributedTitle(attributedTitle, for: .normal)
        
        btn.addTarget(self, action: #selector(goToSignUpPageHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        //btn.backgroundColor = .white
        return btn
        
    }()
    
    func goToSignUpPageHandler() {
        //self.dismiss(animated: true, completion: nil)
        
        let signUpVC = SignupViewController()
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }

    
    let emailTextField:UITextField = {
        let tf = UITextField()
        
        tf.placeholder = "input email"
        tf.backgroundColor = .gray
        //tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect
        tf.addTarget(self, action: #selector(loginButtonActivated), for: .editingChanged)
        return tf
        
    }()

    let passwordTextField:UITextField = {
        let tf = UITextField()
        
        tf.placeholder = "input password"
        
        tf.backgroundColor = .gray
        //tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect
        tf.addTarget(self, action: #selector(loginButtonActivated), for: .editingChanged)
        return tf
        
    }()
    
    func loginButtonActivated() {
        
        let isFormVaild = emailTextField.text?.characters.count ?? 0 > 0 && passwordTextField.text?.characters.count ?? 0 > 0
        
        if isFormVaild {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor.rgbColor(17, 154, 237)
            
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor.rgbColor(149, 204, 244)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add UI (1)
        view.addSubview(loginBackgroundImageView) // 이걸 먼저 한 다음에 오토레이아웃을 적용시켜야 됨
        self.view.backgroundColor = .white
        //photoButton.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        
        
        
        //stackView = UIStackView(arrangedSubviews: [emailTextField, userNameTextField, passwordTextField, signUpButton])
        
        // add UI (2)
        verticalStackView.addArrangedSubviews([emailTextField, passwordTextField, loginButton])
        view.addSubview(verticalStackView)
        
        // add UI (3) 
        //horizontalStackView.addArrangedSubviews([signUpMessageLabel, goToSignUpPageButton])
        horizontalStackView.addArrangedSubviews([goToSignUpPageButton])
        view.addSubview(horizontalStackView)
        
        // 뷰를 추가한 후에 레이아웃을 잡는다.
        setUpSubViewsLayout()
        
        //        stackView.topAnchor.constraint(equalTo: photoButton.bottomAnchor, constant: 20).isActive = true
        //        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        //        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        //        stackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //        stackView.anchor(top: photoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, leftConstant: 20, rightConstant: 20, bottomConstant: 0, width: 0, height: 130, centerX: nil, centerY: nil)
        
        
        
    }
    
    fileprivate func setUpSubViewsLayout() {
        
        
        
        loginBackgroundImageView.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: self.view.frame.width, height: 220, centerX: view.centerXAnchor, centerY: nil)
        
        verticalStackView.anchor(top: loginBackgroundImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, leftConstant: 20, rightConstant: 20, bottomConstant: 0, width: 0, height: 130, centerX: nil, centerY: nil)
        
        horizontalStackView.anchor(top: nil, left: nil, right: nil, bottom: view.bottomAnchor, topConstant: 260, leftConstant: 0, rightConstant: 0, bottomConstant: 10, width: 0, height: 30, centerX: view.centerXAnchor, centerY: nil)
        
        
        //        photoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true // 반드시 isActive가 true
        //        photoButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        //        photoButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        //        photoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //photoButton.layer.cornerRadius = 120 / 2
        //photoButton.layer.borderWidth = 1
        //photoButton.layer.backgroundColor = UIColor.black.cgColor
        //photoButton.clipsToBounds = true // 현재 내 뷰에 이미지가 올라갔을 때 뷰의 크기를 넘어가는 부분 영역 제거
        //photoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        
    }
    
    
}
