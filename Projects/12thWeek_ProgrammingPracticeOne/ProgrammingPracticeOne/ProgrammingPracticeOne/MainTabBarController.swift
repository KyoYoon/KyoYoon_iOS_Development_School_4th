//
//  MainTabBarController.swift
//  ProgrammingPracticeOne
//
//  Created by 정교윤 on 2017. 7. 25..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController, UITabBarControllerDelegate, CustomUIViewDelegate {

    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = viewControllers?.index(of: viewController)
        
        // 탭 바의 3번째 영역을 클릭했을 때
        if index == 2 {
            
            let layout = UICollectionViewFlowLayout()
            let photoSelectorController = PhotoSelectorController(collectionViewLayout: layout)
            
            let navController = UINavigationController(rootViewController: photoSelectorController)
            
            return false
            
        }
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
        
        // 로그인이 필요하면 로그인 페이지 띄우기 
        // auto login 진행가능 - 로그인 처리
        // auto login 안 되면 - 로그인 화면 띄우기
        
        if !DataCenter.sharedData.requestIsLogin()
        {
            DispatchQueue.main.async {
                self.showLoginPageVC()
            }
            
        }
        
        // delegate 연결
        let cv = CustomUIView()
        cv.delegate = self
        
        // Tab Bar Setting 
        
        setViewControllers()
        
        
    }
    
    // 함수 구현 
    func didSelectedView(_ view: CustomUIView) {
        // 구현 
    }
    
    func setViewControllers() {
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        vc1.tabBarItem.image = #imageLiteral(resourceName: "home_unselected")
        vc1.tabBarItem.selectedImage = #imageLiteral(resourceName: "home_selected")
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .green
        vc2.tabBarItem.image = #imageLiteral(resourceName: "search_unselected")
        vc2.tabBarItem.selectedImage = #imageLiteral(resourceName: "search_selected")
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .blue
        vc3.tabBarItem.image = #imageLiteral(resourceName: "plus_unselected")
        
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = .blue
        vc4.tabBarItem.image = #imageLiteral(resourceName: "like_unselected")
        vc4.tabBarItem.selectedImage = #imageLiteral(resourceName: "like_selected")
        
        let layout = UICollectionViewFlowLayout()
        
        let vc5 = ProfileViewController(collectionViewLayout: layout)
        vc5.view.backgroundColor = .blue
        let vc5Navi = UINavigationController(rootViewController: vc5)
        
        vc5Navi.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        vc5Navi.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        
        viewControllers = [vc1, vc2, vc3, vc4, vc5Navi]

    }

    func showLoginPageVC() {
        let loginVC = LoginViewController()
        
        let navi = UINavigationController(rootViewController: loginVC)
        self.present(navi, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
