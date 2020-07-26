//
//  ViewController.swift
//  Programmatic UI Demo
//
//  Created by Adwait Barkale on 26/07/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    let googleImageView: UIImageView = {
       let imageView = UIImageView(image: #imageLiteral(resourceName: "a1"))
        //enables auto layout for imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
   

    var btn = UIButton()
    var bottomLeftView = UIView()
    var bottomMiddleView = UIView()
    var bottomRightView = UIView()
    var bottomStackView = UIStackView()
    var testButton = UIButton()
    var btnPrevious = UIButton(type: .system)
    var btnNext = UIButton(type: .system)
    
    
    let descTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Welcome To the App !!",attributes:[NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\nThis is a Demo App.This Contain Details.Just for Practicing Purpose.",attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
    
        return textView
    }()
    
    let pageControl: UIPageControl = {
       let pc = UIPageControl()
       // pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = UIColor(red: 223/255, green: 68/255, blue: 133/255, alpha: 1)
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        pc.currentPage = 0
        pc.numberOfPages = 4
        return pc
    }()
    
    let topView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()

        addToView()
        setupUI()
    }
    
    func addToView()
    {
        view.addSubview(topView)
        topView.addSubview(googleImageView)
        view.addSubview(descTextView)
        //view.addSubview(myButton)
        //view.addSubview(btnPrevious)
        view.addSubview(bottomStackView)
        //bottomLeftView.addSubview(testButton)
    }
    let myButton = UIButton()
    
    private func setupUI()
    {
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        googleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        googleImageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        googleImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        googleImageView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.5).isActive = true
        
        descTextView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        descTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        descTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
       
       
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.topAnchor.constraint(equalTo: descTextView.bottomAnchor, constant: 50).isActive = false
        myButton.setTitle("Clik ME", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.backgroundColor = .cyan
        myButton.titleLabel?.font = .systemFont(ofSize: 20)
        myButton.titleLabel?.textAlignment = .center
        myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = false
        myButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = false

      
        btnPrevious.setTitle("PREV", for: UIControl.State.normal)
        btnNext.setTitle("NEXT", for: UIControl.State.normal)
        btnPrevious.setTitleColor(.darkGray, for: UIControl.State.normal)
        btnNext.setTitleColor(.pink1, for: UIControl.State.normal)
        
        //bottomStackView.axis = .vertical
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
        
        
        bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}


extension UIColor{
    
    static var pink1 = UIColor(red: 223/255, green: 68/255, blue: 133/255, alpha: 1)
    
}
