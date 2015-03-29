//
//  ViewController.swift
//  ImageSideSlideTest
//
//  Created by 相澤 隆志 on 2015/03/28.
//  Copyright (c) 2015年 相澤 隆志. All rights reserved.
//

import UIKit

let constHeightOfSlideCell:CGFloat = 240.0

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func doSort(sender: AnyObject) {
        imageManager.sortByKeyOfAssetDate()
        self.collectionView.reloadData()
    }
    
    var imageManager:ImageManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageManager = ImageManager.sharedInstance
        imageManager.collectAssets(updateData)
        //imageManager.sortByKeyOfAssetDate()
    }

    func updateData() {
        //imageManager.sortByKeyOfAssetDate()
        self.collectionView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInCollectionView(collectionView:UICollectionView)->NSInteger{
        imageManager.sortByKeyOfAssetDate()
        let count = imageManager.sectionCount
        return count
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:SideSlideCollectionViewCell = self.collectionView.dequeueReusableCellWithReuseIdentifier("SideSlideCell", forIndexPath: indexPath) as SideSlideCollectionViewCell
        cell.imageArray = imageManager.getImageArray(imageManager.getSectionName(indexPath.section))
        cell.setup()
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width:CGFloat = self.collectionView.bounds.width
        let height:CGFloat = constHeightOfSlideCell
        return CGSizeMake(width, height)
    }
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var header : BsseHeaderCollectionReusableView? = nil
        if (kind == UICollectionElementKindSectionHeader) {
            header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "BaseHeader", forIndexPath: indexPath)
                as? BsseHeaderCollectionReusableView
            header?.sectionTitle.text = imageManager.getSectionName(indexPath.section)
        }
        return header!
    }
}

