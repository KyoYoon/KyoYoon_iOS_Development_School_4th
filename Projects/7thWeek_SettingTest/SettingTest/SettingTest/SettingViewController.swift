//
//  SettingViewController.swift
//  SettingTest
//
//  Created by 정교윤 on 2017. 6. 20..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingSwitchCellDelegate {

    // ************************************************* //
    //                  Life Cycle                       //
    // ************************************************* //
    // MARK:- Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ************************************************* //
    //             UITableViewDataSource                 //
    // ************************************************* //
    // MARK:- UITabelViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingCenter.sharedSetting.sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingCenter.sharedSetting.rowCountFor(section: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingCenter.sharedSetting.titleFor(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = SettingCenter.sharedSetting.typeOfCellFor(rowAtIndexPath: indexPath)
        
        
        
        switch cellType {
        case .Basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            
            cell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            cell.selectionStyle = .none
            return cell
        case .Detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            
            cell.textLabel?.text = SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath)
            cell.selectionStyle = .blue
            return cell
        case .Switch:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! SettingSwitchCell
            
            cell.setTitle(SettingCenter.sharedSetting.titleFor(rowAtIndexPath: indexPath))
            
            cell.selectionStyle = .none
            cell.delegate = self
            
            return cell
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = SettingCenter.sharedSetting.typeOfCellFor(rowAtIndexPath: indexPath)
    }
    
    // ************************************************* //
    //             UITableViewDelegate                   //
    // ************************************************* //
    // MARK:- UITabelViewDelegate
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 20
//    }
    

    func switchCellValueChanged(_ cell:SettingSwitchCell, isOn:Bool) {
        print("valueChange: \(isOn)")
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
