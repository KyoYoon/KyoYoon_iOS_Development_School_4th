//
//  DetailViewController.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var pickerTextField: UITextField!
    
    var ages = [""]
    let salutations = ["", "Mr.", "Ms."]
    
    var isEditMode:Bool? // 편집 모드인지 아닌지 판단 
    
    var age:String?
    var gender:String? 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //let selectedText:String = "Ms."
        
        makeAgeArray()
        
        //ageTextField.loadDropdownData(data: ages)
        
        ageTextField.loadDropdownDataEditMode(data: ages, text: "11")
        
        //pickerTextField.loadDropdownData(data: salutations, onSelect: salutations_onSelect(selectedText:))
//        pickerTextField.loadDropdownData(data: salutations) { (selectedText) in
//
//            if selectedText == "" {
//                print("Hello World")
//            } else if selectedText == "Mr." {
//                print("Hello Sir")
//            } else {
//                print("Hello Madame")
//            }
//
//            
//        }
        
        
        //pickerTextField.loadDropdownData(data: salutations)
        
        pickerTextField.loadDropdownDataEditMode(data: salutations, text: "Mr.")

//        pickerTextField.loadDropdownData(data: salutations, onSelect: salutations_onSelect(selectedText:))
        
        
        //pickerTextField.loadDropdownData(data: salutations, onSelect: salutations_onSelect)
        //pickerTextField.loadDropdownData(data: salutations)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("started")
        self.view.endEditing(true)
    }
    
    func makeAgeArray() {
        for i in 1...100 {
            ages.append(String(i))
        }
        
        
    }
    
    func salutations_onSelect(selectedText: String) {
        if selectedText == "" {
            print("Hello World")
        } else if selectedText == "Mr." {
            print("Hello Sir")
        } else {
            print("Hello Madame")
        }
    }
    

    

}
