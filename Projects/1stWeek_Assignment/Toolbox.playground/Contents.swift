//: Playground - noun: a place where people can play

import UIKit

//1. inch to cm, cm to inch (2개)
func convertInchToCmOrCmToInch(number myNumber:Double, sunit sourceUnit:String, tunit targetUnit:String) -> Double
{
    var resultNum:Double = 0.0
    
    if sourceUnit == "cm" && targetUnit == "inch" {
        resultNum = myNumber * 0.393701
    }
    else if sourceUnit == "inch" && targetUnit == "cm" {
        resultNum = myNumber * 2.54
    }
    else {
        print("변환할 수 없습니다.")
        resultNum = 0.0
        
    }
    
    print("\(myNumber)\(sourceUnit) 는 \(resultNum)\(targetUnit)입니다.")
        
    return resultNum
    
}


//2. m2 to 평, 평 to  m2 (2개) => 3.3m2 = 1평
func convertM2ToPyeongOrPyeongToM2(number myNumber:Double, sunit sourceUnit:String, tunit targetUnit:String) -> Double
{
    var resultNum:Double = 0.0
    
    if sourceUnit == "m2" && targetUnit == "pyeong" {
        resultNum = myNumber / 3.3
    }
    else if sourceUnit == "pyeong" && targetUnit == "m2" {
        resultNum = myNumber * 3.3
    }
    else {
        print("변환할 수 없습니다.")
        resultNum = 0.0
        
    }
    
    print("\(myNumber)\(sourceUnit) 는 \(resultNum)\(targetUnit)입니다.")
    
    return resultNum
    
}


//3. 화씨 to 섭씨, 섭씨 to 화씨 (2개)
func convertFarenheitToCelciusOrCelciusToFarenheit(number myNumber:Double, sunit sourceUnit:String, tunit targetUnit:String) -> Double
{
    var resultNum:Double = 0.0
    
    if sourceUnit == "F" && targetUnit == "C" {
        resultNum = (myNumber - 32.0) / 1.8
    }
    else if sourceUnit == "C" && targetUnit == "F" {
        resultNum = (myNumber * 1.8) + 32.0
    }
    else {
        print("변환할 수 없습니다.")
        resultNum = 0.0
        
    }
    
    print("\(myNumber)\(sourceUnit) 는 \(resultNum)\(targetUnit)입니다.")
    
    return resultNum
    
}




//4. 데이터량 (KB to MB, MB to GB) (2개)



//5. 시간(hhmmss)을 받으면 초단위로 변경, 초단위를 시간으로변경
//ex) 1/13/20 >> 4400초
func second(fromTime time:UInt) -> UInt
{
    var hour:UInt = time / 10000
    var min:UInt = (time % 10000) / 100
    var sec:UInt = time % 100
    
    // 60 * 60 : 시간을 초로 변경하기 위한 수 60초 * 60분
    // 60 : 분을 초로 변경하기 위한 수로 60초
    return (hour * 60 * 60) + (min * 60) + sec
    
    
}



