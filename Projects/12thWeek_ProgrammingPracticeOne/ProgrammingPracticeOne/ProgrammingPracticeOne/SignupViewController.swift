//
//  SignupViewController.swift
//  ProgrammingPracticeOne
//
//  Created by 정교윤 on 2017. 7. 24..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    // closure 사용
    let photoButton:UIButton = {
        
        // UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        let btn = UIButton()
        btn.setTitle("사진", for: .normal)
        
        btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal)
        btn.addTarget(self, action: #selector(photoActionHandler), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        btn.backgroundColor = .red
        return btn
    
    }()
    
    
    let emailTextField:UITextField = {
        let tf = UITextField()
        
        tf.placeholder = "input email"
        tf.backgroundColor = .gray
        //tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect
        
        return tf
    
    }()
    
    let userNameTextField:UITextField = {
        let tf = UITextField()
        
        tf.placeholder = "input user name"
        tf.backgroundColor = .gray
        //tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect
        
        return tf
        
    }()

    let passwordTextField:UITextField = {
        let tf = UITextField()
        
        tf.placeholder = "input password"
        
        tf.backgroundColor = .gray
        //tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect
        
        return tf
        
    }()
    
    
    let signUpButton:UIButton = {
        
        // UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        let btn = UIButton()
        btn.setTitle("회원가입", for: .normal)
        
        btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal)
        btn.addTarget(self, action: #selector(signUpActionHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        btn.backgroundColor = .red
        return btn
        
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
    
    let loginMessageLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "이미 ID를 가지고 계신가요?"
        
        
        return label
        
    }()
    
    let goToLoginPageButton: UIButton = {
        
        let btn = UIButton()
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        
        btn.setTitleColor(UIColor.rgbColor(150, 150, 150), for: .normal)
        btn.addTarget(self, action: #selector(goToLoginPageHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        btn.backgroundColor = .white
        return btn
        
    }()
    
    func goToLoginPageHandler() {
        
        print("action LogIn Page")
        
        // 로그인 페이지로 이동
        //let nextVC = LoginViewController()
        
        self.navigationController?.popViewController(animated: true)
        
    }


    
    func photoActionHandler() {
        print ("action Photo")
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true // edit된 이미지 가져올 때
        self.present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print("info://",info)
        
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            return
        }
        
        // UIImagePickerControllerCropRect -> crop된 이미지 사이즈 가져올 때
        // UIImagePickerControllerEditedImage -> edit딘 이미지 가져올 때
        
        image.withRenderingMode(.alwaysOriginal) // 이미지 변조가 일어날 경우를 대비해 항상 오리지널 이미지로 셋팅 (틴트 컬러 등에 의해 자동으로 이미지 변환이 일어나기 때문)
        
        photoButton.setImage(image, for: .normal)
        photoButton.clipsToBounds = true
        self.dismiss(animated: true, completion: nil)
    }
    
    func signUpActionHandler() {
        
        print ("action SignUp")
        
        
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if let error = error {
                print("error://",error)
                return
            }
            
            guard let userName = self.userNameTextField.text else { return }
            
            // success
            let uid = user?.uid
            
//            Database.database().reference().child(uid!).updateChildValues(["userName":userName], withCompletionBlock: { (error, ref) in
//                print("database error: ",error ?? "none")
//                print("database reference: ",ref)
//            })
            
            guard let image = self.photoButton.imageView?.image else { return }
            
            // JPG 압축
            guard let uploadData = UIImageJPEGRepresentation(image, 0.3) else { return }
            
            
            let uuid = UUID().uuidString // random string
            
            
            
            Storage.storage().reference().child("ProfileImage").child(uuid).putData(uploadData, metadata: nil, completion: { (metaData, error) in
                
                if let error = error {
                    print("error://",error)
                    return
                }
                
                print("metaData://",metaData)
                
                guard let urlStr = metaData?.downloadURL()?.absoluteString else { return } // 업로드한 이미지의 다운로드 주소 추출
                print(urlStr)
                
                // userName 과 profileImg 속성을 추가하여 업데이트한다. profileImg 속성에는 업로드 이미지의 다운로드 주소가 들어감
                Database.database().reference().child(uid!).child("UserInfo").updateChildValues(["userName":userName, "profileImg":urlStr], withCompletionBlock: { (error, ref) in
                    
                    if let error = error {
                        print("error://",error)
                        return
                    }
                    
                    // 로그온처리 후 main page 이동
                    self.navigationController?.dismiss(animated: true, completion: nil)
                    
                })
                
                
            })
            
            //print(user)
            //print(error)
            
        }
        
        // mainPage 이동
        //moveToMainTabBarController()
        
        //let nextVC = LoginViewController()
        
        //self.present(nextVC, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add UI (1)
        view.addSubview(photoButton) // 이걸 먼저 한 다음에 오토레이아웃을 적용시켜야 됨
        self.view.backgroundColor = .white
        //photoButton.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        
        
        
        //stackView = UIStackView(arrangedSubviews: [emailTextField, userNameTextField, passwordTextField, signUpButton])
        
        // add UI (2)
        verticalStackView.addArrangedSubviews([emailTextField, userNameTextField, passwordTextField, signUpButton])
        view.addSubview(verticalStackView)
        
        // add UI (3)
        horizontalStackView.addArrangedSubviews([loginMessageLabel, goToLoginPageButton])
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
        
        
        
        photoButton.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topConstant: 80, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 120, height: 120, centerX: view.centerXAnchor, centerY: nil)
        
        verticalStackView.anchor(top: photoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, leftConstant: 20, rightConstant: 20, bottomConstant: 0, width: 0, height: 130, centerX: nil, centerY: nil)
        
        horizontalStackView.anchor(top: nil, left: nil, right: nil, bottom: view.bottomAnchor, topConstant: 260, leftConstant: 0, rightConstant: 0, bottomConstant: 10, width: 0, height: 30, centerX: view.centerXAnchor, centerY: nil)
        
        
//        photoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true // 반드시 isActive가 true
//        photoButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
//        photoButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
//        photoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        photoButton.layer.cornerRadius = 120 / 2
        photoButton.layer.borderWidth = 1
        photoButton.layer.backgroundColor = UIColor.black.cgColor
        //photoButton.clipsToBounds = true // 현재 내 뷰에 이미지가 올라갔을 때 뷰의 크기를 넘어가는 부분 영역 제거
        //photoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        
    }
    
    
}
