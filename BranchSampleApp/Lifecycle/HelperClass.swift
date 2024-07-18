//
//  HelperClass.swift
//  BranchSampleApp
//
//  Created by Md Arsalan Ahmad on 18/07/24.
//

import Foundation

class UserDefaultsHelper {
    
    static let shared = UserDefaultsHelper()
    
     let defaults = UserDefaults.standard
    
    // Keys
     struct Keys {
        static let concentHandled = "concentHandled"
    }
    
    // Getter and Setter for your value
    var concentHandled: Bool? {
        get {
            return defaults.bool(forKey: Keys.concentHandled)
        }
        set {
            defaults.set(newValue, forKey: Keys.concentHandled)
        }
    }
    
    private init() {
        // Private initialization to ensure just one instance is created.
    }
}
