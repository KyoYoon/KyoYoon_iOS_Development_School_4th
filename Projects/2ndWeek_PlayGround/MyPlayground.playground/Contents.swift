//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

// 시험점수를 받아서 해당 점수의 등급(Grade)을 반환해주는 함수
// *Grade = A+, A-, B+, B-, C+ ..

func grade(fromPoint point:UInt) -> String
{
    var gradeValue:String = "F"
    
    switch point
    {
    case 95 ... 100:
        gradeValue = "A+"
    case 90 ..< 95:
        gradeValue = "A"
    default:
        gradeValue = "F"
    }
    
    return gradeValue
}

// Grade 받아서 Point로 변환 
func point(fromGrade grade:String) -> Double
{
    
    var pointValue:Double = 0.0
    
    switch grade {
    case "A+":
        pointValue = 4.5
    case "A":
        pointValue = 4.0
    case "B+":
        pointValue = 3.5
    case "B":
        pointValue = 3.0
    case "C+":
        pointValue = 2.5
    case "C":
        pointValue = 2.0
    case "D+":
        pointValue = 1.5
    case "D":
        pointValue = 1.0
    default:
        pointValue = 0.0
    }
    
    return pointValue
    
}

print("My point is \(point(fromGrade: "A+"))")



var someInts:[Int] = [1,2,3] // 배열 리터럴 문법




