//
//  ViewController.swift
//  Calculator
//
//  Created by user279421 on 11/17/25.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var Result: UILabel!
    
    
    @IBOutlet weak var Number1: UITextField!
    
    
    @IBOutlet weak var Number2: UITextField!
    private func getNumbers()-> (Double, Double)?{
        guard
            let text1=Number1.text,
            let text2=Number2.text,
            let num1=Double(text1.replacingOccurrences(of: ",", with: ".")),
            let num2=Double(text2.replacingOccurrences(of: ",", with: "."))
                
        else{
            
            return nil
        }
        return (num1,num2)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Result.text="Result: "
    }
    
    @IBAction func addTap(_ sender: UIButton) {
        guard let (a,b)=getNumbers() else {return}
        let result=a+b
        print("plus")
        Result.text="\(result)"
    }
    
    @IBAction func subtractTap(_ sender: UIButton) {
        guard let (a,b)=getNumbers() else {return}
        let result=a-b
        Result.text="\(result)"
    }
    
    @IBAction func multiplyTap(_ sender: UIButton) {
        guard let (a,b)=getNumbers() else {return}
        let result=a*b
        Result.text="\(result)"
    }
    
    
    @IBAction func divideTap(_ sender: UIButton) {
        guard let (a,b)=getNumbers() else {return}
        if b==0 {
            Result.text="Divsion Error"
            return
        }
        let result = a/b
        Result.text="\(result)"
    }
    
    
    
}

