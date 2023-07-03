import UIKit

//:## 컬렉션(Collection)
// 1) 배열 : 데이터를 순서대로 저장하는 컬렉션(자동으로 순번 지정됨)

// 정식문법:
let strArray1: Array<Int> = []
// 단축문법:
let strArray2: [String] = []

// 빈 배열의 생성
let emptyArray1: [Int] = []
let emptyArray2 = Array<Int>()
let emptyArray3 = [Int]()

// 배열의 기본 기능

var numsArray = [1, 2, 3, 4, 5]
numsArray.count
numsArray.isEmpty
numsArray.contains(1)
numsArray.contains(8)
numsArray.randomElement()
numsArray.swapAt(0, 1)

// 배열의 각 요소에 대한 접근
var stringArray = ["Apple", "Swift", "iOS", "Hello", "iOS"]

// [] 서브스크립트 문법(대괄호를 이용한 특별한 함수)
stringArray[0]
stringArray[1]
stringArray[2]
stringArray[3]

stringArray[1] = "Steve"
print(stringArray)

stringArray.first
stringArray.last

// 배열의 시작 인덱스
stringArray.startIndex
stringArray.endIndex
stringArray.endIndex.advanced(by: -1)

stringArray[stringArray.startIndex]

stringArray[stringArray.endIndex - 1]
stringArray[stringArray.index(before: stringArray.endIndex)]

stringArray.firstIndex(of: "iOS")
stringArray.lastIndex(of: "iOS")

// 삽입하기 (insert)
var alphabet = ["A", "B", "C", "D", "E", "F", "G"]

// 앞 또는 중간에 삽입하기
alphabet.insert("c", at: 4)
alphabet.insert("d", at: alphabet.endIndex)

alphabet.insert(contentsOf: ["a", "b", "c"], at: 0)


// 교체하기 (replace)
alphabet = ["A", "B", "C", "D", "E", "F", "G"]

// 요소 교체하기
alphabet[0] = "a"

// 범위 교체
alphabet[0...2] = ["x", "y", "z"]
print(alphabet)

// 원하는 범위 삭제
alphabet[0...1] = []
print(alphabet)

// 교체하기 함수 문법
alphabet.replaceSubrange(0...2, with: ["a", "b", "c"])


// 추가하기 (append)
alphabet = ["A", "B", "C", "D", "E", "F", "G"]

alphabet += ["H"]

// 추가하기 함수 문법
alphabet.append("H") // 맨 마지막에 추가하는 것
alphabet.append(contentsOf: ["H", "I"])


// 삭제하기 (remove)
alphabet = ["A", "B", "C", "D", "E", "F", "G", "H"]
// 서브스크립트 문법으로 삭제
alphabet[0...2] = [] // 빈배열 전달하면 해당 범위가 삭제
// 요소 한개 삭제
alphabet.remove(at: 2) // 삭제하고, 삭제된 요소 리턴
// 요소 범위 삭제
alphabet.removeSubrange(0...2)
print(alphabet)



alphabet = ["A", "B", "C", "D", "E", "F", "G"]
alphabet.removeFirst() // 맨 앞에 요소 삭제하고 삭제된 요소 리턴 (리턴형 String)
alphabet.removeFirst(2) // 앞의 두개의 요소 삭제 --> 리턴은 안함

alphabet.removeLast() // 맨 뒤에 요소 삭제하고 삭제된 요소 리턴
alphabet.removeLast(2)

// 배열의 요소 모두 삭제
alphabet.removeAll()
alphabet.removeAll(keepingCapacity: true) // 저장공간을 일단은 보관해 둠. (안의 데이터만 일단 날림)


//:## 배열의 기타 기능

var nums = [1, 2, 3, 1, 4, 5, 2, 6, 7, 5, 0]

// 배열을 직접정렬하는 메서드 sort
// 정렬된 새로운 배열을 리턴 sorted

//nums.sort() // 배열을 직접 정렬(오름차순)(배열리턴 하지 않음)
var test = nums.sorted()

//nums.reverse() // 요소를 역순으로 정렬 (배열 리턴 하지 않음)
test = nums.reversed()
//print(nums)

test = nums.sorted().reversed() // 새로운 배열은 생성하지 않고, 배열의 메모리는 공유하면서 역순으로 열거할 수 있는 형식을 리턴
print(test)

//배열을 랜덤으로 섞기
nums.shuffle()
nums.shuffled()


// 활용
// 특정 요소 한개 삭제하기
// --> 직접 삭제는 불가 (1) 인덱스를 찾아서, (2) 인덱스에 해당하는 요소 지우기
var puppy1 = ["p", "u", "p", "p", "y"]

if let lastIndexOfP = puppy1.lastIndex(of: "p") {
    puppy1.remove(at: lastIndexOfP)
}

if !nums.isEmpty {
    print("\(nums.count) element(s)")
    
} else {
    print("empty array")
}

var data = [[1,2,3], [4,5,6], [7,8,9]]
data[0][2]


// 반복문과의 결합
// 각 요소에 차례대로 접근, 배열과 반복문은 필연적으로 많이 쓰임
for i in nums {
    print(i)
}

// enumerate: 열거하다
// enumerated() ==> 열거된 것들을 Named 튜플 형태로 한개씩 전달
// 데이터 바구니이기 때문에, 실제 번호표(index)까지 붙여서, 차례대로 하나씩 꺼내서 사용하는 경우가 많을 수 있어서 아래처럼 활용 가능
nums = [10, 11, 12, 13, 14]
for tuple in nums.enumerated() {
    print(tuple)
}

for (index, word) in nums.enumerated() { // 바로 뽑아내기
    print("\(index) - \(word)")
}

for (index, value) in nums.enumerated().reversed() {
    print("\(index) = \(value)")
}


//:## 딕셔너리(Dictionary): 데이터를 키와 값으로 하나의 쌍으로 만들어 관리하는 컬렉션
// 키값은 Hashable 해야함
var dic = ["A": "Apple", "B":"Banana", "C": "City"] // 딕셔너리 리터럴로 생성해서 저장
let dic1 = [1: "Apple", 2: "Banana", 3: "City"]

// 내부적으로 순서가 존재하지 않음
print(dic)
print(dic1)

// 타입 표기
// 단축 문법
var words: [String: String] = [:]
// 정식 문법
let words1: Dictionary<Int, String>

// 빈 딕셔너리의 생성
let emptyDic1: Dictionary<Int, String> = [:]
let emptyDic2 = Dictionary<Int, String>()
let emptyDic3 = [Int: String]()

var dictFromLiteral = ["1": 1, "2": 2]
dictFromLiteral = [:]

// 딕셔너리의 기본 기능
dic = ["A": "Apple", "B": "Banana", "C": "City"]
dic.count
dic.isEmpty

dic.randomElement() // Named Tuple 형태로 리턴

// 딕셔너리의 각 요소에 대한 접근(키 값으로 접근)
var numArray = [1, 2, 3, 4, 5]
numsArray[0]
// 딕셔너리는 기본적으로 서브스크립트[]를 이용한 문법을 주로 사용
dic = ["A": "Apple", "B": "Banana", "C": "City"]

print(dic["A"])

if let a = dic["A"] {
    print(a)
} else {
    print("Not Found")
}

// 딕셔너리는 값만 검색하는 방법은 제공하지 않음.
// 서브스크립트 문법으로 "키"를 전달.

dic["S", default: "Empty"] // nil이 발생할 확률이 없음
// 자료가 없으면 기본값을 리턴하는 문법 ---> 리턴 String // 잘 사용하지 않음

print(dic.keys)
print(dic.values)

print(dic.keys.sorted())
print(dic.values.sorted())

for key in dic.keys.sorted() { // 오름차순 정렬 ---> "return 배열" 배열이 됨.
    print(key)
}


// 업데이트(update) - 삽입하기/ 교체하기/ 추가하기

words.updateValue("City", forKey: "C") // 새로운 요소가 추가되면 ---> 리턴 nil

words = ["A": "A"] // 재할당

// 딕셔너리는 append 함수를 제공하지 않음


dic = ["A": "Apple", "B": "Banana", "C": "City"]

// 요소 삭제해 보기
dic["B"] = nil // 해당요소 삭제
dic["E"] = nil // 존재하지 않는 키/값을 삭제 --> 아무일 일어나지 않음
// 함수로 삭제해보기
dic.removeValue(forKey: "A") // 삭제후, 삭제된 값 리턴
dic.removeValue(forKey: "A") // 다시 삭제해보기 --> nil 리턴
// 전체 삭제하기
dic.removeAll()
dic.removeAll(keepingCapacity: true)

print(dic)

// 딕셔너리의 활용
// 딕셔너리의 중첩 사용
var dict1 = [String: [String]]() // 딕셔너리 벨류에 "배열"이 들어갈 수도 있다.
dict1["arr1"] = ["A", "B", "C"]
dict1["arr2"] = ["D", "E", "F"]
dict1
var dict2 = [String: [String: Int]]() // 딕셔러니 안에 딕셔러니가 들어갈 수 있다.
dict2["dic1"] = ["name": 1, "age": 2]
dict2["dic2"] = ["name": 2, "age": 3]
dict2

// 반복문과의 결합

let dict = ["A": "Apple", "B": "Banana", "C": "City"]

// 딕셔너리는 열거하지 않아도, Named 튜플 형태로 하나씩 꺼내서 전달
// 순서가 없으므로, 실행마다 순서가 달라짐
// 데이터 바구니이기 때문에, 차례대로 하나씩 꺼내서 사용하는 경우가 많을 수 있어서 아래처럼 활용 가능
for (key, value) in dict {
    print("\(key): \(value)")
}

for (key, _) in dict {
    print("Key: ", key)
}

for (_, value) in dict {
    print("Value: ", value)
}



/*:
 ## 3) 세트(Set)
 * 집합: 수학에서의 집합과 비슷한 연산을 제공하는 컬렉션
 ---
 */

// 생김새는 배열과 같아서 생성시 타입을 선언 해야함
// 수학에서의 집합과 동일하기 때문에 요소는 유일해야함(순서 존재 X)

var set: Set = [1, 1, 2, 2, 3, 3]
print(set)

// Set의 값과 Dictionary의 키값은 Hashable
// 정렬순서보다 검색속도가 중요한 경우에 사용
//      검색에 내부적으로 Hashing 알고리즘 사용
//      (hashing --> 특정값을 고정된 길이의 값으로 변환하는 기법으로 인덱싱과 암호화에서 자주 사용됨)
// 유일하면서, 집합의 수학적인 개념(합집합, 교집합, 차집합, 대칭차집합)을 이용할 필요가 있을 때

//:* Set의 타입 표기
// 단축문법
let set1: Set = [1, 2, 3]
// 정식문법
let set2: Set<Int> = [1, 2, 3]
//:* 빈 Set의 생성
let emptySet: Set<Int> = []
let emptySet1 = Set<Int>()
//:* Set의 기본 기능
set.count
set.isEmpty
set.contains(1)
set.randomElement()

//:* 업데이트(Update) - 삽입하기/교체하기/추가하기
// 서브스크립트 관련 문법 없음
// (정식 기능) 함수 문법
print(set.update(with: 1))
print(set.update(with: 7))  // 새로운 요소가 추가되면 ====> 리턴 nil

//:* 제거하기(remove)
var stringSet: Set<String> = ["Apple", "Banana", "City", "Swift"]
// 요소 삭제해보기
stringSet.remove("Swift") // 삭제한 요소를 리턴
stringSet.remove("Steve") // nil (에러는 발생하지 않음)
// 전체요소 삭제
stringSet.removeAll()
stringSet.removeAll(keepingCapacity: true)

print(stringSet)

//:## Set의 활용
//:* Set의 정의
var a: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var b: Set = [1, 3, 5, 7, 9]
var c: Set = [2, 4, 6, 8, 10]
var d: Set = [1, 7, 5, 9, 3]
//:* Set의 비교
a == b
a != b
b == d // 순서 상관 없음
//:* 부분집합/ 상위집합/ 서로소
// 부분집합 여부를 판단
b.isSubset(of: a)
b.isStrictSubset(of: a) // 진부분집합 여부
// 상위집합
a.isSuperset(of: b)
a.isStrictSuperset(of: b)
// 서로소 여부
d.isDisjoint(with: c)

//:* 합집합
var unionSet = b.union(c)
//:* 교집합
var interSet = a.intersection(b)
//a.formIntersection(b) // 원본 변경
//:* 차집합
var subSet = a.subtracting(b)
//:* 대칭차집합
var symmetricSet = a.symmetricDifference(b)
//:* 반복문과의 결합
let iterateingSet: Set = [1, 2, 3]
for num in iterateingSet { // 정렬되지 않은 컬렉션이기 때문에, 실행할 때마다 순서가 달라짐.
    print(num)
}
//:* 기타 유의점
var newSet: Set = [1,2,3,4,5]
var newArray: Array = newSet.sorted()
// Set을 정렬하면, 배열로 리턴함(정렬은 순서가 필요하기 때문.)


//:## KeyValuePairs
//:* 딕셔너리와 유사한 형태이지만, 배열처럼 순서가 있는 컬렉션
// 스위프트 5.2버전에 등장
// 딕셔너리와 비슷한 형태이지만, "순서"가 있는 컬렉션
// key값이 hashable일 필요 없음(검색 알고리즘상 빠르지 않음)
// key값이 동일한 것도 가능
let introduce: KeyValuePairs = ["first": "Hello", "second": "My Name", "third": "is"]
//:* KeyValuePairs의 기본 기능
introduce.count
introduce.isEmpty
//:* 요소에 접근
// 배열처럼, 인덱스로 접근 가능
// 요소에서는 튜플방식으로 접근
introduce[0]
//:* 반복문과의 결합
for value in introduce {
    print("\(value.key)는 \(value.value)입니다.")
}

// append/ remove 같은 기능 없음
// 딕셔너리이지만, 저장된 순서가 중요한 경우, 또는 데이터가 반복될 경우만 임시적/ 제한적으로 사용
