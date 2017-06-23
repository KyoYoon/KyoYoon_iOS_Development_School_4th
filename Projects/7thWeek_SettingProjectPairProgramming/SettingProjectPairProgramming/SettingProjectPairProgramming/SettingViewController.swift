//
//  SettingViewController.swift
//  SettingProjectPairProgramming
//
//  Created by 정교윤 on 2017. 6. 21..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwitchCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingCenter.sharedInstance.section 
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingCenter.sharedInstance.numberOfRowsIn(section: section)
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingCenter.sharedInstance.titleFor(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType:CellStyle = SettingCenter.sharedInstance.cellStyleForRow(indexPathAt: indexPath)
        
        switch cellType {
        case .Basic:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            
            cell.textLabel?.text = SettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
            
            cell.selectionStyle = .none
            
            return cell
        case .Detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
            
            cell.textLabel?.text = SettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
            
            cell.selectionStyle = .gray
            
            return cell
        case .Switch:
            let cell:SwitchTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! SwitchTableViewCell

            cell.delegate = self
            cell.setTitle(text: SettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath))
            cell.setSwitch(isOn: UserDefaults.standard.bool(forKey: "SettingSwitchStatus"))
            cell.selectionStyle = .none
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if SettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath) == "Wi-Fi" {
            UserDefaults.standard.set("Wi-Fi", forKey: "SharedInstance")
        } else if SettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath) == "Bluetooth" {
            UserDefaults.standard.set("Bluetooth", forKey: "SharedInstance")
        } else if SettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath) == "셀룰러" {
            UserDefaults.standard.set("셀룰러", forKey: "SharedInstance")
        } else if SettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath) == "개인용 핫스팟" {
            UserDefaults.standard.set("개인용 핫스팟", forKey: "SharedInstance")
        } else if SettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath) == "네트워크 사업자" {
            UserDefaults.standard.set("네트워크 사업자", forKey: "SharedInstance")
        } else {
            UserDefaults.standard.set("Wi-Fi", forKey: "SharedInstance")
            print("fail")
        }
        
        
    }
    
    func cellValueChanged(cell: SwitchTableViewCell, isOn: Bool) {
        UserDefaults.standard.set(isOn, forKey: "SettingSwitchStatus")
        print(UserDefaults.standard.bool(forKey: "SettingSwitchStatus"))
    }

}
