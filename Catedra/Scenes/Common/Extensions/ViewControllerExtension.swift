//
//  ViewControllerExtension.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 18/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

extension UIViewController {
    func setup(barItemViewModel: TabBarItemViewModel) {
        tabBarItem = UITabBarItem(title: barItemViewModel.title,
                                  image: barItemViewModel.image,
                                  selectedImage: barItemViewModel.selectedImage)
    }
}
