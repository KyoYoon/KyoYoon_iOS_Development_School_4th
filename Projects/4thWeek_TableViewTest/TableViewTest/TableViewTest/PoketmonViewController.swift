//
//  PoketmonViewController.swift
//  TableViewTest
//
//  Created by 정교윤 on 2017. 6. 2..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class PoketmonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var poketmonList:[String]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        poketmonList = PoketMonData.names
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count:Int = poketmonList?.count ?? 0
        
        return count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PoketmonCell", for: indexPath)
        
        cell.textLabel?.text = poketmonList?[indexPath.row]
        cell.imageView?.image = UIImage(named: "\(indexPath.row+1).png") // png는 .png 안 붙여도 되고 jpg 파일은 .jpg 붙여야 한다.
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
        let nextVC:DetailViewController = segue.destination as! DetailViewController
        
        let cell = sender as! UITableViewCell
        
        let indexPath = self.tableView.indexPath(for: cell)!
        
        // 아직 뷰가 그려지기 전이므로 일단 그 뷰의 변수에 정보를 넘기고 그 뷰에서 ViewDidLoad 함수에서 처리를 해준다.
        // 이 상태에서 Label과 ImageView 변수에 값을 집어넣으면 nil 이므로 런타임 에러가 발생한다.
        nextVC.imgName = "\(indexPath.row+1).png"
        nextVC.titleName = PoketMonData.names[indexPath.row]

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
