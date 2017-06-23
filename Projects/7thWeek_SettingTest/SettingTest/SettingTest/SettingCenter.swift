//
//  SettingCenter.swift
//  SettingTest
//
//  Created by 정교윤 on 2017. 6. 20..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

//------ SettingView의 Cell Type
enum SettingCellType:String {
    case Basic = "SettingBasicCell"
    case Detail = "SettingDetailCell"
    case Switch = "SettingSwitchCell"
}

class SettingCenter {
    
    // ************************************************* //
    //                      Initialize                   //
    // ************************************************* //
    // MARK:- Initialize
    static var sharedSetting:SettingCenter = SettingCenter()
    
    private init() // 외부에서 Init 사용하지 못하게 막음 
    {
        loadSettingData()
    }
    
    // ************************************************* //
    //          SettingDefaultData Control Method        //
    // ************************************************* //
    // MARK:- SettingDefaultData Control Method
    
    
    // 섹션의 개수 가져오기 { get }
    var sectionCount:Int {
        return settingMenuDataList?.count ?? 0
    }
    
    // 섹션 타이틀 가져오기 { get }
    func titleFor(section:Int) -> String
    {
        guard let sectionData = settingMenuDataList else {
            return "섹션 이름 없음"
        }
        
        let dic:[String:Any] = sectionData[section] as! [String:Any]
        let sectionTitle = dic["SectionTitle"] as? String
        
        return sectionTitle ?? "섹션 이름 없음"
    
    }
    
    // Cell Title 가져오기 { get }
    func titleFor(rowAtIndexPath indexPath:IndexPath) -> String {
        
        
        guard let sectionData = settingMenuDataList else {
            return "섹션 이름 없음"
        }
        
        let dic:[String:Any] = sectionData[indexPath.section] as! [String:Any]
        let dicDataArr = dic["Data"] as? [[String:Any]]
        
        let rowDic:[String:Any] = dicDataArr![indexPath.row]
        
        let rowTitle = rowDic["Content"] as? String
        
        // settingMenuDataList에서 각 row의 title 가져오기
        return rowTitle ?? "타이틀이 없습니다."
    }
    
    func rowCountFor(section:Int) -> Int {
        guard let sectionData = settingMenuDataList else {
            return 0
        }
        
        let dic:[String:Any] = sectionData[section] as! [String:Any]
        if let dicDataArr = dic["Data"] as? [[String:Any]] {
            return dicDataArr.count
        } else {
            return 0
        }
        
        
    }
    
    // Cell type 가져오기  { get }
    // 리턴 타입은 String을 열거형으로 변경해야 됨
    func typeOfCellFor(rowAtIndexPath indexPath:IndexPath) -> SettingCellType {
        
        guard let sectionData = settingMenuDataList else {
            return .Basic
        }
        
        let dic:[String:Any] = sectionData[indexPath.section] as! [String:Any]
        let dicDataArr = dic["Data"] as? [[String:Any]]
        
        let rowDic:[String:Any] = dicDataArr![indexPath.row]
        
        if let rowCellType = rowDic["CellStyle"] as? String {
            let cellStyle:SettingCellType? = SettingCellType(rawValue: rowCellType)
            return cellStyle ?? .Basic
        } else {
            return .Basic
        }
        
    }
    
    
    // ************************************************* //
    //                        DataLoad                   //
    // ************************************************* //
    // MARK:- DataLoad
    
    // Settings.plist 에서 데이터 불러오기
    private func loadSettingData()
    {
        if let path = Bundle.main.path(forResource: "Settings", ofType: "plist"),
            let settingMenuDataList = NSArray(contentsOfFile: path) as? [Any]
        {
            self.settingMenuDataList = settingMenuDataList
        }
        
        
    }
    
    // ************************************************* //
    //                  Private Properties               //
    // ************************************************* //
    // MARK:- Private Properties
    var settingMenuDataList:[Any]?
    
    
    
    
}
