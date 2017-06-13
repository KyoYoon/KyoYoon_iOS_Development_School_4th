//
//  ViewController.swift
//  TableViewTest2
//
//  Created by 정교윤 on 2017. 6. 7..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var animalArray:[String] = ["Emu", "Giraffe", "Greater Rhea","Hippopotamus", "Horse", "Koala", "Lion"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return animalArray.count
        
        
    }
    
    // Here you can customize the appearance of your cell
//    func layoutSubviews() {
//        super.layoutSubviews()
//        // Customize imageView like you need
//        self.imageView?.frame = CGRectMake(10,0,40,40)
//        self.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
//        // Costomize other elements
//        self.textLabel?.frame = CGRectMake(60, 0, self.frame.width - 45, 20)
//        self.detailTextLabel?.frame = CGRectMake(60, 20, self.frame.width - 45, 15)
//    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //cell instance 가져오기
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //Cell Data 설정
        cell.textLabel?.text = animalArray[indexPath.row]
        cell.imageView?.image = UIImage(named: "Image\(indexPath.row+1)")
//        var itemSize:CGSize = CGRect(0, 0, 40, 40)
//        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.mainScreen().scale)
//        var imageRect : CGRect = CGRectMake(0, 0, itemSize.width, itemSize.height)
//        cell.imageView!.image?.drawInRect(imageRect)
//        cell.imageView!.image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
        
        // table view cell 이 없을 경우 코딩으로 하고 싶을 때
//        let cell2:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Cell2")
//        
//        if cell2 == nil {
//            cell2 = UITableViewCell(style: .default, reuseIdentifier: "Cell2")
//
//            
//        }
//        
//        cell2?.textLabel?.text = ""
//        cell2.imageView?.image = UIImage(named: "\(indexRow+1)")
//        cell2.selectionStyle = .blue 
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 셀렉트했을 때 회색표시를 없애준다.
        tableView.deselectRow(at: indexPath, animated: true)
        
//        let nextVC:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        // 아직 뷰가 그려지기 전이므로 일단 그 뷰의 변수에 정보를 넘기고 그 뷰에서 ViewDidLoad 함수에서 처리를 해준다.
        // 이 상태에서 Label과 ImageView 변수에 값을 집어넣으면 nil 이므로 런타임 에러가 발생한다.
//        nextVC.imgName = "\(indexPath.row+1).png"
//        nextVC.titleName = PoketMonData.names[indexPath.row]
//        
//        
//        self.navigationController?.pushViewController(nextVC, animated: true)
        
        
        
    }


}

