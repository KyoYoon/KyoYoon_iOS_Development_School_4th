# 3주차 정리  

----

## 클래스와 구조체


#### Class & Structures (공통점) 

- 프로그램 코드 블럭의 기본 구조이다.  

- 변수, 상수, 함수를 추가 할수 있다. (두 구조의 문법 같음)

- 단일 파일에 정의되며 다른 코드에서 자동으로 사용할 수 있습니다. (접근제한자에 따라 접근성은 차이가 있다. (접근제한자에 따라 접근성은 차이가 있으며 Internal이 기본 접근제한자로 설정되어 있음)

- 클래스와 구조체 둘 다 initializer(init() 함수)가 만들어지고, 사용자가 추가로 정의할 수 있다. 

- 클래스와 구조체 둘 다 사용하기 위해 변수명을 지어서 선언시 메모리에 적재되며, 인스턴스(instance)라고 불린다.

- 클래스와 구조체 둘 다 기본 구현된 내용에 기능을 더 추가해서 확장할 수 있다. (Extensions)

- 클래스와 구조체 둘 다 프로토콜을 상속(원래 용어는 채택(adoption))받아 사용할 수 있다. 프로토콜은 자바란 언어의 인터페이스와 비슷한 개념인데 클래스와 달리 다중상속이 가능하여 2개 이상의 프로토콜을 클래스와 구조체 둘 다 상속받을 수 있다. 

- 당연한 말이지만 클래스를 구조체에서 상속받을 수 없고 역으로 구조체를 클래스에서 상속받을 수 없고 클래스는 클래스에서마 상속받을 수 있는데 단일 상속만 허용한다.    

#### 클래스와 구조체의 기본 구조

 
```
class someClass { 
	// class definition goes here 
}

struct someStructure {
	// structure definition goes here 
}

struct Resolution {
	var width = 0
	var height = 0
} 

class VideoMode {
	var resolution = Resolution()
	var interlaced = fasle 
	var frameRate = 0.0
	var name:String?
	
}

```
----
#### 인스턴스 (Instance)
- 클래스와 구조체를 아래와 같이 인스턴스화(instanciation)를 통해 인스턴스를 생성한다. 

``` 
let someResolution = Resolution() 
let someVideoMode = VideoMode()

```
----
#### 초기화 (Initialization)
- 인스턴스에 설정된 속성의 초기값을 설정과 초기화하는 데 목적이 있다.
- 클래스 및 구조체는 인스턴스로 만들어질 때 프로퍼티는 적절한 초기값으로 모두 초기화해야 한다. 
- 모든 구조체는 자동으로 Memberwise Initializers 가 만들어진다. (프로퍼티가 1개라면 1개를 파라메터를 받는 Initializer가 생기고, 2개면 2개를 파라메터로 받는 Initializer가 생긴다.)

----
#### Base Intializers

```
struct Subject {
	var name:String
}

class Student {
	var subjects:[Subject] = [] 
	
	func addSubject(name:String) {
		let subject = Subject(name: name) // Memberwise Initializers
		subjects.append(subject)
	}
}

var wingMan:Student = Student() // Initializer

```

----
#### Custom Initializers

```
class Student {
	var subjects:[subject] = [] 
	
	func addSubject(name:String) {
		var sub1:Subject = Subject(gender:true)
		sub1.name = "Joo"
		sub1.age = 30
		subjects.append(sub1)
	}
	
}

struct Subject {
	var name:String?
	var age:Int?
	var gender:Bool
	
	init(gender:Bool) {
		self.gender = gender
	}
}

```

----
#### Classes VS Structures (차이점) 

|  | Class | Structure |
|---|---|---|
| 타입 종류 | 참조 타입 (Reference Type) | 값 타입 (Value Type) |
| 상속여부 | 부모클래스의 특성을 상속받을 수 있음 | 구조체간에는 상속이란 개념이 없음 |
| Type Casting 여부 | 가능 | 불가능 => 인스턴스 생성 개념만 있음 |
| 프로퍼티 수정 가능여부 | instance를 var 와 let 으로 생성한 여부와 관계없이 수정 가능함 | instance를 var를 통해서 만든 경우에 한해서 수정가능 |
| 인스턴스 해제 방식 | Reference Counting을 통해 인스턴스의 해제를 계산 | 관계없음 |
| deinitializer 사용여부 | 가능 | 불가능 |




  

