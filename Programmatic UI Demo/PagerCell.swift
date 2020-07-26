//
//  PagerCell.swift
//  Programmatic UI Demo
//
//  Created by Adwait Barkale on 26/07/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class PagerCell: UICollectionViewCell{
    
    var curPage:PageData?{
        
        didSet{
            guard let unwrappedPage = curPage else{return}
            
            let img = UIImage(named: unwrappedPage.imageName)
            googleImageView.image = img
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerTitle,attributes:[NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)])
            attributedText.append(NSAttributedString(string: "\n\n\(unwrappedPage.description)",attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),NSAttributedString.Key.foregroundColor: UIColor.black]))
            descTextView.attributedText = attributedText
            descTextView.textAlignment = .center
        }
        
    }
    
    private let googleImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "a1"))
        //enables auto layout for imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descTextView: UITextView = {
        let textView = UITextView()
       
        let attributedText = NSMutableAttributedString(string: "Welcome To the App !!",attributes:[NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)])
        attributedText.append(NSAttributedString(string: "\n\nThis is a Demo App.This Contain Details.Just for Practicing Purpose.",attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: UIColor.black]))
        textView.attributedText = attributedText
        
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    let topView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    
    private func setupUI()
    {
        addSubview(topView)
        topView.addSubview(googleImageView)
        addSubview(descTextView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        googleImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        googleImageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        googleImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        googleImageView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.5).isActive = true
        //descTextView.font = .boldSystemFont(ofSize: 20)
        descTextView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        descTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 25).isActive = true
        descTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
        
        //
        //
        //          myButton.translatesAutoresizingMaskIntoConstraints = false
        //          myButton.topAnchor.constraint(equalTo: descTextView.bottomAnchor, constant: 50).isActive = false
        //          myButton.setTitle("Clik ME", for: UIControl.State.normal)
        //          myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        //          myButton.backgroundColor = .cyan
        //          myButton.titleLabel?.font = .systemFont(ofSize: 20)
        //          myButton.titleLabel?.textAlignment = .center
        //          myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = false
        //          myButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = false
        //
        //
        //          btnPrevious.setTitle("PREV", for: UIControl.State.normal)
        //          btnNext.setTitle("NEXT", for: UIControl.State.normal)
        //          btnPrevious.setTitleColor(.darkGray, for: UIControl.State.normal)
        //          btnNext.setTitleColor(.pink1, for: UIControl.State.normal)
        //
        //          //bottomStackView.axis = .vertical
        //          bottomStackView.addArrangedSubview(btnPrevious)
        //          bottomStackView.addArrangedSubview(pageControl)
        //          bottomStackView.addArrangedSubview(btnNext)
        //          btnPrevious.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //          btnNext.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //
        //          bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        //          bottomStackView.distribution = .fillEqually
        //          bottomLeftView.backgroundColor = .yellow
        //          bottomMiddleView.backgroundColor = .blue
        //          bottomRightView.backgroundColor = .red
        //
        //
        //          bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        //          bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        //          bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        //          bottomStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
