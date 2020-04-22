//: Playground - noun: a place where people can play

import UIKit

//Lab07 Closure
//Part A: 請找出下列程式碼的錯誤並依提⽰改正
//Question (1) your answer should keep (a:Int, b:Int)->Bool
let numbers = [10, 8, 20, 7, 56, 3, 2, 1, 99]
var finished = numbers.sorted{ (a:Int, b:Int)->Bool in return a < b }
for i in finished{
    print("\(i)", terminator: " ")
}
//1(b) your answer should keep the parameters a, b and the statement a < b
let mynumbers2 = [10, 8, 20, 7, 56, 3, 2, 1, 99]
var myfinished2 = mynumbers2.sorted{ a, b in return a < b }
for i in myfinished2{
    print("\(i)", terminator: " ")
}
//1(c) your answer should use the "$" sign to represent the parameters
let mynumbers3 = [10, 8, 20, 7, 56, 3, 2, 1, 99]
var myfinished3 = mynumbers3.sorted{ $0 < $1 }
for i in myfinished3{
    print("\(i)", terminator: " ")
}

//Part B: 請依指⽰實作closure f
//Question 2
func sum(from: Int, to: Int, f: (Int) -> (Int)) -> Int {
    var sum = 0
    for i in from...to {
        sum += f(i)
    }
    return sum
}
//closure f 實作範例1:
sum(from: 1, to: 10) {
    a in a
} // This will get the sum of the first 10 numbers
//closure f 實作範例2:
sum(from: 1, to: 10) {
    $0
} // This will also get the sum of the first 10 numbers

print()

//Implement your code below so that the sum will be the total of all circumference
//1. Here we have an array that stores the radius of each circle
//2. use the equation Circumference = 2 x π × radius
//3. to avoid the type conversion problem, we use π = 3 instead of 3.14
let π = 3
let radius = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
print(sum(from: 0, to: radius.count) { //請於此實作
    $0 * 2 * π
})

