//
//  SecondViewController.swift
//  Loacalization
//
//  Created by Intekglobal01 on 1/19/24.
//

import UIKit

class SecondViewController: UIViewController, LanguageObserver {
    
    

    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var changeLanguageBtn: UIButton!
    
    
    private enum labelText: String {
        case currentL = "current_lenguage"
        case changeL = "change_language"
        
        var raw: String {
            return self.rawValue.localized()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languageLabel.text = "\(labelText.currentL.raw) \(LanguageManager.shared.selectedLanguage)"
        changeLanguageBtn.setTitle(labelText.changeL.raw, for: .normal)
        
        LanguageManager.shared.attach(observer: self)
        
        
    }
    
    
    @IBAction func changeLanguageBtnTapped(_ sender: UIButton) {
        let arr = ["en", "es", "jp"]
        LanguageManager.shared.selectedLanguage = arr.randomElement() ?? ""
//        languageLabel.text = "Current language: \(LanguageManager.shared.selectedLanguage)"
        
    }
    
    func languageDidChange(to language: String) {
        languageLabel.text = "\(labelText.currentL.raw) \(LanguageManager.shared.selectedLanguage)"
        changeLanguageBtn.setTitle(labelText.changeL.raw, for: .normal)
    }
    
}
