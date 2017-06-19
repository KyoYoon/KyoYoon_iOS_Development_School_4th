//
//  CurrentMonthDay.swift
//  TodayDiary
//
//  Created by 정교윤 on 2017. 6. 15..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import Foundation

func getToday() -> (day:Int, month:Int) {
    let date = Date() // 오늘 날짜 추출
    let day:Int = Calendar.current.component(.day, from: date)
    let month:Int = Calendar.current.component(.month, from: date)
    
    
    
    return (day: day, month: month)
}
