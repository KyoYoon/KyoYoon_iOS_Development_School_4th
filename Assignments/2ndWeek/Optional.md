# 2주차 정리  

----

## 옵셔널 (Optional)

#### nil 이란? 

- 다른 프로그래밍 언어에서 쓰이는 null 과 같은 개념이다. 


``` 
class Person {	var name:String	init(name:String) {	self.name = name	}}

let person2:Personprint(person2.name)

결과 : ????

```

- 위와 같이 선언만 되고 인스턴스를 생성하지 않은 상태를 nil 이라고 한다. 

#### Type Safety 

- nil인 상태에서 속성을 참조하거나, 함수를 실행시 발생하는 error로 인한 코드의 불안정성을 해결하기 위한 개념이다.

- Swift 에서는 컴파일러가 통제수준이 굉장히 강해서 nil인 가능성이 보이는 변수가 보이는 즉시 에러를 발생시킨다.
- 만약 nil인 변수선언을 해야 할 경우 optional을 이용해야 한다.
- optional은 두 가지 가능성을 가질 수 있는데 !기호를 사용하여 값이 반드시 있음을 나타내고, ?기호를 사용하여 nil인 가능성이 있음을 미리 선언한다. 

#### 옵셔널 타입 

```
var person:Person // 에러 발생

// !를 사용하는 경우
var person:Person!
person = Person()

// ?를 사용하는 경우 
var person:Person?
person = Person()

```


```
var person:Person!
person.run() // 만약 person 이 nil이라면 프로그램이 작동을 멈춤
var person:Person?person = Person() 

person?.run() // 만약 person이 nil이라면 run()이 실행이 안 된다.

person!.run() // 만약 person이 nil이라면 프로그램이 멈춘다.

```

#### Unwrapping 

- Optional 변수에 값이 있음을 확인하여 일반 변수로 변환시켜주는 것을 말한다.

- 다음과 같이 세 개의 Unwrapping 방법이 있다.
  - Forced Unwrapping 
  - Optional Binding
  - Early Exit

#### 강제 해제 (Forced Unwrapping)

- !기호를 이용하여 일반 변수로 강제 변환시켜주는 것 

``` 
func testFuc(optionalStr:String?){	if optionalStr != nil	{		let unwrapStr:String = optionalStr!		print(unwrapStr)	}}
``` 

#### 선택적 해제 (Optional Unwrapping)

- if let 구문을 이용하여 let으로 선언된 변수에 옵셔널 변수를 삽입 후 조건에 true이면 let 으로 선언한 변수를 이용하여 처리하는 것

```
func testFuc(optionalStr:String?){	if let unwrapStr:String = optionalStr	{		print(unwrapStr)	}}

```

#### Early Exit 

- guard 문을 실행하여 조건이 거짓일 때 return 문을 사용하여 실행을 중지시키는 코드를 삽입하는 방법이며, 조건이 참일 경우 바로 아래의 구문들을 실행한다.

```
func testFuc(optionalStr:String){	guard let unwrapStr:String = optionalStr else	{		return	}	print(unwrapStr)}
```

#### 선택적 해재 - 예제 (1)

- 매개변수가 한 개일 때 처리하는 방법 

```
func isNumber(inputNum:String) -> Bool{	if let firstNumber = Int(inputNum)	{		print(“\(firstNumber)”)	return true	}else	{		return false	}}
```

#### 선택적 해제 - 예제 (2)

- 매개변수가 두 개일 때는 (,)콤마를 이용하여 옵셔널 바인딩을 추가하고 조건을 추가하는 방법을 사용한다.

```
func isNumber(inputNum1:String, inputNum2:String) -> Bool	{	if let firstNumber = Int(inputNum1), let secondNumber = Int(inputNum1)	{		return true	}else	{		return false	}}
```

