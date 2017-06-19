//
//  ViewController.swift
//  Battle-Royal
//
//  Created by 유하늘 on 2017. 6. 15..
//  Copyright © 2017년 유하늘. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    //하늘 코딩 - 테이블 뷰 아울렛
    @IBOutlet weak var tableView: UITableView!
    
    //재성 배열 초기화
    var list:[String] = []
    
    //회식비용
    @IBOutlet weak var textFieldCost: UITextField!
    
    @IBAction func touchUpShowBtn(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //하늘 코딩
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    //교윤코딩
    override func viewWillAppear(_ animated: Bool) {
        list.removeAll()
        textFieldCost.text = ""
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //재성 코딩
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "배틀로얄!", message: "당신이 걸릴꺼야!'", preferredStyle: .alert)
        
        alert.addTextField() {
            (textfield) in
            textfield.placeholder = "이름을 입력하세요"
        }
        //공란 입력시 예외처리 구현하기
        let ok = UIAlertAction(title: "입력", style: .default){
            (_) in
            if let title = alert.textFields?[0].text {
                
                self.list.append(title)
                self.tableView.reloadData()
                print(self.list)
            }
        }
        
        
        let cancel = UIAlertAction(title: "취소", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: false)
    }
    
    //재성 코딩
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count 
    }
    
    //재성 코딩
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
        
    }
    //재성코딩
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "걸릴사람 이름내역"
    }
    
    // 교윤 코딩 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultView:ResultViewController = segue.destination as! ResultViewController
        
        resultView.cost = Int(textFieldCost.text!)!
        resultView.resultList = self.list
        
        
        
    }
    
    
}

