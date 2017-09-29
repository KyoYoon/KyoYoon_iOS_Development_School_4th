//
//  ViewController.swift
//  FirebasePractice
//
//  Created by 정교윤 on 2017. 7. 15..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref: DatabaseReference!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var deleteItemTextField: UITextField!
    @IBOutlet weak var selectItemTextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    @IBOutlet weak var resultTextViewField: UITextView!
    
    @IBOutlet weak var selectKeyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.resultTextViewField.layer.borderWidth = 1
        
        ref = Database.database().reference()
        
        ref.observe(.childAdded, with: { (DataSnapShot) in
            print("Item Added")
        })
        
        ref.observe(.childRemoved, with: { (DataSnapShot) in
            print("Item Removed")
        })
        
        ref.observe(.childChanged, with: { (DataSnapShot) in
            print("Item Changed")
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchUpInsideInsertButton(_ sender: UIButton) {
        
        let itemRef = ref.child((nameTextField.text?.lowercased())!)
        
        itemRef.setValue(valueTextField.text)
        
        self.nameTextField.text = ""
        self.valueTextField.text = ""
        
        
        
        
        
    }
    
    @IBAction func touchUpInsideDeleteButton(_ sender: UIButton) {
        
        let itemRef = ref.child((deleteItemTextField.text?.lowercased())!)
        
        itemRef.removeValue { (error, dbref) in
            
            print("delete complete")
        }
        
        self.deleteItemTextField.text = ""
        
    }
    
    @IBAction func touchUpInsideSelectButton(_ sender: UIButton) {
        
        let itemRef = ref.child((selectItemTextField.text?.lowercased())!)
        
        itemRef.observeSingleEvent(of: .value, with: { (DataSnapShot) in
            let rValue = DataSnapShot.value as? String
            
            self.resultTextField.text = rValue
        })
        
        //selectItemTextField.text = ""
        
    }
    
    @IBAction func touchUpInsideSelectKeyButton(_ sender: UIButton) {
        
        //let itemRef = ref
        var resultStr:String = ""
        
        //var resultArr:[String]
        
        
        // 최상위 노드이므로 ref.child("") 명령어로 추출할 필요가 없다.
        ref.observeSingleEvent(of: .value, with: { (DataSnapShot) in
            
//            let values = DataSnapShot.value as? NSDictionary
//            
//            
//            let arr: NSMutableArray = values?.allKeys as! NSMutableArray
//            
//            for element in arr {
//                resultStr += String(describing: element) + "\n"
//            }
            
            
//            let mDic = DataSnapShot.value as! NSDictionary
//            
//            print(mDic.allKeys )
        
            let mDic = DataSnapShot.value as! Dictionary<String, Any>
            
            
            
            let arrMDic = Array(mDic.keys)
            
            print(arrMDic)
            
            for element in arrMDic {
                resultStr += element + ","
            }
            
            self.resultTextViewField.text = resultStr
            
            
        })
        
    }

    
}

