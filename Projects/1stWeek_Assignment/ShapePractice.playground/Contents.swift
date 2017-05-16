//: Playground - noun: a place where people can play

import UIKit

//(정)사각형의 넓이 구하는 함수 만들기
//argument : width(가로), length(세로).
func getSquareArea(width myWidth:Double, length myLength:Double) -> Double
{
    return myWidth * myLength
}



//원의 넓이 구하는 함수 만들기
//argument : radius(반지름)
func getCircleArea(radius myRadius:Double) -> Double
{
    return myRadius * 2.0 * 3.14
}



//삼각형의 넓이 구하는 함수 만들기
//argument : base(밑변), height(높이)
func getTriangleArea(base myBase:Double, height myHeight:Double) -> Double
{
    return myBase * myHeight * 0.5
}



//사다리꼴의 넓이 구하는 함수 만들기
//argument : base(밑변), top(윗변), height(높이)
func getTrapezoidArea(base myBase:Double, top myTop:Double, height myHeight:Double) -> Double
{
    return ((myBase + myTop) * myHeight) * 0.5
}


//(정)육면체의 부피 구하는 함수 만들기
//argument: width(가로), length(세로), height(높이)
func getCubeVolume(width myWidth:Double, length myLength:Double, height myHeight:Double) -> Double
{
    return myWidth * myLength * myHeight
}



//원기둥의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)
func getCylinderVolume(radius myRadius:Double, height myHeight:Double) -> Double
{
    return myRadius * myRadius * 3.14 * myHeight
}

//구체의 부피 구하는 함수 만들기
//argument : radius(반지름)
func getSphereVolume(radius myRadius:Double) -> Double
{
    return (4/3) * 3.14 * (myRadius * myRadius * myRadius)
}

//원뿔의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)
func getConeArea(radius myRadius:Double, height myHeight:Double) -> Double
{
    return (1/3) * 3.14 * (myRadius * myRadius) * myHeight
}




