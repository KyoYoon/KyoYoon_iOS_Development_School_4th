//
//  AlbumCoverCell.swift
//  MusicPlayer
//
//  Created by 정교윤 on 2017. 7. 4..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class AlbumCoverCell: UICollectionViewCell {
 
    @IBOutlet var titleLB:UILabel!
    @IBOutlet var imgView:UIImageView!
    
    private var data:SongMetaData?
    var songData:SongMetaData?
    {
       
        
        return self.data
    }
    
    
    
    func setSongData(_ songData:SongMetaData) {
        
        self.data = songData
        
        if let title = songData.songTitle {
            self.titleLB.text = title
        }
        
        if let img = songData.albumImg {
            self.imgView.image = img
        }
    }
    
}
