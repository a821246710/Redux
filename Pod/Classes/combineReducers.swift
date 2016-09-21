//
//  combineReducers.swift
//  Redux.swift
//
//  Created by Mark Wise on 11/4/15.
//  Copyright © 2015 InstaJams. All rights reserved.
//

import Foundation

public func combineReducers(_ reducers: [String: Reducer]) -> Reducer {
    func combination(_ previousState: Any, action: ReduxAction) -> Any {
        if let appState = previousState as? ReduxAppState {
            var nextState: ReduxAppState = appState
            for (key, reducer) in reducers {
                if let previousStateForKey = nextState.get(key) {
                    let nextStateForKey = reducer(previousStateForKey, action)
                    if let ns = nextStateForKey as? AnyEquatable {
                        nextState.set(key, value: ns)
                    } else {
                        print("AppState value must conform AnyEquatable")
                    }
                }
            }
            return nextState
        }
        return previousState
    }
    return combination
}
