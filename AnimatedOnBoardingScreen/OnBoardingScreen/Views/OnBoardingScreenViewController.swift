//
//  OnBoardingScreenViewController.swift
//  AnimatedOnBoardingScreen
//
//  Created by vignesh kumar c on 17/04/23.
//

import UIKit

class OnBoardingScreenViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    var slides: [OnBoardingSlide] = []
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageCollectionView.reloadData()
    }
    
    func configureViews() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(UINib(nibName: "AnimatedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimatedCollectionViewCell")
        slides = [
            OnBoardingSlide(image: UIImage(named: "fo1")),
            OnBoardingSlide(image: UIImage(named: "fo2")),
            OnBoardingSlide(image: UIImage(named: "fo3"))
        ]
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
    }
    
}
extension OnBoardingScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimatedCollectionViewCell", for: indexPath) as! AnimatedCollectionViewCell
        cell.setup(slide: slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 50, 0, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0

        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut], animations: {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1
        }, completion: nil)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}
