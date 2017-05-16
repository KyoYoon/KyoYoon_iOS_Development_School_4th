//: Playground - noun: a place where people can play

import UIKit

// 조건문 연습

// 짝수인지 판단하는 함수 선언
func isEven1(number num:Int) -> Bool
{
    if (num % 2) == 0
    {
        return true
    }
    else
    {
        return false
    }
}

func isEven2(number num:Int) -> Bool
{
    if (num % 2) == 0
    {
        return true
    }
    
    return false
}



let evenNumber:Bool = isEven1(number: 234567899)

print(evenNumber)

let p:(height:Double, weight:Double, money:Int) = (180.0, 70.4, 1000000000)

func isAbleMeeting(person:(height:Double, weight:Double, money:Int)) -> Bool
{
    if person.height >= 170 && person.weight <= 70 && person.money >= 2000
    {
        print("퍼펙트! 무조건 소개!!")
        return true
    }
    else if (person.height >= 170 && person.weight <= 70) || person.money >= 2000
    {
        print("어쨌든 소개 가능!")
        return true
    }
    else if person.height >= 170 || person.weight <= 70 || person.money >= 2000
    {
        print("받아는 볼께")
        return true
    }
    else
    {
        print("안 받아!")
        return false
    }
    
    return false
    
}

isAbleMeeting(person: p)

// 두 수의 값을 스위치
func swapToInt(_ num1:inout Int, _ num2:inout Int)
{
    let temp:Int = num1
    num1 = num2
    num2 = temp
    
}

// 앞에 수에서 뒤의 수를 빼는데 뒤의 수가 더 크면 SwapToInt 함수를 호출하여 앞의 수와 서로 값을 스위치해서 빼기해서 결과값을 반환
func minus(firstNum num1:Int, secondNum num2:Int) -> Int
{
    var vNum1 = num1
    var vNum2 = num2
    
    if vNum2 > vNum1
    {
        
        
        swapToInt(&vNum1, &vNum2)
    }
    
    return vNum1 - vNum2
}

print(minus(firstNum: 5, secondNum: 10))
print(minus(firstNum: 10, secondNum: 5))

// wild card _ 를 쓰고 inout parameter 를 써서 만든 함수 선언
func minus2(_ num1:inout Int, _ num2:inout Int) -> Int
{

    if num2 > num1
    {
        swapToInt(&num1, &num2)
    }
    
    return num1 - num2
    
}

var refNum1:Int = 5
var refNum2:Int = 10

print(minus2(&refNum1, &refNum2))

func calculatePoint(credit myCredit:String)
{
    var point:Double
    
    if (myCredit == "A+") {
        point = 4.5
        
        
    }else if (myCredit == "A") {
        point = 4.0
        
    }else if (myCredit == "B+") {
        point = 3.5
        
    }else if (myCredit == "B") {
        point = 3.0
        
    }else if (myCredit == "C+") {
        point = 2.5
        
    }else if (myCredit == "C") {
        point = 2.0
        
    }else if (myCredit == "D+") {
        point = 1.5
        
    }else if (myCredit == "D") {
        point = 1.0
        
    }else if (myCredit == "F") {
        point = 0.0
        
    }else {
        point = 0.0
    }
    
    print("당신의 점수는 \(point)")
    
}


// 학점을 반환하는 함수
// 시험점수 95점 이상 100점 이하는 A+ 
// 90점 이상 95점 미만은 A
// 85점 이상 90점 미만은 B+
// 80점 이상 85점 미만은 B
// 75점 이상 80점 미만은 C+
// 70점 이상 75점 미만은 C
// 65점 이상 70점 미만은 D+
// 60점 이상 65점 미만은 D
// 60점 미만은 F

func calculateCredit(score myScore:Int)
{
    var resultCredit:String
    
    if myScore >= 0 && myScore <= 100 {
        if (myScore >= 95) {
            resultCredit = "A+"
        }else if (myScore >= 90){
            resultCredit = "A"
        }else if (myScore >= 85){
            resultCredit = "B+"
        }else if (myScore >= 80){
            resultCredit = "B"
        }else if (myScore >= 75){
            resultCredit = "C+"
        }else if (myScore >= 70){
            resultCredit = "C"
        }else if (myScore >= 65){
            resultCredit = "D+"
        }else if (myScore >= 60){
            resultCredit = "D"
        }else {
            resultCredit = "F"
        }
    }else
    {
        resultCredit = "F"
    }
    
    print("당신의 학점은 \(resultCredit)")
    
    calculatePoint(credit: resultCredit)
    
    
}

calculateCredit(score: 94)

// 홀짝 프린트 함수 
func printOddEvenNumber(number myNum:Int) {

    if (myNum % 2 == 0)
    {
        print("\(myNum)은 짝수입니다")
    }else {
        print("\(myNum)은 홀수입니다.")
    }

}

printOddEvenNumber(number: 5)
printOddEvenNumber(number: 4)

// 절대값 구하기
func getAbsoluteValue(number myNum:Int)
{
    var absoluteNum:Int = 0
    
    if(myNum < 0)
    {
        absoluteNum = myNum * -1
    }
    
    print("\(myNum)의 절대값은 \(absoluteNum) 입니다.")
    
}

getAbsoluteValue(number: -5)

// 영화표 할인 
// 기본가격:  9000원
// 10시까지 조조: -10%
// 청소년:       -10%
// argument: 영화시간(24시간제), 성인인원, 청소년인원 
func printMovieDiscount(showtime ourShowTime:Int, adultCount aCount:Int, teenagerCount tCount:Int)
{
    
    var basicPrice:UInt = 9000
    var discountPrice:UInt = 0
    var adultDiscountPrice:Double = 0.0
    var teenagerDiscountPrice:Double = 0.0
    var totalDiscountPrice:Double = 0.0
    var totalPrice:UInt = 0
    var resultPrice:UInt = 0
    
    var basicTotalPrice:UInt = 0
    
    basicTotalPrice = basicPrice * UInt((aCount + tCount))
    
    
    print("총 기본요금: \(basicTotalPrice)")
    
    if ourShowTime >= 7 && ourShowTime <= 10 {
        
        print("성인 10% 할인 / 청소년 19% 할인")
        
        adultDiscountPrice = Double(basicPrice) * Double(aCount) * 0.1
        teenagerDiscountPrice = Double(basicPrice) * Double(tCount) * 0.19
        
        
        
        totalPrice = UInt(Double(basicPrice) * Double(aCount) * 0.9) + UInt(Double(basicPrice) * Double(tCount) * 0.9 * 0.9)
        
    }else {
        
        print("성인 0% 할인 / 청소년 10% 할인")
        
        adultDiscountPrice = 0.0
        teenagerDiscountPrice = Double(basicPrice) * Double(tCount) * 0.1
        
        
        
        totalPrice = UInt(Double(basicPrice) * Double(aCount)) + UInt(Double(basicPrice) * Double(tCount) * 0.9)
        
        
    }
    
    print("총 어른 할인요금: \(adultDiscountPrice)")
    print("총 청소년 할인요금: \(teenagerDiscountPrice)")
    print("지불할 총 요금: \(totalPrice)")
    
    
}

printMovieDiscount(showtime: 10, adultCount: 3, teenagerCount: 2)
print()
printMovieDiscount(showtime: 11, adultCount: 3, teenagerCount: 2)


// 잔돈 프린트 
func countChanges(forMoney money:Int)-> (count100000w:Int, count5000w:Int, count1000w:Int, count500w:Int, count100w:Int)
{
    
    
    
    
    var remainMoney = money
    var count10000won = 0
    var count5000won = 0
    var count1000won = 0
    var count500won = 0
    var count100won = 0
    
    if (remainMoney >= 10000)
    {
        count10000won = remainMoney/10000
        remainMoney = remainMoney%10000
        
    }
    if (remainMoney >= 5000)
    {
        count5000won = remainMoney/5000
        remainMoney = remainMoney%5000
    }
    if (remainMoney >= 1000)
    {
        count1000won = remainMoney/1000
        remainMoney = remainMoney%1000
    }
    if (remainMoney >= 500)
    {
        count500won = remainMoney / 500
        remainMoney = remainMoney % 500
    }
    if (remainMoney >= 100)
    {
        count100won = remainMoney / 100
        remainMoney = remainMoney % 100
    }
    
    
    
    return (count10000won, count5000won, count1000won, count500won, count100won)
    
    
}

//잔돈 프린트
func printNumOfChanges(money myMoney:Int)
{
    var changes:(Int, Int, Int, Int, Int)
    
    print("받은 금액: \(myMoney)")
    
    changes = countChanges(forMoney: myMoney)
    
    
    print("10000원 \(changes.0)개")
    print("5000원 \(changes.1)개")
    print("1000원 \(changes.2)개")
    print("500원 \(changes.3)개")
    print("100원 \(changes.4)개")
}

printNumOfChanges(money: 55600)

// 윤년 구하기
func getLeapYear(year myYear:Int)
{

    if (myYear % 4 == 0 && myYear % 100 != 0) || myYear % 400 == 0 {
        // 윤년
        print("\(myYear)년은 윤년입니다.")
    }else {
        // 평년
        print("\(myYear)년은 평년입니다")
    }
    
    
}

getLeapYear(year: 2400)







