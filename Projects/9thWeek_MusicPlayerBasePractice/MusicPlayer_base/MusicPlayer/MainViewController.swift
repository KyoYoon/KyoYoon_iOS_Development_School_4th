//
//  MainViewController.swift
//  MusicPlayer
//
//  Created by 정교윤 on 2017. 7. 4..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var coverFlowLayout: CoverFlowLayout!
    
    let dataSource = SongDataSource()
    
    var focusSection:Int = 0
    var focusItem:Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(focusSection,focusItem)
        
        let insetSide = collectionView.bounds.size.width / 4
        
        coverFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: insetSide, bottom: 0, right: insetSide)
        
        //let index = IndexPath(item: focusItem, section: focusSection)
//
//        self.collectionView.selectItem(at: index, animated: false, scrollPosition: UICollectionViewScrollPosition())
//        self.collectionView.reloadData()
//        self.collectionView.setNeedsFocusUpdate()
//        self.collectionView.updateFocusIfNeeded()
        
        // 사용자가 선택한 아이템의 마지막 인덱스를 기억한다. back 버튼 눌렀을 때 자동으로 사용자가 마지막으로 선택한 아이템에 포커스를 맞춘다.
        self.collectionView.remembersLastFocusedIndexPath = true
        
        //self.collectionView.scrollToItem(at: index, at: .bottom, animated: false)
        //self.collectionView.reloadData()
        //self.collectionView.setNeedsFocusUpdate()
        //self.collectionView.updateFocusIfNeeded()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! AlbumCoverCell
        
        if let newData = dataSource.cellForSongData(at: indexPath.item) {
            cell.setSongData(newData)
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width / 2
        let height = collectionView.bounds.size.height / 2
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            
            //print(indexPath.item)
            
            // nextVC에 데이터 넣기 
            let cell = collectionView.cellForItem(at: indexPath) as! AlbumCoverCell
            
            nextVC.setSong(data: cell.songData!)
            nextVC.songID = cell.songData?.songID!
            nextVC.isPlaying = true
            nextVC.indexPath = indexPath
            nextVC.dataSource = dataSource
            
            //nextVC.updateUI(data: cell.songData!)
            
            // 화면 전환
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /*
    func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
        
        print("called")
        
//        if collectionView == self.collectionView {
//            return IndexPath(item: 2, section: 0)
//        }
        
        return IndexPath(item: focusItem, section: focusSection)
    }
   */
    
    /*
    let index = NSIndexPath(forItem: 2, inSection: 0) self.collectionView1.selectItemAtIndexPath(index, animated: false, scrollPosition: .None) self.collectionView1.reloadData() self.collectionView1.setNeedsFocusUpdate() self.collectionView1.updateFocusIfNeeded() } func indexPathForPreferredFocusedViewInCollectionView(collectionV‌​iew: UICollectionView) -> NSIndexPath? { if collectionView == self.collectionView1{ return NSIndexPath(forItem: 2, inSection: 0) } }
     
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
