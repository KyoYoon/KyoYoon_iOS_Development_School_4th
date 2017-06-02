//
//  MainViewController.swift
//  LogonProject
//
//  Created by 정교윤 on 2017. 5. 31..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //var isAuthentified:Bool = UserDefaults.standard.bool(forKey: Authen)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 뷰가 그려진 상태에서 다른 뷰로 이동시키는 명령을 수행시킬 수 있는데 이 상태는 viewDidAppear 함수가 호출될 때이므로 
    // viewDidAppear 함수 내에서 코드를 작성한다. 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isAuthentified:Bool = UserDefaults.standard.bool(forKey: Authentication.authenticationBool)
        
        print(isAuthentified)
        
        
        if !isAuthentified {
            //self.performSegue(withIdentifier: Authentication.loginSegueID, sender: self) // sender: nil 로 해도 됨
            
            moveToLogonView()

        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 로그온 뷰로 이동
    func moveToLogonView() {
        // LogonViewController 인스턴스 생성
//        let vc:LogonViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogonViewController") as! LogonViewController
        
        // 이동
        //self.present(vc, animated: true, completion: nil)
        
        // Storyboard에 Navigation Controller에 추가했으므로 Navigation Controller 인스턴스를 생성해서 부른다.
        // NavigationController 
        
        let vc:UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        
        //let vc:LogonViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogonViewController") as! LogonViewController
        
        // navigation controller가 아니므로 self에 직접 속한 present 함수로 호출함
        self.present(vc, animated: true) // false
        
        
    }
    
    // 개인정보를 작성하고 join 눌렀을 때 수동으로 Main Page로 unwind 하는 unwind segue를 하기 위해 작성한 함수
    @IBAction func unwindToMain(_ segue:UIStoryboardSegue) {
    
    }
    
    @IBAction func touchUpLogoutButton(_ sender: UIButton) {
        
        UserDefaults.standard.set(false, forKey: Authentication.authenticationBool)
        //self.performSegue(withIdentifier: Authentication.loginSegueID, sender: self)
        
        moveToLogonView()
        
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
