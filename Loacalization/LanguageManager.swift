//
//  LanguageManager.swift
//  Loacalization
//
//  Created by Intekglobal01 on 1/19/24.
//

import Foundation

protocol LanguageObserver: AnyObject {
    func languageDidChange(to language: String)
}

class LanguageManager {
    static let shared = LanguageManager()
    
    private let languageKey = "SelectedLanguage"
    
    var selectedLanguage: String {
        get { UserDefaults.standard.string(forKey: languageKey) ?? "en" }
        
        set {
            UserDefaults.standard.set(newValue, forKey: languageKey)
            notifyObservers()
        }
    }
    
    private var observers = NSHashTable<AnyObject>.weakObjects()
    
    func attach(observer: LanguageObserver) {
        observers.add(observer)
    }
    
    private func notifyObservers() {
        observers.allObjects.compactMap{ $0 as? LanguageObserver }.forEach {
            $0.languageDidChange(to: selectedLanguage)
        }
    }
}
