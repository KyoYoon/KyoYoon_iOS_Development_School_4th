# 1주차 과제  

----

## 목차 
### 1. 객체지향형 프로그래밍이란 무엇인가?
### 2. 클래스(Class) 와 오브젝트(Object)의 차이

----

#### 1-1. 객체지향형 프로그래밍의 의미 및 특징  

- 객체지향형 프로그래밍은 영어로는 Object Oriented Programming 이며 절차식 프로그래밍 (Procedural Programming) 과는 상반되는 개념으로써 객체 (Object) 에 대한 정의와 행위를 규정한 클래스 (class) 를 기반으로 객체를 생성하여 프로그래밍하는 것을 의미하며, 기존 절차식 프로그래밍과 달리 유지보수가 용이한 장점이 있다.  

- 객체지향프로그래밍의 5가지 속성으로 추상화, 캡슐화, 은닉화, 상속성, 다형성이 있으며 각 속성에 대해서는 아래와 같이 설명할 수 있다.
	- 추상화: 불필요한 정보는 숨기고, 중요한 정보만을 표현함으로써 프로그램을 간단히 만드는 것
	- 캡슐화: 데이터와 메소드를 하나의 단위로 묶는 것 
	- 은닉화: 객체 외부에서 객체 상태를 바꾸거나 허가되지 않은 동작으로부터 보호하는 것
	- 상속성: 기존에 있던 클래스를 바탕으로 새로운 클래스를 만드는 것
	- 다형성: 어떤 한 요소에 여러 개념을 넣어 놓은 것이며, 일반적으로 오버라이딩, 오버로딩을 의미합니다. 같은 method에 대해 클래스에 따라 다른 행위를 하도록 만들 수 있는 특징이 있습니다.

#### 1-2. 클래스(class)와 오브젝트(object)의 의미 및 구현방법 

- 클래스는 기존의 데이터 여러개를 묶은 구조체(structure)를 확장한 개념으로써, 클래스 내부에 데이터를 저장할 변수 및 변수를 입력받고 결과값을 리턴할 수 있는 함수를 내장하고 있으며 생성될 때의 액션과 소멸될 때의 액션을 정의한 함수를 내장하고 있고 보통 이 함수를 메소드라고 부른다. 클래스는 변수 선언과 마찬가지로 한 번만 정의하면 된다.
- 아래의 소스코드는 스위프트로 간단한 클래스를 작성한 예시이다.
 
```
class City: NSObject {

    var _name:String = ""
    var name:String {
        get {
            return _name
        }
        set (newVal) {
            _name = newVal
        }
    }
}
```
- 오브젝트는 클래스를 인스턴스화하여 만든 인스턴스나 변수를 의미하는데 실질적인 행위를 하게 만들어주는 역할을 하며, 클래스와 달리 여러 번 생성이 가능하다. 
- 위 클래스를 이용하여 인스턴스화하려면 아래와 같이 변수 선언을 해주면 된다.

```
var city:City
```
----
#### 2-1. 클래스와 오브젝트 간의 차이점
- 클래스는 어떤 물체를 만들기 위한 틀로 인식하면 되며 정의는 한 번만 할 수 있으며, 객체는 클래스를 인스턴화한 인스턴스 또는 변수를 말한다.
- 실제 컴퓨터 상에서 보면 클래스는 메모리에 올라가지 않은 채 물체의 기능 및 목적을 정의한 것이며 객체는 인스턴스화를 통해 메모리에 적재된 상태이고 객체는 원하는 대로 여러 번 사용할 수 있다. 
- 이 두 개의 차이점은 아래와 같이 정리해볼 수 있다. 

|  | Class | Object |
|---|---|---|
| Definition | Class is mechanism of binding data members and associated methods in a single unit. | Instance of class or variable of class. |
| Existence | It is logical existence | It is physical existence |
| Memory Allocation | Memory space is not allocated , when it is created. | Memory space is allocated, when it is created. |
| Declaration/Definition | Definition is created once. | it is created many time as you require. |




  

