//
//  StockSpanProblem.swift
//  StackDSSolutions
//
//  Created by Ankita Kalangutkar on 06/05/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation

// Stock Span Problem
/*     0    1   2   3   4   5   6
 ip = 100, 80, 60, 70, 60, 75, 85
 op = 1,   1,  1,  2,  1,  4,  6
 
 concurrent smaller element count before it.
 i.e count till you find greater element from left (i.e greater element from left)
 */

// using dictionary
//func stockSpanProblem(_ arr: [Int]) -> [Int] {
//    var ans = [Int]()
//    var stack = Stack<[Int: Int]>()
//
//    for i in 0..<arr.count {
//        if stack.isEmpty {
//            ans.append(1)
//        } else if !stack.isEmpty, stack.top!.keys.first! > arr[i] { // top will always return one key, value pair
//            ans.append(i - stack.top!.values.first!)
//        } else if !stack.isEmpty, stack.top!.keys.first! <= arr[i] {
//            while !stack.isEmpty, stack.top!.keys.first! <= arr[i] {
//                stack.pop()
//            }
//            if stack.isEmpty {
//                ans.append(1)
//            } else {
//                ans.append(i - stack.top!.values.first!)
//            }
//        }
//        stack.push([arr[i]: i]) // store index
//    }
//
//    return ans
//}

// using tuple
func stockSpanProblem(_ arr: [Int]) -> [Int] {
    var ans = [Int]()
    var stack = Stack<(value: Int, index: Int)>()
    
    for i in 0..<arr.count {
        if stack.isEmpty {
            ans.append(1)
        } else if !stack.isEmpty, stack.top!.value > arr[i] { // top will always return one key, value pair
            ans.append(i - stack.top!.index)
        } else if !stack.isEmpty, stack.top!.value <= arr[i] {
            while !stack.isEmpty, stack.top!.value <= arr[i] {
                stack.pop()
            }
            if stack.isEmpty {
                ans.append(1)
            } else {
                ans.append(i - stack.top!.index)
            }
        }
        stack.push((arr[i], i)) // store value along with index
    }
    
    return ans
}
