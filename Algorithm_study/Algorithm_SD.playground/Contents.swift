import UIKit

var greeting = "Hello, playground"



test_ReadLine(input: greeting)

func test_ReadLine(input: String) -> String {
    if let input = readLine() { print("입력 값: \(input)")}
    return input
}


//타입 제약(Type Constraint) 테스트
func isEqual<T: Equatable>(a: T, b: T) -> Bool {
    return a == b
}

print(isEqual(a: 5, b: 5)) // true


// 제네릭 타입으로서, Element 타입이 Comparable 프로토콜을 준수하는 경우에만 사용할 수 있습니다.
struct SortedArray<Element: Comparable> {
    var elements: [Element]
    
    init(_ elements: [Element]) {
        self.elements = elements.sorted()
    }
}

// SortedArray 타입을 생성할 때는 요소의 타입이 Comparable 프로토콜을 따라야 합니다.
let sortedArray = SortedArray([3, 1, 2])
print(sortedArray)



var numbers = [1,2,3,4,5]
var squaredNumbers = numbers.map { $0 * $0 }


print(numbers[0]) //1
print(numbers.first ?? nil) //Optional(1)\n"

numbers[numbers.count - 1]


//let firstElement = numbers[0]  // 첫 번째 요소에 접근. 1
//let lastElement = numbers[numbers.count - 1]  // 마지막 요소에 접근. 5

// 요소 수정하기
numbers[2] = 10  // 인덱스 2의 요소를 10으로 변경 numbers: [1, 2, 10, 4, 5]

// 요소 추가하기
numbers.append(6)  // 배열의 끝에 요소 추가 numbers: [1, 2, 10, 4, 5, 6]


// 요소 삽입
numbers.insert(0, at: 0)  // 특정 인덱스에 요소를 삽입합니다. numbers: [0, 1, 2, 10, 4, 5, 6]
numbers.insert(100, at: 3)  // 인덱스 3에 100을 삽입합니다. numbers: [0, 1, 2, 100, 10, 4, 5, 6]


// 요소 삭제
let removedElement = numbers.removeLast()  // 배열의 마지막 요소를 제거하고 반환합니다. numbers: [0, 1, 2, 100, 10, 4, 5]
print("Removed element: \(removedElement)")  // 출력: Removed element: 6

//let popLastElemnet = numbers.popLast()
//print("Removed element: \(popLastElemnet)")  // 출력: Removed element: 6


let firstElement = numbers.removeFirst()  // 배열의 첫 번째 요소를 제거하고 반환합니다. numbers: [1, 2, 100, 10, 4, 5]
print("First element: \(firstElement)")  // 출력: First element: 0

let removedAtIndex = numbers.remove(at: 2)  // 특정 인덱스의 요소를 제거하고 반환합니다. numbers: [1, 2, 10, 4, 5]
print("Removed element at index 2: \(removedAtIndex)")  // 출력: Removed element at index 2: 100


//삭제후 배열로 반환
numbers.dropFirst() //numbers: [1, 100, 10, 4, 5]
numbers.dropLast() //numbers: [0, 1, 100, 10, 4]


// 배열 순회하기
var temp:[Int] = []
for number in numbers {
    print(number)
    print(temp.append(number))
}


numbers.first
numbers[0]


//2차원 배열 생성하기
var a1 = Array(repeating: Array(repeating: 0, count: 5), count: 3)
a1[1][1] = 99
print(a1)
/*
 "[[0, 0, 0, 0, 0], [0, 99, 0, 0, 0], [0, 0, 0, 0, 0]] "
 */



var cookies = [[Int]]()
for _ in 1...9 {
  var row = [Int]()
  for _ in 1...7 {
    row.append(0)
  }
  cookies.append(row)
}
cookies[1][1] = 99
print(cookies)

let myCookie = cookies[1][1]

var cookies2 = [[Int]](repeating: [Int](repeating: 0, count: 7), count: 9)
cookies2[1][1] = 99
print(cookies2)


// 3x4x5 크기의 3차원 배열을 만드는 예시
var array3D = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 5), count: 4), count: 3)

// 배열에 접근하여 값 할당
array3D[0][0][0] = 10
array3D[2][1][0] = 20

// 배열 출력
print(array3D)




class ListNode<T> {
    var value: T
    var next: ListNode?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}

//class LinkedList<T> {
//    var head: ListNode<T>?
//    
//    // 연결 리스트에 요소 추가
//    func append(value: T) {
//        if head == nil {
//            head = ListNode(value: value)
//            return
//        }
//        
//        var current = head
//        while current?.next != nil {
//            current = current?.next
//        }
//        current?.next = ListNode(value: value)
//    }
//    
//    // 연결 리스트 출력
//    func printList() {
//        var current = head
//        while current != nil {
//            print(current!.value, terminator: " ")
//            current = current?.next
//        }
//        print()
//    }
//}
//
//// 사용 예시
//let list = LinkedList<Int>()
//list.append(value: 1)
//list.append(value: 2)
//list.append(value: 3)
//list.printList()  // 출력: 1 2 3





/*
 요세푸스 문제는 다음과 같다.

 1번부터 N번까지 N명의 사람이 원을 이루면서 앉아있고, 양의 정수 K(≤ N)가 주어진다. 이제 순서대로 K번째 사람을 제거한다. 한 사람이 제거되면 남은 사람들로 이루어진 원을 따라 이 과정을 계속해 나간다. 이 과정은 N명의 사람이 모두 제거될 때까지 계속된다. 원에서 사람들이 제거되는 순서를 (N, K)-요세푸스 순열이라고 한다. 예를 들어 (7, 3)-요세푸스 순열은 <3, 6, 2, 7, 5, 1, 4>이다.

 N과 K가 주어지면 (N, K)-요세푸스 순열을 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 N과 K가 빈 칸을 사이에 두고 순서대로 주어진다. (1 ≤ K ≤ N ≤ 5,000)

 출력
 예제와 같이 요세푸스 순열을 출력한다.

 입력
 7 3
출력
 <3, 6, 2, 7, 5, 1, 4>
 
 */


//배열로 구현하면 O(1),연결리스트로 구현하면 O(K)



// 입력 받기
let input = "7 3" // 여기에 입력을 넣으세요

let line = input.split(separator: " ").map { Int(String($0))! }
var arr = Array(1...line[0]) //[1,2,3,4,5,6,7]
var ans = [Int]()
var index = 0

for _ in 0..<line[0] { //7
    index = (index+line[1]-1)%arr.count
    
    ans.append(arr.remove(at: index))}
print("<\(ans.map{String($0)}.joined(separator: ", "))>")


/*
 N과 K를 입력받는다.
 arr에 1부터 N까지 배열에 담아 저장한다.
 0부터 N까지, index에 (index+K-1)%arr의 크기 를 저장한다. (index+k-1 => 배열의 인덱스는 0부터 시작하기 때문에 1 빼기, %arr.count => 배열 arr의 인덱스 범위를 넘지 않기 위해)

 arr의 index번 째 요소를 삭제해 result에 추가한다.


 배열 result를 String 배열로 변환 후, join 함수를 사용하여 ", "를 요소 사이에 추가하여 반환한다.
 출처: https://codingga-dingga.tistory.com/264 [코끼리와 딩가딩가:티스토리]
 */

요세푸스_순열(n: 7, k: 3)

func 요세푸스_순열(n: Int, k: Int) -> String {
    
    var array = Array(1...n) // [1,2,3,4,5,6,7]
    var index = 0
    var ans = [Int]()
    
    for i in 0..<n {
        index = (index + (k-1)) % array.count
        ans.append(array.remove(at: index))
    }
    
    return "<\(ans.map { String($0) }.joined(separator: ", "))>"
}



요세푸스_순열_백준()

func 요세푸스_순열_백준() {
    let input = "7 3"
    let line = input.split(separator: " ").map { Int(String($0))! }
    let n = line[0] //7
    let k = line[1] //3
    var index = 0
    var ans = [Int]()
    
    var arr = Array(1...n) // [1,2,3,4,5,6,7]
    
    for _ in 0..<n { //7번 순회해야함.
        index = (index + (k - 1)) % arr.count // 오른쪽으로 k번 움직여야한다. k-1은 index가 0부터 시작하기떄문에 -1을 추가 해준다. //순열이므로 나머지를 구한다.
        ans.append(arr.remove(at: index)) //arr에서 삭제된 값을 ans에 append한다.
    }
    print("<\(ans.map { String($0) }.joined(separator: ", "))>")
}




