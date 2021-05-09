//
//  StackProblemSolutions.swift
//  StackDSSolutions
//
//  Created by Ankita Kalangutkar on 06/05/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation

// next greater to right

func nextGreaterToRight(_ arr: [Int]) -> [Int] {
    var stack = Stack<Int>()
    var ans = [Int]()
    for i in stride(from: arr.count - 1, through: 0, by: -1) { // including 0
        if stack.isEmpty {
            ans.append(-1)
        } else if !stack.isEmpty, stack.top! > arr[i] {
            ans.append(stack.top!)
        } else if !stack.isEmpty, stack.top! <= arr[i] {
            while !stack.isEmpty, stack.top! <= arr[i] {
                stack.pop()
            }
            if stack.isEmpty {
                ans.append(-1)
            } else {
                ans.append(stack.top!)
            }
        }
        stack.push(arr[i])
    }
    return ans.reversed()
}

func nextGreaterFromLeft(_ arr: [Int]) -> [Int] {
    var stack = Stack<Int>()
    var ans = [Int]()
    
    // no need to reverse, traverse from left to right
    for i in 0..<arr.count {
        if stack.isEmpty {
            ans.append(-1)
        } else if !stack.isEmpty, stack.top! > arr[i] {
            ans.append(stack.top!)
        } else if !stack.isEmpty, stack.top! <= arr[i] {
            while !stack.isEmpty, stack.top! <= arr[i] {
                stack.pop()
            }
            if stack.isEmpty {
                ans.append(-1)
            } else {
                ans.append(stack.top!)
            }
        }
        stack.push(arr[i])
    }
    
    // no need to reverse
    return ans
}


func nextSmallestFromLeft(_ arr: [Int]) -> [Int] {
    var ans = [Int]()
    var stack = Stack<Int>()
    for i in 0..<arr.count {
        if stack.isEmpty {
            ans.append(-1)
        } else if !stack.isEmpty, stack.top! < arr[i] {
            ans.append(stack.top!)
        } else if !stack.isEmpty, stack.top! >= arr[i] {
            while !stack.isEmpty, stack.top! >= arr[i] {
                stack.pop()
            }
            if stack.isEmpty {
                ans.append(-1)
            } else {
                ans.append(stack.top!)
            }
        }
        stack.push(arr[i])
    }
    return ans
}


func nextSmallestToRight(_ arr: [Int]) -> [Int] {
    var ans = [Int]()
    var stack = Stack<Int>()
    for i in stride(from: arr.count - 1, to: -1, by: -1) {
        if stack.isEmpty {
            ans.append(-1)
        } else if !stack.isEmpty, stack.top! < arr[i] {
            ans.append(stack.top!)
        } else if !stack.isEmpty, stack.top! >= arr[i] {
            while !stack.isEmpty, stack.top! >= arr[i] {
                stack.pop()
            }
            if stack.isEmpty {
                ans.append(-1)
            } else {
                ans.append(stack.top!)
            }
        }
        stack.push(arr[i])
    }
    return ans.reversed()
}
