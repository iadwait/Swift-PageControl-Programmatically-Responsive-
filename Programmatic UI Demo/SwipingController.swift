//
//  SwipingController.swift
//  Programmatic UI Demo
//
//  Created by Adwait Barkale on 26/07/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let pageData = [
        PageData(imgName: "a1", hTitle: "Welcome To Google + ",desc: "This is Google + Team and we welcome you to our Page.Hope You register"),
        PageData(imgName: "a3", hTitle: "Welcome To Facebook",desc: "This is Facebook Team and we welcome you to our Page.Hope You register"),
        PageData(imgName: "a4", hTitle: "Welcome To Linked In",desc: "This is Linked In Team and we welcome you to our Page.Hope You register")
    ]
    var bottomStackView = UIStackView()
    var bottomLeftView = UIView()
    var bottomMiddleView = UIView()
    var bottomRightView = UIView()
    var btnPrevious = UIButton(type: .system)
    var btnNext = UIButton(type: .system)
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        // pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = UIColor(red: 223/255, green: 68/255, blue: 133/255, alpha: 1)
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        pc.currentPage = 0
        pc.numberOfPages = pageData.count
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PagerCell.self, forCellWithReuseIdentifier: "myCell")
        collectionView.isPagingEnabled = true
        view.addSubview(bottomStackView)
        setUI()
        btnNext.addTarget(self, action: #selector(handleNext), for: UIControl.Event.touchUpInside)
        btnPrevious.addTarget(self, action: #selector(handlePrevious), for: UIControl.Event.touchUpInside)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionViewLayout.invalidateLayout()
        coordinator.animate(alongsideTransition: { (_) in
            
            // self.collectionView.contentOffset = .init(x: 0, y: 0)
            
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            
        }) { (nil) in
            
        }
        
        
    }
    
    @objc private func handleNext(){
        print("Next Clicked")
        let nextPage = min(pageControl.currentPage + 1,pageData.count - 1)
        let indexPath = IndexPath(item: nextPage, section: 0)
        pageControl.currentPage = nextPage
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    @objc private func handlePrevious()
    {
        print("Previous Clicked")
        let nextPage = max(pageControl.currentPage - 1,0)
        let indexPath = IndexPath(item: nextPage, section: 0)
        pageControl.currentPage = nextPage
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private func setUI()
    {
        bottomStackView.addArrangedSubview(btnPrevious)
        bottomStackView.addArrangedSubview(pageControl)
        bottomStackView.addArrangedSubview(btnNext)
        btnPrevious.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btnNext.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        bottomLeftView.backgroundColor = .yellow
        bottomMiddleView.backgroundColor = .blue
        bottomRightView.backgroundColor = .red
        
        btnPrevious.setTitle("PREV", for: UIControl.State.normal)
        btnNext.setTitle("NEXT", for: UIControl.State.normal)
        btnPrevious.setTitleColor(.darkGray, for: UIControl.State.normal)
        btnNext.setTitleColor(.pink1, for: UIControl.State.normal)
        
        bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
}

extension SwipingController{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! PagerCell
        
        let curPage = pageData[indexPath.item]
        cell.curPage = curPage
        //        let curImage = UIImage(named: pageData[indexPath.item].imageName)
        //        cell.googleImageView.image = curImage
        //        cell.descTextView.text = pageData[indexPath.item].headerTitle
        //        cell.descTextView.font = UIFont.boldSystemFont(ofSize: 22)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
