//
//  ViewController.swift
//  SettingPractice
//
//  Created by 정교윤 on 2017. 6. 22..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(DataCenter.defaultCenter.movieDataArray)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.defaultCenter.movieDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath)
        
        let movie = DataCenter.defaultCenter.movieDataArray[indexPath.row]
        
        cell.textLabel?.text = movie.title
        
        cell.detailTextLabel?.text = String(movie.year)
        
        cell.imageView?.image = UIImage(named: movie.posterURL)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.section == 0 && indexPath.row == 0 {
            return 40
        } else {
            return 100
        }
        
        
    }
    

}

