//
//  ViewController.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 13.11.2020.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    
    var randomGenerator = RandomGenerator()
    
    var rightBarButtonGoToSetting: UIBarButtonItem! = nil
    
    var startButton: StartButton = {
        let b = StartButton(frame: CGRect.zero)
        b.addTarget(self,
                    action: #selector(startButtonAction(sender:)),
                    for: .touchUpInside)
        b.titleLabel?.font = UIFont(name: (b.titleLabel?.font.fontName)!, size: 30)
        //b.setTitle("Touch", for: .normal)
        //b.setTitle("", for: .highlighted)
        b.backgroundColor = .red
        return b
    }()
    
    //MARK: TEST
    @objc private func startButtonAction(sender: UIButton) {
        var randomNumber = 0
        DispatchQueue.main.async { [unowned self] in
            randomNumber = randomGenerator.generatedRandomNumber() 
        }
        DispatchQueue.main.async { [unowned self] in
            self.randomNumberLabel.text = String(randomNumber)
        }
        
    }
    
    var randomNumberLabel: LabelNumberRandom = {
        let l = LabelNumberRandom()
        l.font = UIFont(name: l.font.fontName, size: 100)
        l.textAlignment = .center
        l.text = "777777777777"
        l.isHidden = true
        l.adjustsFontSizeToFitWidth = true
        l.numberOfLines = 5
        l.minimumScaleFactor = 0.1
        
        return l
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingBarButtonItem()
        settingRandomButton()
        setupRandomNumberLabel()
    }
    
    private func settingBarItem() {
        self.navigationController?.navigationBar.tintColor = .red
    }

    private func settingBarButtonItem() {
        self.rightBarButtonGoToSetting = UIBarButtonItem(title: "Settings",
                                                         style: .plain,
                                                         target: self,
                                                         action: #selector(goToSettingsTableVC))
        self.navigationItem.rightBarButtonItem = self.rightBarButtonGoToSetting
    }
    
    @objc private func goToSettingsTableVC() {
        let settingsTVC = SettingsTableVC()
        self.navigationController?.pushViewController(settingsTVC, animated: true)
    }

    private func settingRandomButton() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate(
            [startButton.topAnchor.constraint(equalTo: view.topAnchor),
             startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        )
        
    }
    
    private func setupRandomNumberLabel() {
        randomNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        randomNumberLabel.isHidden = false
        randomNumberLabel.sizeToFit()
        view.addSubview(randomNumberLabel)
        
        NSLayoutConstraint.activate(
            [randomNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             randomNumberLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             randomNumberLabel.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                      multiplier: 0.8),
             randomNumberLabel.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                       multiplier: 0.4)
            ]
        )
        
    }
    
}

