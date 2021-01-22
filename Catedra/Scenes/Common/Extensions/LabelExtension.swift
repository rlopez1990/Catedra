//
//  LabelExtension.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 19/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

extension UILabel {
    func setup(viewModel: LabelViewModel) {
        text = viewModel.text
        textColor = viewModel.appearance.textColor
        font = viewModel.appearance.font
        backgroundColor = viewModel.appearance.backgroudColor
    }
}
