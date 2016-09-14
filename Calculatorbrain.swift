//
//  Calculatorbrain.swift
//  Calculator
//
//  Created by Shanu Gandhi on 9/11/16.
//  Copyright © 2016 Shanu Gandhi. All rights reserved.
//

import Foundation

class Calculatorbrain{
    
    enum Operation {
        
        case Constant(Double)
        
        case Uninaryop((Double) -> (Double))
        
        case Binaryop((Double,Double) -> (Double))
        
        case Equals
        
    }

    
    
    
    var operations: Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.Uninaryop(sqrt),
        "cos": Operation.Uninaryop(cos),
        "×" : Operation.Binaryop({$0 * $1}),
        "+" : Operation.Binaryop({$0 + $1}),
        "−" : Operation.Binaryop({$0 - $1}),
        "÷" : Operation.Binaryop({$0 / $1}),
        "=" : Operation.Equals
    ]
    


    private var accumulator=0.0
    
    func setOperand(operand:Double){
        accumulator=operand
    }
    
    func performoperation(symbol:String){
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let  value ): accumulator = value
            case .Uninaryop(let function): accumulator = function(accumulator)
            case .Binaryop(let function):
            
                executeinpending()
                
                pending = Pendingbinaryoperation(binaryfunction: function, firstoperand: accumulator)
                
            case .Equals:executeinpending()
                
                
            }
        }
    }
    
   
    
    
    private var pending: Pendingbinaryoperation?
    
    private func executeinpending(){
        
        if pending != nil {
            accumulator=pending!.binaryfunction(pending!.firstoperand,accumulator)
            
            pending = nil
        }
    
    
    }
    
    
    
    
    
    
    
    
    
    struct Pendingbinaryoperation {
        var binaryfunction: (Double,Double) -> Double
        var firstoperand: Double
    }
    
    
    
    var result:Double {
        get{
            return accumulator
        }
        
        
        
        
    }
}
