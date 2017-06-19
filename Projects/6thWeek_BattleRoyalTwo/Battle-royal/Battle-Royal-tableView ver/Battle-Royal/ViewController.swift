//
//  ViewController.swift
//  Battle-Royal
//
//  Created by 유하늘 on 2017. 6. 15..
//  Copyright © 2017년 유하늘. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // 하늘 코딩 - 테이블 뷰 아울렛
    @IBOutlet weak var tableView: UITableView!
    // 회식비용
    @IBOutlet weak var textFieldCost: UITextField!
    
    // 재성 배열 초기화
    var list:[String] = []
    
    /*********************************************************************************************************************/
    //                                    보여줘 버튼                                                                    //
    /*********************************************************************************************************************/
    
    @IBAction func touchUpShowBtn(_ sender: UIButton) {
        // 재성 추가( 텍스트 필드 입력값 없는 경우 예외처리함.
        // 기존에는 액션세그 이용하였는데 메뉴얼 세그로 수정함
        // 빈칸 입력시 alert 창 띄우도록 함
        
        if textFieldCost.text == "" {
            let alert3 = UIAlertController(title: "[Warning!]", message: "금액을 입력하세요", preferredStyle: .alert)
            self.present(alert3, animated: true)
            let cancel3 = UIAlertAction(title: "똑바로 해라잉", style: .default, handler: nil)
            alert3.addAction(cancel3)
        } else {
            self.performSegue(withIdentifier: "manualSegue", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //재성코딩
        /***********************************************************************************************************/
        //                                        사죄 코드 by 재성 with 3조                                       //
        /***********************************************************************************************************/
        
        let sorry = UIAlertController(title: "죄송합니다", message: "코드는 베끼지 맙시다!", preferredStyle: .alert)
        self.present(sorry, animated: true, completion: nil)
        let forgiveness = UIAlertAction(title: "용서하신다면 클릭하세요", style: .default, handler: nil)
        sorry.addAction(forgiveness)
        
        /***********************************************************************************************************/
        

        // 하늘 코딩
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // 교윤코딩
        list.removeAll()
        textFieldCost.text = ""
        //self.tableView.reloadData()
        
        // 재성 추가
        textFieldCost.keyboardType = .default // enum으로 정의 되어 있군
        textFieldCost.keyboardAppearance = .dark
        textFieldCost.returnKeyType = .done
        textFieldCost.placeholder = "금액을 입력하세요"
        textFieldCost.clearButtonMode = .whileEditing
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    /*********************************************************************************************************************/
    //                                    Add  버튼 관련                                                                 //
    //                  같은 이름이 두번 들어가면 1등이 두명 생기는 경우가 발생..차후 보완..졸림..                       //
    /*********************************************************************************************************************/
    
    // 재성 코딩
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "[Battle Royal!!]", message: "니가 걸릴꺼야!'", preferredStyle: .alert)
        
        //alert창에 텍스트필드 추가
        alert.addTextField() {
            (textfield) in
            textfield.keyboardAppearance = .dark
            textfield.placeholder = "이름을 입력하세요"
        }
        //공란 입력시 예외처리 구현하기 OK!!!
        //alert창에 들어갈 ok버튼
        let ok = UIAlertAction(title: "입력", style: .default){
            (_) in
            if let title = alert.textFields?[0].text{ //옵셔널 바인딩
                if title.isEmpty == false {
                    self.list.append(title)
                    self.tableView.reloadData()
                } else {
                    let alert2 = UIAlertController(title: "[Warning!]", message: "돈내기 싫은가보지?", preferredStyle: .alert)
                    self.present(alert2, animated: true)
                    let cancel2 = UIAlertAction(title: "똑바로 해라잉", style: .default, handler: nil)
                    alert2.addAction(cancel2)
                    //cancel2 를 누르면 alert가 다시 뜨게 만들고 싶어라~~~~ persent 어떻게 활용하면 될거같긴 한데....모르겠다
                }
            }
        }
        
        //alert창에 들어갈 cancel버튼
        let cancel = UIAlertAction(title: "취소", style: .default, handler: nil)
        
        //alert창에 action추가
        alert.addAction(ok)
        alert.addAction(cancel)
        
        //alert present
        self.present(alert, animated: true)
    }
    /*********************************************************************************************************************/
    //                                    테이블 뷰 관련                                                                 //
    /*********************************************************************************************************************/
    
    // 재성 코딩
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.list.count
    }
    
    // 재성 코딩
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    // 재성코딩
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "걸릴사람 이름내역"
    }
    
    /*********************************************************************************************************************/
    //                                         세그 관련                                                                 //
    /*********************************************************************************************************************/
    
    // 교윤 코딩
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultView: ResultViewController = segue.destination as! ResultViewController
        
        resultView.cost = Int(textFieldCost.text!)!
        resultView.resultList = self.list
        
    }
    
    // 보낼 지 안 보낼 지 결정해야 한다.
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        return true
        
    }
    
}

