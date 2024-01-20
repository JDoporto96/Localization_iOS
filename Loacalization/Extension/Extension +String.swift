//
//  Extension +String.swift
//  Loacalization
//
//  Created by Intekglobal01 on 1/19/24.
//

import Foundation

extension String {
    func localized() -> String {
        if let appLanguage = DefaultManager.getSelectedLanguage() {
            if appLanguage == "es" {
                let path = Bundle.main.path(forResource: "es", ofType: "lproj")
                let bundle = Bundle(path: path!)
                return NSLocalizedString(self, tableName: "Localizable", bundle: bundle!, value:self, comment: self)
                
            } else if appLanguage == "jp" {
                let path = Bundle.main.path(forResource: "jp", ofType: "lproj")
                let bundle = Bundle(path: path!)
                return NSLocalizedString(self, tableName: "Localizable", bundle: bundle!, value:self, comment: self)
            }
        }
        
        let path = Bundle.main.path(forResource: "en", ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: "Localizable", bundle: bundle!, value:self, comment: self)
    }
}
