//
//  HotspotSettingViewController.swift
//  SettingProjectPairProgramming
//
//  Created by 정교윤 on 2017. 6. 21..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class HotspotSettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwitchCellDelegate {
    
    var instanceName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // loading시 plist 관련 singletone 결정
        instanceName = UserDefaults.standard.string(forKey: "SharedInstance")!
        print(instanceName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if instanceName == "셀룰러 데이터 옵션" {
            return CellularDataOptionSettingCenter.sharedInstance.section
        } else if instanceName == "개인용 핫스팟" {
            return HotspotSettingCenter.sharedInstance.section
        } else {
            return WifiSettingCenter.sharedInstance.section
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if instanceName == "셀룰러 데이터 옵션" {
            return CellularDataOptionSettingCenter.sharedInstance.numberOfRowsIn(section: section)
        } else if instanceName == "개인용 핫스팟" {
            return HotspotSettingCenter.sharedInstance.numberOfRowsIn(section: section)
        } else {
            return WifiSettingCenter.sharedInstance.numberOfRowsIn(section: section)
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if instanceName == "셀룰러 데이터 옵션" {
            return CellularDataOptionSettingCenter.sharedInstance.titleFor(section: section)
        } else if instanceName == "개인용 핫스팟" {
            return HotspotSettingCenter.sharedInstance.titleFor(section: section)
        } else {
            return WifiSettingCenter.sharedInstance.titleFor(section: section)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if instanceName == "셀룰러 데이터 옵션" {
            let cellType:CellularDataOptionCellStyle = CellularDataOptionSettingCenter.sharedInstance.cellStyleForRow(indexPathAt: indexPath)
            
            switch cellType {
            case .Basic:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = CellularDataOptionSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .none
                
                return cell
            case .Detail:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = CellularDataOptionSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .gray
                
                return cell
            case .Switch:
                let cell:SwitchTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! SwitchTableViewCell
                
                cell.delegate = self
                cell.setTitle(text: CellularDataOptionSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath))
                cell.setSwitch(isOn: UserDefaults.standard.bool(forKey: "CellularDataOptionSettingSwitchStatus"))
                cell.selectionStyle = .none
                
                return cell
            }
        } else if instanceName == "개인용 핫스팟" {
            let cellType:HotspotCellStyle = HotspotSettingCenter.sharedInstance.cellStyleForRow(indexPathAt: indexPath)
            
            switch cellType {
            case .Basic:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = HotspotSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .none
                
                return cell
            case .Detail:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = HotspotSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .gray
                
                return cell
            case .Switch:
                let cell:SwitchTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! SwitchTableViewCell
                
                cell.delegate = self
                cell.setTitle(text: HotspotSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath))
                cell.setSwitch(isOn: UserDefaults.standard.bool(forKey: "HotspotSettingSwitchStatus"))
                cell.selectionStyle = .none
                
                return cell
            }
        } else {
            let cellType:WifiCellStyle = WifiSettingCenter.sharedInstance.cellStyleForRow(indexPathAt: indexPath)
            
            switch cellType {
            case .Basic:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = WifiSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .none
                
                return cell
            case .Detail:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = WifiSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .gray
                
                return cell
            case .Switch:
                let cell:SwitchTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! SwitchTableViewCell
                
                cell.delegate = self
                cell.setTitle(text: WifiSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath))
                
                cell.selectionStyle = .none
                
                return cell
            }
        }
        
        
    }
    
    // 새로운 화면으로 다시 이동할 때 활용할 예정
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        // 고쳐야 할 것
//        if CellularSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath) == "셀룰러 데이터 옵션" {
//            UserDefaults.standard.set("셀룰러 데이터 옵션", forKey: "SharedInstance")
//            print(UserDefaults.standard.string(forKey: "SharedInstance") ?? "없음")
//        } else if HotspotSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath) == "개인용 핫스팟" {
//            UserDefaults.standard.set("개인용 핫스팟", forKey: "SharedInstance")
//            print(UserDefaults.standard.string(forKey: "SharedInstance") ?? "없음")
//        } else {
//            UserDefaults.standard.set("Wi-Fi", forKey: "SharedInstance")
//            print("fail")
//        }
//        
//        
//        
//        
//    }
    
    func cellValueChanged(cell: SwitchTableViewCell, isOn: Bool) {
        
        if instanceName == "셀룰러 데이터 옵션" {
            UserDefaults.standard.set(isOn, forKey: "CellularDataOptionSettingSwitchStatus")
            print(UserDefaults.standard.bool(forKey: "CellularDataOptionSettingSwitchStatus"))
        } else if instanceName == "개인용 핫스팟" {
            print(instanceName)
            UserDefaults.standard.set(isOn, forKey: "HotspotSettingSwitchStatus")
            print(UserDefaults.standard.bool(forKey: "HotspotSettingSwitchStatus"))
        } else {
            print(instanceName)
            print("none")
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
