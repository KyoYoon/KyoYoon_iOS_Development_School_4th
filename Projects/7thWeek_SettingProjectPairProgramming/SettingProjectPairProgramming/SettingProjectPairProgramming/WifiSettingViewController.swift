//
//  WifiSettingViewController.swift
//  SettingProjectPairProgramming
//
//  Created by 정교윤 on 2017. 6. 21..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class WifiSettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwitchCellDelegate {

    var instanceName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // loading시 plist 관련 singletone 결정
        instanceName = UserDefaults.standard.string(forKey: "SharedInstance")!
        print(instanceName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if instanceName == "Wi-Fi" {
            return WifiSettingCenter.sharedInstance.section
        } else if instanceName == "Bluetooth" {
            return BluetoothSettingCenter.sharedInstance.section
        } else if instanceName == "셀룰러" {
            return CellularSettingCenter.sharedInstance.section
        } else if instanceName == "개인용 핫스팟" {
            return HotspotSettingCenter.sharedInstance.section
        } else if instanceName == "네트워크 사업자" {
            return CarrierSettingCenter.sharedInstance.section
        } else {
            return WifiSettingCenter.sharedInstance.section
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if instanceName == "Wi-Fi" {
            return WifiSettingCenter.sharedInstance.numberOfRowsIn(section: section)
        } else if instanceName == "Bluetooth" {
            return BluetoothSettingCenter.sharedInstance.numberOfRowsIn(section: section)
        } else if instanceName == "셀룰러" {
            return CellularSettingCenter.sharedInstance.numberOfRowsIn(section: section)
        } else if instanceName == "개인용 핫스팟" {
            return HotspotSettingCenter.sharedInstance.numberOfRowsIn(section: section)
        } else if instanceName == "네트워크 사업자" {
            return CarrierSettingCenter.sharedInstance.numberOfRowsIn(section: section)
        } else {
            return WifiSettingCenter.sharedInstance.numberOfRowsIn(section: section)
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if instanceName == "Wi-Fi" {
            return WifiSettingCenter.sharedInstance.titleFor(section: section)
        } else if instanceName == "Bluetooth" {
            return BluetoothSettingCenter.sharedInstance.titleFor(section: section)
        } else if instanceName == "셀룰러" {
            return CellularSettingCenter.sharedInstance.titleFor(section: section)
        } else if instanceName == "개인용 핫스팟" {
            return HotspotSettingCenter.sharedInstance.titleFor(section: section)
        } else if instanceName == "네트워크 사업자" {
            return CarrierSettingCenter.sharedInstance.titleFor(section: section)
        } else {
            return WifiSettingCenter.sharedInstance.titleFor(section: section)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if instanceName == "Wi-Fi" {
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
                cell.setSwitch(isOn: UserDefaults.standard.bool(forKey: "WifiSettingSwitchStatus"))
                cell.selectionStyle = .none
                
                return cell
            }
        } else if instanceName == "Bluetooth" {
            let cellType:BluetoothCellStyle = BluetoothSettingCenter.sharedInstance.cellStyleForRow(indexPathAt: indexPath)
            
            switch cellType {
            case .Basic:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = BluetoothSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .none
                
                return cell
            case .Detail:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = BluetoothSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .gray
                
                return cell
            case .Switch:
                let cell:SwitchTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! SwitchTableViewCell
                
                cell.delegate = self
                cell.setTitle(text: BluetoothSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath))
                cell.setSwitch(isOn: UserDefaults.standard.bool(forKey: "BluetoothSettingSwitchStatus"))
                cell.selectionStyle = .none
                
                return cell
            }
        } else if instanceName == "셀룰러" {
            let cellType:CellularCellStyle = CellularSettingCenter.sharedInstance.cellStyleForRow(indexPathAt: indexPath)
            
            switch cellType {
            case .Basic:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = CellularSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .none
                
                return cell
            case .Detail:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = CellularSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .gray
                
                return cell
            case .Switch:
                let cell:SwitchTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! SwitchTableViewCell
                
                cell.delegate = self
                cell.setTitle(text: CellularSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath))
                cell.setSwitch(isOn: UserDefaults.standard.bool(forKey: "CellularSettingSwitchStatus"))
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
        } else if instanceName == "네트워크 사업자" {
            let cellType:CarrierCellStyle = CarrierSettingCenter.sharedInstance.cellStyleForRow(indexPathAt: indexPath)
            
            switch cellType {
            case .Basic:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = CarrierSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .none
                
                return cell
            case .Detail:
                let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath)
                
                cell.textLabel?.text = CarrierSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath)
                
                cell.selectionStyle = .gray
                
                return cell
            case .Switch:
                let cell:SwitchTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! SwitchTableViewCell
                
                cell.delegate = self
                cell.setTitle(text: CarrierSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath))
                cell.setSwitch(isOn: UserDefaults.standard.bool(forKey: "CarrierSettingSwitchStatus"))
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 고쳐야 할 것 
        if CellularSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath) == "셀룰러 데이터 옵션" {
            UserDefaults.standard.set("셀룰러 데이터 옵션", forKey: "SharedInstance")
            print(UserDefaults.standard.string(forKey: "SharedInstance") ?? "없음")
        } else if CellularSettingCenter.sharedInstance.titleForRow(indexPathAt: indexPath) == "개인용 핫스팟" {
            UserDefaults.standard.set("개인용 핫스팟", forKey: "SharedInstance")
            print(UserDefaults.standard.string(forKey: "SharedInstance") ?? "없음")
        } else {
            
            print("fail")
        }
        
        
        
        
    }
    
    func cellValueChanged(cell: SwitchTableViewCell, isOn: Bool) {
        
        if instanceName == "Wi-Fi" {
            UserDefaults.standard.set(isOn, forKey: "WifiSettingSwitchStatus")
            print(UserDefaults.standard.bool(forKey: "WifiSettingSwitchStatus"))
        } else if instanceName == "Bluetooth" {
            UserDefaults.standard.set(isOn, forKey: "BluetoothSettingSwitchStatus")
            print(UserDefaults.standard.bool(forKey: "BluetoothSettingSwitchStatus"))
        } else if instanceName == "셀룰러" {
            UserDefaults.standard.set(isOn, forKey: "CellularSettingSwitchStatus")
            print(UserDefaults.standard.bool(forKey: "CellularSettingSwitchStatus"))
        } else if instanceName == "개인용 핫스팟" {
            UserDefaults.standard.set(isOn, forKey: "HotspotSettingSwitchStatus")
            print(UserDefaults.standard.bool(forKey: "HotspotSettingSwitchStatus"))
        } else if instanceName == "네트워크 사업자" {
            UserDefaults.standard.set(isOn, forKey: "CarrierSettingSwitchStatus")
            print(UserDefaults.standard.bool(forKey: "CarrierSettingSwitchStatus"))
        } else {
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
