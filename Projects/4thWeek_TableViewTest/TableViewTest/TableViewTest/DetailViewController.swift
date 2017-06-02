//
//  DetailViewController.swift
//  TableViewTest
//
//  Created by 정교윤 on 2017. 6. 2..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var imgTitle: UILabel!
    
    
    var imgName:String?
    var titleName:String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let imgName = self.imgName ?? "DefaultImageName"
        let titleName = self.titleName ?? "이름 모름"
        
        img.image = UIImage(named: imgName)
        imgTitle.text = titleName 
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
