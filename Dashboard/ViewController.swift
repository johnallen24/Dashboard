//
//  ViewController.swift
//  Dashboard
//
//  Created by John Allen on 5/10/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let graphView1: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let graphView2: GraphView = {
    let view = GraphView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.white
    return view
    }()
    
    let graphView3: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white

        return view
    }()
    
    let graphView4: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white

        return view
    }()
    
    let topContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let middleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       // view.backgroundColor = colorWithHexString(hexString: "4d4b4e") //f0f0f0
        view.setGradientBackground(colorOne: colorWithHexString(hexString: "4d4b4e"), colorTwo: colorWithHexString(hexString: "f0f0f0"))
        
        
        let topStackView = UIStackView(arrangedSubviews: [graphView1, graphView2])
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        let bottomStackView = UIStackView(arrangedSubviews: [graphView3, graphView4])
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
       
        topStackView.distribution = .fillEqually
        //topStackView.alignment = .center
        topStackView.axis = .horizontal
        topStackView.spacing = 20
        bottomStackView.distribution = .fillEqually
        //bottomStackView.alignment = .center
        bottomStackView.axis = .horizontal
        bottomStackView.spacing = 20
        
        
        //topStackView.backgroundColor = UIColor.blue
        //bottomStackView.backgroundColor = UIColor.green
        topContainer.backgroundColor = colorWithHexString(hexString: "4d4b4e")
        middleContainer.backgroundColor = colorWithHexString(hexString: "4d4b4e")
        
        
        view.addSubview(topContainer)
        view.addSubview(topStackView)
        view.addSubview(middleContainer)
        view.addSubview(bottomStackView)
        
        let tabBarHeight = self.tabBarController?.tabBar.frame.size.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let newViewHeight = view.bounds.height - tabBarHeight! - statusBarHeight
        
        NSLayoutConstraint.activate([
            topContainer.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0),
            topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topContainer.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 0),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 40)
            ])
        
        NSLayoutConstraint.activate([
            middleContainer.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 0),
            middleContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            middleContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            middleContainer.heightAnchor.constraint(equalToConstant: 40),
            //middleContainer.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor, constant: 0)
            ])
        
        
        NSLayoutConstraint.activate([
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomStackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0),
            bottomStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 40)
            ])
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func colorWithHexString(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }



}


extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
}



