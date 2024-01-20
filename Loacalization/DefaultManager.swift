//
//  DefaultManager.swift
//  Loacalization
//
//  Created by Intekglobal01 on 1/19/24.
//

import Foundation

class DefaultManager: NSObject {
    static let KEY_SelectedLanguage = "SelectedLanguage"
    
    static func setSelectedLanguage(ver: Int) {
        UserDefaults.standard.set(ver, forKey: KEY_SelectedLanguage)
        UserDefaults.standard.synchronize()
        
    }
    
    static func getSelectedLanguage() -> String? {
        if let projFileName = UserDefaults.standard.value(forKey: KEY_SelectedLanguage) as? String {
            return projFileName
        }
        return nil
    }
    
    static func removeSelectedLanguage () {
        UserDefaults.standard.removeObject(forKey: KEY_SelectedLanguage)
        UserDefaults.standard.synchronize()
    }
}
