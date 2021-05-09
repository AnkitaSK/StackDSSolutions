//
//  Stack.swift
//  StackDSSolutions
//
//  Created by Ankita Kalangutkar on 06/05/21.
//  Copyright © 2021 Ankita Kalangutkar. All rights reserved.
//

import Foundation

struct Stack<T> {
    private var container: [T]
    
    init() {
        container = []
    }
    
    var isEmpty: Bool {
        return container.isEmpty
    }
    
    var top: T? {
        return container.last
    }
    
    mutating func push(_ element: T) {
        container.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T {
        return container.removeLast()
    }
}
