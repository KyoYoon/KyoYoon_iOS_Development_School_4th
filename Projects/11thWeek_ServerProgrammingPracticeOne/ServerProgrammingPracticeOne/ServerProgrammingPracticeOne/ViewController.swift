//
//  ViewController.swift
//  ServerProgrammingPracticeOne
//
//  Created by 정교윤 on 2017. 7. 19..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

extension NSMutableData {
    
    func appendString(_ str: String) {
        self.append(str.data(using: .utf8)!)
    }
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var data = NSMutableArray() // mutable 이 있어야 데이터를 추가 삭제가 가능하다.
    
    @IBAction func touchUpAddButton(_ sender: UIBarButtonItem) {
        
        /*
        let dict = ["email":"abcd1234@gmail.com", "password":"33334444"] as [String: Any]
        if let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) {
            
            
            
            let url = NSURL(string: "http://localhost:1337/user")!
            let request = NSMutableURLRequest(url: url as URL)
            request.httpMethod = "POST"
            
            request.httpBody = jsonData
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                
                data,response,error in
                
                if error != nil{
                    print(error?.localizedDescription ?? "data error")
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    
                    if let parseJSON = json {
                        //let resultValue:String = parseJSON["success"] as! String;
                        //print("result: \(resultValue)")
                        print(parseJSON)
                    }
                } catch let error as NSError {
                    print(error)
                }
                
                
                
            }          
            task.resume()
        }
 */
        //addFunc()
        
        let alert = UIAlertController(title: "입력창", message: "이메일 및 비밀번호", preferredStyle: .alert)
        
        alert.addTextField() {
            (textfield) in
            textfield.placeholder = "이메일을 입력하세요"
        }
        
        alert.addTextField() {
            (textfield) in
            textfield.placeholder = "비밀번호를 입력하세요"
        }

        
        //공란 입력시 예외처리 구현하기
        let ok = UIAlertAction(title: "입력", style: .default){
            (_) in
            if let title1 = alert.textFields?[0].text, let title2 = alert.textFields?[1].text {
                self.createUserData(email: title1, password: title2)
                print("OK button is clicked!")
                
                self.refreshUserData()
                
            }
            
            
        }
        
        
        let cancel = UIAlertAction(title: "취소", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: false)

        
    }
    
    func createUserData(email: String, password: String) {
        
        let url = URL(string: "http://localhost:1337/user")
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        
        let param = [
            "email" : email,
            "password" : password
        ]
        
        if let jsonStr = try? JSONSerialization.data(withJSONObject: param, options: .init(rawValue: 0)) {
            
            request.httpBody = jsonStr
            request.setValue("application:json", forHTTPHeaderField: "Content-Type")
            
            debugPrint(String.init(data: request.httpBody!, encoding: .utf8))
            
            let task = URLSession.shared.dataTask(with: request) {
                data, response, error in
                
                guard let data = data else { return }
                print(response)
                
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any> {
                    
                    print(json)
                    
                }
                
            }
            task.resume()

            
        }
        
        
        
    }
    
    func refreshUserData() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

    }
    
    func updateUserData(email: String, password: String, id:Int) {
        
    }
    
    func deleteUserData(id: Int) {
        
    }
    
    @IBAction func touchUpRefreshButton(_ sender: UIBarButtonItem) {
        
        
        print("touchUpRefreshButton")
        self.fetchUserData()
        
    }
    
    func fetchUserData() {
        let url = URL(string: "http://localhost:1337/user")
        var request = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        
        // Data 자료형은 바이너리 => data는 바디 (메시지 본문)
        // response => 바디를 제외한 부분
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            
            guard let data = data else { return }
            
            //let dataStr = String.init(data: data, encoding: .utf8)
            
            //print("data: \(String(describing: String.init(data: data!, encoding: .utf8)))")
            //print("response: \(String(describing: response))")
            //print("error: \(String(describing: error))")
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Array<Any> {
                
                //debugPrint(json)
                
                //for obj in json {
                //    let pair = obj as! Dictionary<String, Any>
                //    let email = pair["email"] as! String
                //    print(email)
                //
                //
                //}
                
                self.data = NSMutableArray(array: json)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
            //print(dataStr)
            //print("response: \(String(describing: response))")
            //print("error: \(String(describing: error))")
        }
        task.resume()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fetchUserData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let pair = self.data.object(at: indexPath.row) as! Dictionary<String, Any>
        let email = pair["email"] as! String
        let password = pair["password"] as! String
        
        cell.textLabel?.text = email
        cell.detailTextLabel?.text = password
        
        return cell
    }
    
    // 테이블 뷰 화면에서 오른손 엄지손가락으로 왼쪽으로 스와이프했을 때 delete 버튼이 나타나고 이를 클릭시 삭제하는 부분
    // NSInternalInconsistencyException 발생
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // collection view에서 선택한 indexPath.item과 table view에서 선택한 indexPath.row를 통해 실제 배열의 데이터를 삭제 후
            // 테이블 뷰에서도 지운다.
//            let removeNagID = selectedItem?.nagList[indexPath.row].nagID
            
            // 실제 데이터 삭제
//            DataCenter.standard.removeNag(selectedLocation: self.locationIndex, removeNagID: removeNagID!)
            
            // 현재 들고 있는 데이터에도 반영을 해준다.
//            selectedItem?.nagList.remove(at: indexPath.row)
            
            // 테이블뷰에서도 삭제하여 리로드함
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
        }
        
        
    }



}

