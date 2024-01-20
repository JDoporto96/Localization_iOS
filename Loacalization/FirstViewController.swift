//
//  ViewController.swift
//  Loacalization
//
//  Created by Intekglobal01 on 1/19/24.
//

import UIKit

class FirstViewController: UIViewController, LanguageObserver {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    private enum labelText: String {
        case helloText = "hello_text"
        case nextBtn = "next_button_text"
        
        var raw: String {
            return self.rawValue.localized()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = labelText.helloText.raw
        nextBtn.setTitle(labelText.nextBtn.raw, for: .normal)
        
        LanguageManager.shared.attach(observer: self)
    }

    
    func languageDidChange(to language: String) {
        welcomeLabel.text = labelText.helloText.raw
        nextBtn.setTitle(labelText.nextBtn.raw, for: .normal)
    }

}

