//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by 정교윤 on 2017. 7. 3..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.register(UINib.init(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: MyTableViewCell.reuseId)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.reuseId, for: indexPath) as! MyTableViewCell
        
        cell.titleTextLabel.text = "큰텍스트"
        cell.subtitleTextLabel.text = "작은텍스트"
        
        
        cell.squareImageView.image = UIImage.init(named: "745064-200.png")
        
        // UIControlEvents.valueChanged가 일어나면 target에게 action을 시키라고 명령
        cell.cellSwitchAcc.addTarget(self, action: #selector(switchValueChanged(_:)), for: UIControlEvents.valueChanged)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(MyTableViewCell.cellHeight)
    }
    
    func switchValueChanged(_ sender: UISwitch) {
        print("그렇다고 한다.",sender.isOn)
    }


}

