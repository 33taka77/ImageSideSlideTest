//
//  SlideCollectionViewFlowLayout.swift
//  ImageSideSlideTest
//
//  Created by 相澤 隆志 on 2015/03/29.
//  Copyright (c) 2015年 相澤 隆志. All rights reserved.
//

import UIKit

class SlideCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        let attributes:NSArray = super.layoutAttributesForElementsInRect(rect)!
        attributes.enumerateObjectsUsingBlock { (obj, index, flag) -> Void in
            var attrib:UICollectionViewLayoutAttributes = obj as UICollectionViewLayoutAttributes
            var rect:CGRect = attrib.bounds;
            rect.size.width += 10
            attrib.bounds = rect
        }
        return attributes
    }
}
