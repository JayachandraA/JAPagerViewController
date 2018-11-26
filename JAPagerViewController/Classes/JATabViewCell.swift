//
//  JATabViewCell.swift
//  UIDemo
//
//  Created by Jayachandra on 11/26/18.
//  Copyright © 2018 BlueRose Technologies Pvt Ltd. All rights reserved.
//

import UIKit

public class JATabViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tabNameLabel: UILabel!
    @IBOutlet weak var selectedTabIndicatorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var selectedIndicatiorView: UIView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
