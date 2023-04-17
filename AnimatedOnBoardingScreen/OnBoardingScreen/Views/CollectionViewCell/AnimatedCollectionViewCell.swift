//
//  AnimatedCollectionViewCell.swift
//  AnimatedOnBoardingScreen
//
//  Created by vignesh kumar c on 17/04/23.
//

import UIKit

class AnimatedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setup(slide: OnBoardingSlide) {
        imageView.image = slide.image
    }
}
