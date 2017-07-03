//
//  ListViewController.swift
//  DataCenterPractice
//
//  Created by 박종찬 on 2017. 6. 30..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //설정용 값들
    
    private let reuseIdForDetailCell:String = "DetailCell"
    
    private var currentDataArray: [Person] {
        get {
            return DataCenter.shared.dataArray.filter({ (person) -> Bool in
                switch self.tableViewSourceSegmentedControl.selectedSegmentIndex {
                case 1:
                    return person.gender == Gender.woman
                case 2:
                    return person.gender == Gender.man
                default:
                    return true
                }
            })
        }
    }
    
    // 사용자가 수정을 위해 선택한 셀에 해당하는 데이터
    var selectedItem: Person?
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        self.tableView.reloadData()
        
    }
    
    @IBOutlet weak var tableViewSourceSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        return currentDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdForDetailCell, for: indexPath)
        
        let item: Person = currentDataArray[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.phoneNumber
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.selectedItem = currentDataArray[indexPath.row]
        
        //print("didSelectRowAt")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! AddViewController
        
        if segue.identifier == "EDIT_SEGUE" {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                self.selectedItem = currentDataArray[indexPath.row]
                destination.editedItem = self.selectedItem
                destination.isEditable = true
            }
        } else {
            destination.isEditable = false
            
        }
        
        
        
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
