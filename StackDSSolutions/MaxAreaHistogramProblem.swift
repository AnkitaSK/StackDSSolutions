//
//  MaxAreaHistogramProblem.swift
//  StackDSSolutions
//
//  Created by Ankita Kalangutkar on 06/05/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation

/*
 there is a bar graph given, and we are asked to find the maximum area spanning from left and
 right of the bar
 eg: 6, 2, 5, 4, 5, 1, 6
        |--|              |--|
        |  |  |--|  |--|  |  |
        |  |  | *|--|* |  |  |
        |  |  |  |  |  |  |  |
        |  |--|  |  |  |  |  |
        |  |  |  |  |  |--|  |
 --------------------------------------------------------
 
 1. find NSR (Next Shortest to the right) [1,  5,  3, 5, 5, 7, 7]
 2. finc NSL (Next Shortest to Left)      [-1, -1, 1, 1, 3, -1, 5] // indices
 3. find width of your block spanning in the left and right
    NSR - NSL - 1 = widths [1, 5, 1, 3, 1, 7, 1]
 4. find area height X width
    find largest area by keeping a variable
 */

func maxArea(_ heights: [Int]) -> Int {
    var maxArea = Int.min
    let nsrs = nsr(heights)
    let nsls = nsl(heights)
    var widths = [Int]()
    for i in 0..<nsrs.count {
        widths.append(nsrs[i] - nsls[i] - 1)
    }
    for i in 0..<heights.count {
        maxArea = max(maxArea, heights[i] * widths[i])
    }
    return maxArea
}

private func nsl(_ heights: [Int]) -> [Int] {
    var ans = [Int]()
    var stack = Stack<(value: Int, index: Int)>()
    for i in 0..<heights.count {
        if stack.isEmpty {
            ans.append(-1)
        } else if !stack.isEmpty, stack.top!.value < heights[i] {
            ans.append(stack.top!.index)
        } else if !stack.isEmpty, stack.top!.value >= heights[i] {
            while !stack.isEmpty, stack.top!.value >= heights[i] {
                stack.pop()
            }
            if stack.isEmpty {
                ans.append(-1)
            } else {
                ans.append(stack.top!.index)
            }
        }
        stack.push((heights[i], i))
    }
    return ans
}

private func nsr(_ heights: [Int]) -> [Int] {
    var ans = [Int]()
    var stack = Stack<(value: Int, index: Int)>()
    for i in stride(from: heights.count - 1, to: -1, by: -1) {
        if stack.isEmpty {
            ans.append(heights.count)
        } else if !stack.isEmpty, stack.top!.value < heights[i] {
            ans.append(stack.top!.index)
        } else if !stack.isEmpty, stack.top!.value >= heights[i] {
            while !stack.isEmpty, stack.top!.value >= heights[i] {
                stack.pop()
            }
            if stack.isEmpty {
                ans.append(heights.count)
            } else {
                ans.append(stack.top!.index)
            }
        }
        stack.push((heights[i], i))
    }
    
    return ans.reversed()
}
