//
//  ViewController.swift
//  TwitterDynamicCellPractice
//
//  Created by 박종찬 on 2017. 7. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var currentDataArray: [Twit]!
    @IBOutlet var mainView: UIView!

    @IBOutlet weak var tableView: UITableView!
    
    var customUIView:CustomUIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentDataArray = DataCenter.shared.dataArray
        
        //print(DataCenter.shared.dataArray)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataArray.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ContentsCell", for: indexPath) as! CustomTableViewCell
        
        var imageUrl:String?
        let bodyText = currentDataArray[indexPath.row].bodyText
        
        let userId = currentDataArray[indexPath.row].userId
        let userName = currentDataArray[indexPath.row].userName
        let userPhotoUrl = currentDataArray[indexPath.row].userPhotoUrl
        
        if currentDataArray[indexPath.row].imageUrl == "" {
            imageUrl = "NoImage"
        } else {
            imageUrl = currentDataArray[indexPath.row].imageUrl
        }
        
        print("imageUrl: \(imageUrl ?? "none")")
        
        cell.setProfileImage(userPhotoUrl)
        cell.setProfileIdAndName(userName, userId)
        cell.setMyContentsTextView(bodyText)
        cell.setUserImage(imageUrl!)
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchAddBarButton(_ sender: UIBarButtonItem) {
        
        //self.mainView.layer.opacity = 0.2
        
        let screenSize: CGRect = UIScreen.main.bounds
        self.customUIView = CustomUIView(frame: .init(x: 10, y: 80, width: screenSize.width - 20, height: 400))
        self.customUIView?.backgroundColor = UIColor.white
        self.customUIView?.layer.borderWidth = 1
        self.customUIView?.layer.borderColor = UIColor.black.cgColor
        self.mainView.addSubview(self.customUIView!)
        
        
    }
    


}

