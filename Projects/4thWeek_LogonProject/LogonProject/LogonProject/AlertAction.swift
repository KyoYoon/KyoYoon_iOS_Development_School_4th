//
//  AlertAction.swift
//  LogonProject
//
//  Created by 정교윤 on 2017. 6. 14..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

import UIKit

// 경고창 띄워주기
func showAlert(type:AlertType, object:UIViewController) {
    let alert = UIAlertController(title: titleMsg(for: type), message: titleMsg(for: type), preferredStyle: .alert)
    
    let action = UIAlertAction(title: "확인", style: .default, handler: nil)
    alert.addAction(action)
    
    object.present(alert, animated: true, completion: nil)
}

// 조건에 맞게 경고창에 보여줄 메시지를 변수에 담아 저장한다.
func titleMsg(for type:AlertType) -> String {
    var title = ""
    
    switch type {
    case .LoginFail:
        title = Authentication.loginFailMsg
    case .SignupFail:
        title = Authentication.idPasswordRequiredMsg
    case .Success:
        title = "로그인에 성공하였습니다."
        
    }
    
    return title
    
    
    
}
