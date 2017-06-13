//
//  MainViewController.swift
//  LogonProject
//
//  Created by 정교윤 on 2017. 5. 31..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var email:String?
    
    
    
    //var isAuthentified:Bool = UserDefaults.standard.bool(forKey: Authen)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let email = self.email
        
        print(email ?? "없다")

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
//        else {
//            
//            let userList:[Any] = UserDefaults.standard.array(forKey: Authentication.UserList) ?? []
//            
//            let user = userList[userList.endIndex] as! [String:Any]
//            
//            let userEmail:String = user[Authentication.email] as! String
//            
//            self.email = userEmail
//            
//            
//            
//            
//            
//        }
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let count:Int = poketmonList?.count ?? 0
//        
//        return count
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = String(indexPath.row)
        //cell.imageView?.image = UIImage(named: "\(indexPath.row+1).png") // png는 .png 안 붙여도 되고 jpg 파일은 .jpg 붙여야 한다.
        cell.selectionStyle = .gray
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    // Storyboard 에서 segue로 연결하지 않았을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 셀렉트했을 때 회색표시를 없애준다.
        tableView.deselectRow(at: indexPath, animated: true)
        
        //        let nextVC:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //
        //        // 아직 뷰가 그려지기 전이므로 일단 그 뷰의 변수에 정보를 넘기고 그 뷰에서 ViewDidLoad 함수에서 처리를 해준다.
        //        // 이 상태에서 Label과 ImageView 변수에 값을 집어넣으면 nil 이므로 런타임 에러가 발생한다.
        //        nextVC.imgName = "\(indexPath.row+1).png"
        //        nextVC.titleName = PoketMonData.names[indexPath.row]
        //
        //
        //        self.navigationController?.pushViewController(nextVC, animated: true)
        
        
        
    }
    
    // Storyboard 에서 segue로 연결하였을 때
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("prepare 실행")
        
//        let nextVC:DetailViewController = segue.destination as! DetailViewController
//        
//        let cell = sender as! UITableViewCell
//        
//        let indexPath = self.tableView.indexPath(for: cell)!
//        
//        // 아직 뷰가 그려지기 전이므로 일단 그 뷰의 변수에 정보를 넘기고 그 뷰에서 ViewDidLoad 함수에서 처리를 해준다.
//        // 이 상태에서 Label과 ImageView 변수에 값을 집어넣으면 nil 이므로 런타임 에러가 발생한다.
//        nextVC.imgName = "\(indexPath.row+1).png"
//        nextVC.titleName = PoketMonData.names[indexPath.row]
        
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

        UserDefaults.standard.set(false, forKey: Authentication.authenticationBool)
        self.performSegue(withIdentifier: Authentication.loginSegueID, sender: self)
        
        moveToLogonView()
        
    }
    
    
    @IBAction func touchUpLogoutButton(_ sender: UIBarButtonItem) {
        
        UserDefaults.standard.set(false, forKey: Authentication.authenticationBool)
        self.performSegue(withIdentifier: Authentication.loginSegueID, sender: self)
        moveToLogonView()
        
    }
    
//    @IBAction func touchUpLogoutButton(_ sender: UIButton) {
//        
//        UserDefaults.standard.set(false, forKey: Authentication.authenticationBool)
//        //self.performSegue(withIdentifier: Authentication.loginSegueID, sender: self)
//        
//        moveToLogonView()
//        
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
