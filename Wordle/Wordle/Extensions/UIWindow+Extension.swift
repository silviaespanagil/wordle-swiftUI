//
//  UIWindow+Extension.swift
//  Wordle
//
//  Created by Silvia España on 4/3/22.
//

import UIKit

extension UIWindow {
    
    static var key: UIWindow? {
        
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
                let window = windowSceneDelegate.window else {
                    return nil
                }
        return window
    }
}
