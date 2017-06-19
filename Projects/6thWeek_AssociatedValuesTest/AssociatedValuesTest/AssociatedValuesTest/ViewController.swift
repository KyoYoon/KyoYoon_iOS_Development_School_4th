//
//  ViewController.swift
//  AssociatedValuesTest
//
//  Created by 정교윤 on 2017. 6. 14..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var productBarCode = Barcode.upc(8, 85909, 51226, 3)
        productBarCode = .qrCode("ABCDEF") // 위의 바코드는 사라지고 QR 코드 정보로 바뀐다. (조건이라서 둘 중의 하나만 존재)
        
        action(code: productBarCode)
        action2(code: productBarCode)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    func action(code:Barcode) {
        
        let productBarcode = code
        
        print("call action")
        
        switch productBarcode {
        case .upc(8, let x, let y, 3):
            print("X: \(x)")
            print("Y: \(y)")
        case .qrCode(let productCode):
            print("QR Code \(productCode)")
        default:
            print("유효하지 않은 코드입니다.")
        }
        
        
        
    }
    
    // patern matching
    func action2(code:Barcode) {
        
        if case let Barcode.upc(8, companyCode, productCode, 3) = code {
            // 정상 바코드
            print("정상 바코드 - call action2")
            print(companyCode)
            print(productCode)
        }
        
        if case let Barcode.qrCode(produceCode) = code {
            print("Produced Code: \(produceCode)")
        }
    }
    

}

