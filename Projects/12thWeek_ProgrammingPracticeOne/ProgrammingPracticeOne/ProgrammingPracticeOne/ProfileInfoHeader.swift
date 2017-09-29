//
//  ProfileInfoHeader.swift
//  ProgrammingPracticeOne
//
//  Created by 정교윤 on 2017. 7. 25..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileInfoHeader: UICollectionViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var user:User?{
        didSet{
            loginMessageLabel.text = user?.userName
            
            if let urlStr = user?.userProfileImageUrl, let url = URL(string: urlStr) {
                
                self.photoButton.sd_setImage(with: url, for: .normal)
                
//                URLSession.shared.dataTask(with: url) { (data, URLResponse, error) in
//                    
//                    //guard let error = error else { return }
//                    
//                    //let r = response as? HTTPURLResponse
//                    //r?.statusCode
//                    
//                    guard let realData = data else { return }
//                    
//                    DispatchQueue.main.async {
//                        //self.photoButton.layer.cornerRadius = 120 / 2
//                        
//                        //self.photoButton.imageView?.image = UIImage(data: realData)
//                        //self.photoButton.setBackgroundImage(UIImage(data: realData), for: .normal)
//                        self.photoButton.setImage(UIImage(data: realData)?.withRenderingMode(.alwaysOriginal), for: .normal)
//                        
////                        self.photoButton.adjustsImageWhenDisabled = true
//                        
//                    }
//                    
//                    
//                }.resume()
            }
            
            
        }
    }
    
    let photoButton:UIButton = {
        
        // UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        let btn = UIButton()
        //btn.setTitle("사진", for: .normal)
        
        
        //btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal)
        //btn.addTarget(self, action: #selector(photoActionHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        btn.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        btn.backgroundColor = .white
        return btn
        
    }()
    
    func photoActionHandler() {
        print ("action Photo")
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true // edit된 이미지 가져올 때
        
        
        //self.present(picker, animated: true, completion: nil)
        
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
        //self.dismiss(animated: true, completion: nil)
    }

    
    let postsButton: UIButton = {
        
        let btn = UIButton(type: .system)
        
        btn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        let attributedTitle = NSMutableAttributedString(string: "11\n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.black])
        
        attributedTitle.append(NSAttributedString(string: "posts", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.lightGray]))
        
        //        btn.setTitle("SignUp", for: .normal)
        //        btn.setTitleColor(UIColor.black, for: .normal)
        //
        //        btn.setTitleColor(UIColor.rgbColor(150, 150, 150), for: .normal)
        
        btn.setAttributedTitle(attributedTitle, for: .normal)
        
        btn.addTarget(self, action: #selector(postsButtonHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        //btn.backgroundColor = .white
        return btn
        
    }()
    
    func postsButtonHandler() {
        print("posts Button Action")
    }

    let followersButton: UIButton = {
        
        let btn = UIButton(type: .system)
        
        btn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        let attributedTitle = NSMutableAttributedString(string: "0\n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.black])
        
        attributedTitle.append(NSAttributedString(string: "followers", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.lightGray]))
        
        //        btn.setTitle("SignUp", for: .normal)
        //        btn.setTitleColor(UIColor.black, for: .normal)
        //
        //        btn.setTitleColor(UIColor.rgbColor(150, 150, 150), for: .normal)
        
        btn.setAttributedTitle(attributedTitle, for: .normal)
        
        btn.addTarget(self, action: #selector(followersButtonHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        //btn.backgroundColor = .white
        return btn
        
    }()
    
    func followersButtonHandler() {
        print("followers Button Action")
    }

    let followingButton: UIButton = {
        
        let btn = UIButton(type: .system)
        
        btn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        let attributedTitle = NSMutableAttributedString(string: "0\n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.black])
        
        attributedTitle.append(NSAttributedString(string: "following", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.lightGray]))
        
        //        btn.setTitle("SignUp", for: .normal)
        //        btn.setTitleColor(UIColor.black, for: .normal)
        //
        //        btn.setTitleColor(UIColor.rgbColor(150, 150, 150), for: .normal)
        
        btn.setAttributedTitle(attributedTitle, for: .normal)
        
        
        btn.addTarget(self, action: #selector(followingButtonHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        //btn.backgroundColor = .white
        return btn
        
    }()
    
    func followingButtonHandler() {
        print("following Button Action")
    }

    let editProfileButton:UIButton = {
        
        let attributedTitle = NSMutableAttributedString(string: "Edit Profile", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.black])
        
        // UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        let btn = UIButton()
        //btn.setTitle("사진", for: .normal)
        
        //btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal)
        btn.addTarget(self, action: #selector(editProfileButtonHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        //btn.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        //btn.layer.cornerRadius = 5
        //btn.layer.borderColor = UIColor.lightGray.cgColor
        //btn.layer.borderWidth = 1
        
        
        
        btn.setAttributedTitle(attributedTitle, for: .normal)
        
        btn.backgroundColor = .white
        return btn
        
    }()
    
    func editProfileButtonHandler() {
        print("edit Profile Button Action")
    }
    
    let loginMessageLabel: UILabel = {
        
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "나의 이름은 ... 입니다.", attributes: [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 14)])
        
        label.attributedText = attributedText
        
        
        label.numberOfLines = 0
        
        return label
        
    }()
    
    let gridButton:UIButton = {
        
        // UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        let btn = UIButton(type: .system)
        //btn.setTitle("사진", for: .normal)
        
        //btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal)
        btn.addTarget(self, action: #selector(gridButtonHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        btn.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        btn.tintColor = .blue
        
        //btn.setBackgroundImage(#imageLiteral(resourceName: "grid"), for: .normal)
        btn.backgroundColor = .white
        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        return btn
        
    }()
    
    func gridButtonHandler() {
        print("grid Button Action")
    }
    
    let listButton:UIButton = {
        
        // UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        let btn = UIButton()
        //btn.setTitle("사진", for: .normal)
        
        //btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal)
        btn.addTarget(self, action: #selector(listButtonHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        
        
        btn.setImage(#imageLiteral(resourceName: "list"), for: .normal)
        //btn.setBackgroundImage(#imageLiteral(resourceName: "list"), for: .normal)
        btn.backgroundColor = .white
        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        return btn
        
    }()
    
    func listButtonHandler() {
        print("list Button Action")
    }
    
    let ribbonButton:UIButton = {
        
        // UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        let btn = UIButton()
        //btn.setTitle("사진", for: .normal)
        
        //btn.setTitleColor(UIColor.rgbColor(100, 100, 100), for: .normal)
        btn.addTarget(self, action: #selector(ribbonButtonHandler), for: .touchUpInside)
        //btn.translatesAutoresizingMaskIntoConstraints = false // 필수!
        btn.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        //btn.setBackgroundImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        btn.backgroundColor = .white
        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        return btn
        
    }()
    
    func ribbonButtonHandler() {
        print("ribbon Button Action")
    }
    
    // a 
    // -
    // b
    // -
    // c
    let verticalStackView:UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.backgroundColor = .red
        stackView.spacing = 5
        
        
        return stackView
        
    }()

    let verticalStackViewTwo:UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.backgroundColor = .red
        stackView.spacing = 5
        
        
        return stackView
        
    }()

    let verticalStackViewThree:UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.backgroundColor = .red
        stackView.spacing = 5
        
        
        return stackView
        
    }()
    
    
    // | a | b |
    let horizontalStackView:UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.backgroundColor = .red
        stackView.spacing = 5
        
        
        return stackView
        
    }()

    
    let horizontalStackViewTwo:UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.backgroundColor = .red
        stackView.spacing = 5
        
        
        return stackView
        
    }()
    
    let horizontalStackViewThree:UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.backgroundColor = .red
        stackView.spacing = 5
        
        
        return stackView
        
    }()
    
    let marginViewOne:UIView = {
       
        let view = UIView()
        
        //view.frame.height = 1
        
        view.backgroundColor = UIColor.lightGray
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 10)
        
        return view
        
    }()

    let marginViewTwo:UIView = {
        
        let view = UIView()
        
        //view.frame.height = 1
        view.backgroundColor = UIColor.lightGray
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 10)
        
        return view
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        self.addSubview(verticalStackViewThree)
        
        photoButton.layer.cornerRadius = 80 / 2
        photoButton.layer.borderWidth = 0
        photoButton.imageView?.contentMode = UIViewContentMode.scaleToFill
        photoButton.clipsToBounds = true
        
        photoButton.addTarget(self, action: #selector(photoActionHandler), for: .touchUpInside)
        
        horizontalStackView.addArrangedSubviews([postsButton, followersButton, followingButton])
        
        verticalStackView.addArrangedSubviews([horizontalStackView, editProfileButton])
        
        horizontalStackViewTwo.addArrangedSubviews([photoButton, verticalStackView])
        
        verticalStackViewTwo.addArrangedSubviews([horizontalStackViewTwo, loginMessageLabel])
        
        horizontalStackViewThree.addArrangedSubviews([gridButton, listButton, ribbonButton])
        
        verticalStackViewThree.addArrangedSubviews([marginViewOne, verticalStackViewTwo, marginViewTwo, horizontalStackViewThree])
        
        
        self.backgroundColor = .white
        
        setUpSubViewsLayout()
        
        
    
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUpSubViewsLayout() {
        
        verticalStackViewThree.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, bottom: self.bottomAnchor, topConstant: 0, leftConstant: 5, rightConstant: 5, bottomConstant: 0, width: self.frame.width, height: self.frame.height+10, centerX: nil, centerY: nil)
        
        photoButton.anchor(top: nil, left: nil, right: nil, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 80, height: 80, centerX: nil, centerY: nil)
        
//        verticalStackView.anchor(top: photoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, leftConstant: 20, rightConstant: 20, bottomConstant: 0, width: 0, height: 130, centerX: nil, centerY: nil)
//        
//        horizontalStackView.anchor(top: nil, left: nil, right: nil, bottom: view.bottomAnchor, topConstant: 260, leftConstant: 0, rightConstant: 0, bottomConstant: 10, width: 0, height: 30, centerX: view.centerXAnchor, centerY: nil)
        
        
        //        photoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true // 반드시 isActive가 true
        //        photoButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        //        photoButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        //        photoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
//        photoButton.contentMode = .scaleAspectFit
        
        
        
        editProfileButton.layer.borderWidth = 1
        editProfileButton.layer.cornerRadius = 5
        editProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        postsButton.layer.borderWidth = 0
        followersButton.layer.borderWidth = 0
        followingButton.layer.borderWidth = 0
        //marginViewOne.layer.borderWidth = 1
        
        //photoButton.layer.backgroundColor = UIColor.blue.cgColor
        //photoButton.clipsToBounds = true // 현재 내 뷰에 이미지가 올라갔을 때 뷰의 크기를 넘어가는 부분 영역 제거
        //photoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        
    }

    
    
}
