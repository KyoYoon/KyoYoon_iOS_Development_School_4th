//
//  ViewController.swift
//  TTSTest
//
//  Created by 정교윤 on 2017. 7. 6..
//  Copyright © 2017년 정교윤. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation



class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //TextToSpeech(speechText)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func TextToSpeech(_ speechText:String) {
        
        let synthesizer = AVSpeechSynthesizer()
        
        let utterance = AVSpeechUtterance(string: speechText)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.45
        
        synthesizer.speak(utterance)
    }
    
    @IBAction func TTSButtonTouched(_ sender: UIButton) {
        
        if let text = self.textField.text {
            TextToSpeech(text)
        }
        
    }
    
    


}

