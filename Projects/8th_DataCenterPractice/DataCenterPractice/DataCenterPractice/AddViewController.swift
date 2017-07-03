//
//  AddViewController.swift
//  DataCenterPractice
//
//  Created by 박종찬 on 2017. 6. 30..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var deleteButton: UIButton!
    
    var person_id:Int = 0
    var indexPath:IndexPath? 
    
    var isEditable:Bool = false
    
    var editedItem: Person?
    
    var buttonHidden:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buttonHidden = self.isEditable

        // Do any additional setup after loading the view.
        if self.isEditable == true {
            self.navItem.title = "수정하기"
            
            self.deleteButton.isHidden = false
            
            
        } else {
            self.navItem.title = "추가하기"
            
            self.deleteButton.isHidden = true
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.deleteButton.isHidden = self.buttonHidden
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.isEditable == true {
            
            if let item = editedItem {
                
                self.person_id = item.id
                self.nameTextField.text = item.name
                self.ageTextField.text = String(item.age)
                self.genderSegmentedControl.selectedSegmentIndex = item.gender.rawValue
                self.phoneNumberTextField.text = item.phoneNumber
                
                
            }
            
            
        } else {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButtonTouched(_ sender: UIBarButtonItem) {
        
        
        
        if self.isEditable == true {
            
            print("보낸 아이디:\(self.person_id)")
            
            // 기존 인덱스와 함께 변경된 데이터를 보내서 수정한다.
            DataCenter.shared.editPerson(["person_id":self.person_id, "name":self.nameTextField.text!, "gender":self.genderSegmentedControl.selectedSegmentIndex, "age":Int(self.ageTextField.text!)!, "phone_number":self.phoneNumberTextField.text!], editId: self.person_id)
            
        } else {
            
            if DataCenter.shared.dataArray.count == 0 {
                print("Save One")
                UserDefaults.standard.set(0, forKey: "NewIndexID")
            } else {
                print("Save Two")
                UserDefaults.standard.set(DataCenter.shared.dataArray.count, forKey: "NewIndexID")
            }
            
            self.person_id = UserDefaults.standard.integer(forKey: "NewIndexID")
            
            //지금까지 있는 사람 수를 새로운 아이디로 넘긴다.
            DataCenter.shared.addPerson(["person_id":self.person_id, "name":self.nameTextField.text!, "gender":self.genderSegmentedControl.selectedSegmentIndex, "age":Int(self.ageTextField.text!)!, "phone_number":self.phoneNumberTextField.text!])
        }
        
        
        
        self.navigationController?.popViewController(animated: true)
        
    }

    @IBAction func deleteButtonTouched(_ sender: UIButton) {
        
        if self.isEditable == true {
            print("보낸 아이디:\(self.person_id)")
            
            // 기존 인덱스와 함께 변경된 데이터를 보내서 수정한다.
            DataCenter.shared.removePerson(["person_id":self.person_id, "name":self.nameTextField.text!, "gender":self.genderSegmentedControl.selectedSegmentIndex, "age":Int(self.ageTextField.text!)!, "phone_number":self.phoneNumberTextField.text!], removeId: self.person_id)
            
        } else {
            print("현재 상태가 추가 모드이므로 삭제할 수 없습니다.")
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
