//
//  SideSlideCollectionViewCell.swift
//  ImageSideSlideTest
//
//  Created by 相澤 隆志 on 2015/03/28.
//  Copyright (c) 2015年 相澤 隆志. All rights reserved.
//

import UIKit
import Photos

class SideSlideCollectionViewCell: UICollectionViewCell,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var imageCollectionVIew: UICollectionView!
    var imageArray:[PHAsset] = []
    var imageManager:ImageManager!
    
    func setup() {
        self.imageCollectionVIew.delegate = self
        self.imageCollectionVIew.dataSource = self
        imageManager = ImageManager.sharedInstance
        self.imageCollectionVIew.reloadData()
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:ImageCollectionViewCell = self.imageCollectionVIew.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as ImageCollectionViewCell
        let asset:PHAsset = imageArray[indexPath.row]
        //let asset: PHAsset? = info["object"] as? PHAsset
        //et imgWidth:CGFloat = info["pixelWidth"] as CGFloat
        //let imgHeight:CGFloat = info["pixelHeight"] as CGFloat
        
        let imgWidth:CGFloat = CGFloat(asset.pixelWidth)
        let imgHeight = CGFloat(asset.pixelHeight)
        let sizeX:CGFloat =  CGFloat(asset.pixelWidth/2)
        let sizeY:CGFloat = CGFloat(asset.pixelHeight/2)
        
        PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: CGSizeMake(sizeX, sizeY), contentMode:       PHImageContentMode.AspectFit, options: nil, resultHandler: { (image, info) -> Void in
            cell.imageView.image = image
        })
        //let imgData:UIImage = imageManager.GetImageData(imageArray[indexPath.row], size: CGSizeMake(imgWidth,imgHeight) )
        //cell.imageView.image = imgData
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let info:PHAsset = imageArray[indexPath.row] as PHAsset
        let imgWidth:CGFloat = CGFloat(info.pixelWidth)
        let imgHeight:CGFloat = CGFloat(info.pixelHeight)
        //let width:CGFloat = imgWidth/imgHeight * constHeightOfSlideCell
        let width:CGFloat = self.imageCollectionVIew.frame.width - 10
        let height:CGFloat = constHeightOfSlideCell
        return CGSizeMake(width, height)
    }
   
    
}
