//
//  ThreadManager.swift
//  MovieApp
//
//  Created by k1d_dev on 14/08/23.
//

import Foundation

final class ThreadManager {
    
    static func runOnMainThread(_ block: @escaping () -> Void) {
        
        if Thread.isMainThread {
            block()
            return
        }
        
        DispatchQueue.main.async(execute: block)
        
    }
    
}
