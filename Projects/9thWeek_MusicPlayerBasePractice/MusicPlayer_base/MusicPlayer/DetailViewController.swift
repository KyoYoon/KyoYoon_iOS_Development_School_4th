//
//  DetailViewController.swift
//  MusicPlayer
//
//  Created by 정교윤 on 2017. 7. 4..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    private var songData:SongMetaData!
    
    @IBOutlet weak var songTitle: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backwardPlayButton: UIButton!
    @IBOutlet weak var forwardPlayButton: UIButton!
    
    var player:AVPlayer?
    var isPlaying:Bool?
    var songID:Int?
    var indexPath:IndexPath?
    var dataSource:SongDataSource?
    
    var currentRate:Float? // 현재 재생되고 있는 음악이 중단되었을 때의 시점을 나타낸 float형 수
    
    
    
    var currentItem:Int?
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var contentView: UIView!
    
    func setSong(data:SongMetaData) {
        self.songData = data
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if indexPath != nil {
            print(indexPath?.item ?? "none")
        }
        
        self.currentItem = self.songData.songID!
        
        hiddenOrShowBackwardOrForwardButton(self.songData.songID!)
        
        let fileName = "\(songData.songID!)"
        
        
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            self.player = AVPlayer(url: url)
        }
        
        
        
        self.player?.play()
        
        updateUI(data: songData)
    }
    
    func updateUI(data:SongMetaData) {
        self.songTitle.text = data.songTitle
        
        print(self.songTitle.text!)
        self.artistName.text = data.artistName
        print(self.artistName.text!)
        
        self.coverImageView.image = data.albumImg
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hiddenOrShowBackwardOrForwardButton(_ songID:Int) {
        if songID == 0 {
            
            print(songID)
            
            // << 버튼 hidden
            self.forwardPlayButton.isHidden = false
            self.backwardPlayButton.isHidden = true
            
        } else if songID == 29 {
            // >> 버튼 hidden
            self.forwardPlayButton.isHidden = true
            self.backwardPlayButton.isHidden = false
        } else {
            // << , >> 버튼 둘 다 show
            self.forwardPlayButton.isHidden = false
            self.backwardPlayButton.isHidden = false
        }
    }
    
    @IBAction func volumeUpButtonTouched(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func volumeDownButtonTouched(_ sender: UIButton) {
        
        
    }
    
    // 뒤에 있는 음악 재생
    @IBAction func backwardPlayButtonTouched(_ sender: UIButton) {
        
        if self.dataSource != nil {
            
            self.currentItem = self.currentItem! - 1
            
            self.player?.pause()
                
                let newData = dataSource?.cellForSongData(at: self.currentItem!)
                
                
                
                setSong(data: newData!)
                
                hiddenOrShowBackwardOrForwardButton(self.songData.songID!)
                
                let fileName = "\(self.songData.songID!)"
                if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
                    player = AVPlayer(url: url)
                }
                
                player?.play()
                
                updateUI(data: self.songData!)
                
                self.contentView.setNeedsDisplay()
                
            
            
            
        }
        
    }
    
    // 플레이 / 스탑 버튼
    @IBAction func playButtonTouched(_ sender: UIButton) {
        
        if self.isPlaying == true {
            
            self.isPlaying = false
            
            self.playButton.setImage(UIImage(named: "pauseWhite"), for: .focused)
            
            self.currentRate = player?.rate
            
            self.player?.pause()
            
            
        } else {
            
            self.isPlaying = true 
            
            self.playButton.setImage(UIImage(named: "playWhite"), for: .focused)
            
            self.player?.playImmediately(atRate: self.currentRate!)
        }
        
    }
    // 앞에 있는 음악 재생
    @IBAction func forwardPlayButtonTouched(_ sender: UIButton) {
        
        if self.dataSource != nil {
            
            self.currentItem = self.currentItem! + 1
            
            self.player?.pause()
                
                let newData = dataSource?.cellForSongData(at: self.currentItem!)
                
                
                
                setSong(data: newData!)
                
                hiddenOrShowBackwardOrForwardButton(self.songData.songID!)
                
                let fileName = "\(self.songData.songID!)"
                if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
                    player = AVPlayer(url: url)
                }
                
                self.player?.play()
                
                updateUI(data: self.songData!)
                
                self.contentView.setNeedsDisplay()
                
            
            
            
        }
        
    }
    
    @IBAction func adjustVolume(_ sender: UISlider) {
        
        if self.player != nil {
            self.player?.volume = sender.value
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
//        self.player?.pause()
//        
//        self.player = nil
//        
//        if let previousView:MainViewController = segue.destination as? MainViewController {
//            
//            print("called")
//            previousView.focusSection = 0
//            previousView.focusItem = self.currentItem!
//        }
//        
//    
//        
//        print("segue")
    }
    */

}
