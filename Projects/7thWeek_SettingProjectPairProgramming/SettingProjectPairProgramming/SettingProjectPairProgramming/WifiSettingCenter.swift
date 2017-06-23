//
//  WifiSettingCenter.swift
//  SettingProjectPairProgramming
//
//  Created by 정교윤 on 2017. 6. 21..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

//
//  SettingCenter.swift
//  SettingProjectPairProgramming
//
//  Created by 정교윤 on 2017. 6. 21..
//  Copyright © 2017년 정교윤. All rights reserved.
//

enum WifiCellStyle:String {
    
    case Basic = "SettingBasicCell"
    case Detail = "SettingDetailCell"
    case Switch = "SettingSwitchCell"
}

class WifiSettingCenter {
    
    
    static let sharedInstance = WifiSettingCenter()
    private var settingDataList: [Any]?
    var section: Int {
        return settingDataList?.count ?? 0
    }
    
    
    private init() {
        loadDataFromSettingPlist()
    }
    
    func titleFor(section: Int) -> String {
        
        guard let sectionData = settingDataList else {
            return "섹션 이름 없음!"
        }
        
        let dic: [String: Any] = (sectionData[section] as? [String:Any])!
        let sectionTitle = dic["SectionTitle"] as? String
        
        return sectionTitle ?? "섹션 이름 없음!"
    }
    
    func numberOfRowsIn(section:Int) -> Int {
        
        guard let sectionData = settingDataList else
        {
            return 0
        }
        
        let dic:[String:Any] = (sectionData[section] as? [String:Any])!
        
        let rowData:[[String:Any]] = (dic["Data"] as? [[String:Any]])!
        
        
        
        return rowData.count
    }
    
    func titleForRow(indexPathAt: IndexPath) -> String {
        
        guard let sectionData = settingDataList else
        {
            return "없음"
        }
        
        let dic:[String:Any] = (sectionData[indexPathAt.section] as? [String:Any])!
        
        let rowData:[[String:Any]] = (dic["Data"] as? [[String:Any]])!
        
        let rowDic:[String:Any] = rowData[indexPathAt.row]
        
        let title = rowDic["Content"] as? String
        
        return title ?? ""
        
    }
    
    func cellStyleForRow(indexPathAt: IndexPath) -> WifiCellStyle {
        
        guard let sectionData = settingDataList else
        {
            return .Basic
        }
        
        let dic:[String:Any] = (sectionData[indexPathAt.section] as? [String:Any])!
        
        let rowData:[[String:Any]] = (dic["Data"] as? [[String:Any]])!
        
        let rowDic:[String:Any] = rowData[indexPathAt.row]
        
        let style:String = (rowDic["CellStyle"] as? String)!
        
        
        
        
        return WifiCellStyle.init(rawValue: style)!
    }
    
    
    func loadDataFromSettingPlist() {
        if let path = Bundle.main.path(forResource: "WifiSetting", ofType: "plist"),
            let settingDataList = NSArray(contentsOfFile: path) as? [Any] {
            self.settingDataList = settingDataList
        }
        
    }
    
}
