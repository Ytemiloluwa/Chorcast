//
//  BaseOperation.swift
//  PodcastApp
//
//  Created by Temiloluwa on 20/12/2022.
//

import Foundation


class BaseOperation: Operation {
    
    enum State: Equatable {
        
        case idle
        case executing(_ progress: CGFloat = 0)
        case finished(_ success : Bool = false)
        
        // property returns a string to be used as keyPath because BaseOperation will be Key-value observing
        
         var keyPath: String {
            
            switch self {
                
            case.idle:
                return "isIdle"
            case.executing(_):
                return  "isExecuting"
            case.finished(_):
                return "isFinished"
            }
        }
    }
    // closure is called whenever operation state changes
    var onStateChange: ((State) -> Void) = { _ in }
    
    var state = State.idle {
        
        // Supporting kVO with the old and new values keypaths
        willSet {
            
            willChangeValue(forKey: newValue.keyPath)
            willChangeValue(forKey: state.keyPath)
        }
        
        didSet {
            
            onStateChange(state)
            didChangeValue(forKey: oldValue.keyPath)
            didChangeValue(forKey: state.keyPath)
        }
    }
    
    override var isExecuting: Bool {
        
        if case .executing(_) = state {
            
            return true
        }
        
        return false
    }
    
    override  var isFinished: Bool {
        
        if case .finished(_) = state {
            
            return true
        }
        
       return false
    }
    
    override var isConcurrent: Bool {
        
        return true
    }
    
    override func start() {
        
        if isCancelled {
            
            state = .finished()
            return
        }
        
        state = .executing()
        // performs the receiver non concurrent task
        main()
    }
    
    override func cancel() {
        
        state = .finished()
    }
}
