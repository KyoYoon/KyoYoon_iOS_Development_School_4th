//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var name:String = "정교윤"
print("my name is \(name)")

name = "마크"
print("my name is \(name)")

print("int의 최대 수 : \(Int.max)")
print("int의 최소 수 : \(Int.min)")

print("UInt의 최대 수 : \(UInt.max)")
print("UInt의 최소 수 : \(UInt.min)")



let name1 = "joo"
var age = 10
var height = 4.124

var num1 = 10
var num2 = 11
num1 = num1 / 2
var num3 = num1 + num2
print("\(num3)")

// 튜플 예시 User-defined type
var coin:(Int, Int, Int, Int) = (3,1,5,3)
print("10원짜리 : \(coin.0)")
print("50원짜리 : \(coin.1)")
print("100원짜리 : \(coin.2)")
print("500원짜리 : \(coin.3)")

var person:(name:String, age:Int, weight:Double) = ("joo", 30, 180.2)
print("이름 : " + person.name)
print("나이 : + \(person.age)")
print("몸무게 : \(person.weight)")

// 캐스팅 (형변환) (1)
var total:Int = 107
var average:Double

//average = total / 5 // type error
average = Double(total)/5 // casting
print(average);

//캐스팅 (형변환) (2)
var stringNum:String
var doubleNum:Double
let intNum:Int = 3

stringNum = String(intNum)
doubleNum = Double(intNum)
print(stringNum)
print(doubleNum)

// naming practice
let myName:String = "정교윤"
var myEnglishName:String = "mark"
var myAge:Int = 39
let mySex:String = "남성"
var myWeight:Double = 72.0
var myHeight:Double = 180.0
let myCollegeName:String = "Ajou University Graduate School of Business"
var myJob:String = "대학원생"
var myAnnualSalary:Int = 0

var myFavoriteMusicJenre:String = "Rock, R&B, Ballad"
var myTravelExperience:String = "Slovakia, India, America"

var myMillitaryServiceExperience:String = "Army"

var myPersonalInfo:(name:String, age:Int, height:Double, weight:Double) = ("정교윤", 39, 180.0, 72.0)

var myMacbookName = "Macbook Pro"

var AreYouForeigner:Bool = false

var dontknow:Any = 3

var americaInfo:(population:Any, president:Any, stateNumber:Any) = (300000000, "Donald Trump", 53)

//var temp = americaInfo.population as! Int

let PI = 3.14

var address:String?
address = "서울시 신사동"

print("Naming practice")
print(myName)
print(myEnglishName)
print(myAge)
print(mySex)

// 함수 선언 (function declaration) - fName
func fName(argumentName paramName:Int) -> Int
{
    return paramName + 3
}
// 함수 호출 (function call) - fName
print(fName(argumentName: 10));

// 함수 선언 (function declaration) - printName
func printName(name printStr:String) -> Int
{
    print(printStr)
    return 0
}

func printName2(name printStr:String)
{
    print(printStr)
    
}

func print(name printStr:String)
{
    print(printStr)
    
}

// 함수 호출 - printName
printName(name: "정교윤")
printName2(name: "정교윤")
print("정교윤")

// 함수 호출 addInt
func addInt(num1 firstNum:Int, num2 secondNum:Int) -> Int
{
    return firstNum + secondNum
}

var totalNum:Int = addInt(num1: 100, num2: 200)


func average1() -> Double
{
    return Double(totalNum)/2.0
}

print(average1());

// 나의 정보 출력 이름, 나이, 출생지역, 성별을 받아서 출력하는 함수 선언
func printMyInfo(name myName:String, age myAge:String, location myLocation:String, sex mySex:String)
{
    print("저의 이름은 " + myName + "이고, 나이는 " + myAge + "이고 " + "사는 곳은 " + myLocation + "이고, " + "성별은 " + mySex + "입니다.");
}

printMyInfo(name: "정교윤", age: "39", location: "서울", sex: "남성")


// 함수 선언 (function declaration) - fNumber function with default values
func fNumber(num1 firstNum:Int, num2 secondNum:Int = 10) -> Int
{
    return firstNum + secondNum
    //return num1 + num2
}

// 함수 호출 (function call) - fNumber function
print(fNumber(num1: 10)) // 두 번째 파라메터를 넣지 않았을 경우 디폴트 값 10이 더해짐
print(fNumber(num1: 10, num2: 5)) // 두 번째 파라메터를 넣었을 경우 넣은 값 그대로 더해짐

// 함수의 파라메터는 기본적으로 상수가 되므로 아래와 같이 작성하면 에러가 발생 
//func addInt(num3 firstNum:Int, num4 secondNum:Int) -> Int
//{
//    firstNum = firstNum * 2 // 상수이므로 에러가 발생
    
//    return firstNum + secondNum
//}

// In-Out Parameter Keyword (1)
// _ 은 wild card를 의미하며 사용하지 않았다는 것을 의미한다.
func swapTwoInts(_ a: inout Int, _ b: inout Int)
{
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

print();
print("In-Out Parameter Keyword (1) - Wild Card (_)");
print("Before calling swapTwoInts")
print("someInt : \(someInt)")
print("anotherInt : \(anotherInt)");

swapTwoInts(&someInt, &anotherInt) // wild card 가 있으므로 a: &someInt, b: &anotherInt 로 쓸 필요 없이 &someInt, &anotherInt 로 작성하면 된다.

print("After calling swapTwoInts")
print("someInt : \(someInt)")
print("anotherInt : \(anotherInt)");

// In-Out Parameter Keyword (2) - Without Wild Card (_)
func swapTwoInts1(a: inout Int, b: inout Int)
{
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt1 = 4
var anotherInt1 = 108


print();
print("In-Out Parameter Keyword (2) - Without Wild Card (_)");
print("Before calling swapTwoInts1")
print("someInt1 : \(someInt1)")
print("anotherInt1 : \(anotherInt1)");
swapTwoInts1(a: &someInt1, b: &anotherInt1)
print("After calling swapTwoInts1")
print("someInt1 : \(someInt1)")
print("anotherInt1 : \(anotherInt1)");


print();

print("여러가지 함수 - 매개변수");
// 여러가지 함수 - 매개변수
func getNumber(firstNum num1:Int) -> Int {
    
    return num1
}

func getNumber(num1:Int) -> Int {
    return num1
}

func getNumber() -> Int {
    
    var num1:Int = 22
    return num1
}

func getNumber(firstNum num1:Int, secondNum num2:Int) -> Int {
    
    return num1 + num2
}

func sumNumber(num1:Int, num2:Int = 5) -> Int {
    
    return num1 + num2
}

// 반환타입 예제 

