//
//  SettingCenter.swift
//  FriendList
//
//  Created by 정교윤 on 2017. 6. 28..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation

enum CellType: String {
    
    case Basic = "basicCell"
    case Detail = "detailCell"
    case Switch = "switchCell"
    
}

enum NotiName: String {
    
    case Non
    case Update = "update"
    
}

// 전체 Table View는 N개의 section으로 구성되어 있고 section 1개는 sectionHeader / sectionRowDatas / sectionFooter 로 구성됨
struct TableData {
    
    var sections:[SectionData] = []
    
    // 초기화할 때 sections 에 append 해준다. 
    // 현재 1개의 section만 존재하므로 append 는 한 번만 일어날 것이다.
    init(datas:[[String:Any]]) {
        for data:[String:Any] in datas {
            sections.append(SectionData(data: data))
        }
    }
}

// section 하나에 속한 전체 데이터를 struct로 선언
// 현재 section 1개에 sectionHeader / sectionRowDatas / sectionFooter 로 구성 
struct SectionData {
    let header:String?
    
    var rows:[CellData] // sectionRowDatas
    
    let footer:String?
    
    init(data:[String:Any]) {
        header = data["sectionHeader"] as? String
        footer = data["sectionFooter"] as? String
        
        rows = []
        
        //
        if let sectionRowDatas: [[String:Any]] = data["sectionRowDatas"] as? [[String:Any]] {
            
            for cellData in sectionRowDatas {
                rows.append(CellData(data: cellData))
            }
            
        }
    }
}

// Section 하나에 속해있는 row들을 각각 CellData로 칭하고 이를 구조체로 생성
struct CellData {
    
    var name: String
    let type: CellType
    var age: String
    var gender: String
    
    var nextData:TableData?
    
    let notiKey: String?
    let postKey: String?
    
    var notiName:NotiName {
        
        return NotiName(rawValue: postKey!) ?? NotiName.Non
        
    }
    
    init(data:[String:Any]) {
        
        name = data["name"] as? String ?? "이름 없음"
        age = (data["age"] as? String)!
        gender = (data["gender"] as? String)!
        
        notiKey = data["notiKey"] as? String
        postKey = data["postKey"] as? String
        
        if let typeStr = data["cellType"] as? String {
            type = CellType(rawValue: typeStr) ?? .Basic
        } else {
            type = .Basic
        }
        
        if let detailData = data["detailData"] as? [[String:Any]] {
            nextData = TableData(datas: detailData)
        }
        
        
        
        
    }
    
    
}

class SettingCenter {
    
    private static let sharedSetting:SettingCenter = SettingCenter()
    
    private let fileName = "FriendList"
    private let fileType = "plist"
    private let fullFileName = "FriendList.plist"
    
    var settingData:TableData?
    
    // return singleton instance
    // calculation property만 class로 선언하여 쓸 수 있음 -> get-only property
    class var standard:SettingCenter{
        return sharedSetting
    }

    
    
    
    init() {
        loadSettingData()
    }
    
    
    
    func getRealPath(fullFileName:String) -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let realPath = path[0] + "/" + fullFileName
        
        return realPath
    }
    
    // FriendList.plist에서 데이터 불러오기 
    private func loadSettingData() {
        
        print("load")
        
        let realPath = getRealPath(fullFileName: fullFileName)
        
        print(realPath)
        
        // document 폴더에 FriendList.plist가 없으면 복사한다. 
        if !FileManager.default.fileExists(atPath: realPath) {
            print("exist")
            if let fileUrl = Bundle.main.path(forResource: fileName, ofType: fileType) {
                do {
                    print("copied")
                    try FileManager.default.copyItem(atPath: fileUrl, toPath: realPath)
                } catch {
                    return
                }
            } else {
                return
            }
        }
        
        // 
        if let dataList = NSArray(contentsOfFile: realPath) as? [[String:Any]] {
            settingData = TableData(datas: dataList)
        }

        
    }
    
    
    
}
