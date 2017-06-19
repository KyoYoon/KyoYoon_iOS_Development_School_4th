//
//  ViewController.swift
//  TodayDiary
//
//  Created by 정교윤 on 2017. 6. 14..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        //tableView.scrollToNearestSelectedRow(at: <#T##UITableViewScrollPosition#>, animated: <#T##Bool#>)
        tableView.scrollToRow(at: IndexPath(row: getToday().day-1, section: getToday().month-1), at: .top, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // 12로 설정 (1월 .. 12월)
        return MonTitleArr.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let info = getMonthDateInfo(section: section+1)
        
        return "\(info.monthtext) - \(info.month)월"
        
        //return "\(info.monthtext) - \(info.month)월 - 총 \(info.day)일"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    //func tableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let info = getMonthDateInfo(section: section+1)
        
        
        return info.day
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyTableViewCell
        
        
        
        // 날짜를 월에따라 계산해서 찍어준다.
        cell.setRowDayTitle(String(indexPath.row+1))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func getMonthDateInfo (section:Int) -> (month: Int, monthtext: String, day: Int) {
        
        let monthDateInfo = CalendarEnum.MonthDate(month: section).attributes()
        
        return monthDateInfo
        
    }
    
    
    

}

