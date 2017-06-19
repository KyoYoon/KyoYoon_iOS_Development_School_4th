//
//  CalendarEnum.swift
//  TodayDiary
//
//  Created by 정교윤 on 2017. 6. 14..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

var MonTitleArr:[String] = ["January","February","March","April","May","June","July","August","September","October","November","December"]
var DayArr:[Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

enum CalendarEnum {
    
    case MonthDate(month: Int)
    
    func attributes() -> (month: Int, monthtext: String, day: Int) {
        switch self {
        case .MonthDate(let a):
            return (month: a, monthtext: MonTitleArr[a-1], day: DayArr[a-1])
        }
    }
    
     
    
}
