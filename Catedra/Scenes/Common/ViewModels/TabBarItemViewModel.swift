//
//  TabBarItemViewModel.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 18/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

struct TabBarItemViewModel {
    let title: String
    let image: UIImage?
    let selectedImage: UIImage?
    let viewController: UIViewController.Type
    let sectionPath: SectionPath?
}
