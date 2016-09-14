//
//  ViewController.swift
//  Calculator
//
//  Created by Shanu Gandhi on 9/7/16.
//  Copyright © 2016 Shanu Gandhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var caldisplay: UILabel!
    
    @IBOutlet private weak var historydisplay: UILabel!
    
    private var isinthemiddleof : Bool = false
    
   
    
    
    
    
    @IBAction private func pressbutton(_ sender: UIButton) {
        let button=sender.currentTitle!
        let getfromdisplay=caldisplay.text!
        let storeforhistory = sender.currentTitle!
        historydisplay.text! = historydisplay.text!+storeforhistory
        
        if (isinthemiddleof == true)
        {
            
            caldisplay.text = getfromdisplay + button
        }
        else
        {
            caldisplay.text = button
            
        }
        isinthemiddleof = true
        
       
    }
    

    
    var  displayit: Double{
        get{
            return Double(caldisplay.text!)!
        }
        set {
            caldisplay.text!=String(newValue)
        }
        
        
        
    }
    
    
    
    
    @IBAction func clearButton(_ sender: UIButton)
        
    {
        brain.setOperand(operand: 0)
        historydisplay.text! = " "
        caldisplay.text = "0"
        isinthemiddleof = false
        
        
    }
    
    var brain = Calculatorbrain()
    
    
    
    @IBAction func performoperation(_ sender: UIButton) {
        historydisplay.text! =  historydisplay.text! + " " + sender.currentTitle! + " "
        if isinthemiddleof{
            brain.setOperand(operand: displayit)
            isinthemiddleof = false
        }
        if let mathematicalsymbol=sender.currentTitle{
            brain.performoperation(symbol: mathematicalsymbol)
        }
        
        
        
        displayit = brain.result
        
        
        
    }
}

