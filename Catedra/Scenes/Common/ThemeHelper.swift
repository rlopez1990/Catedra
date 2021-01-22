//
//  ThemeHelper.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 19/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

struct ThemeHelper {

    func getMainTintColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 174.0 / 255.0, green: 139.0 / 255.0, blue: 62 / 255.0, alpha: alpha)
    }
    
    func getApperace() -> UINavigationBarAppearance {
        let standard = UINavigationBarAppearance()
        standard.configureWithTransparentBackground()
        standard.backgroundColor = getMainTintColor()
        standard.titleTextAttributes = [.foregroundColor: UIColor.white]
        return standard
    }
}
