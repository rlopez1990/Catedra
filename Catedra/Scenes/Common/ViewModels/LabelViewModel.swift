//
//  LabelViewModel.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 19/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

struct LabelViewModel {
    // MARK: - Nested type
    struct LabelAppearence {
        let font: UIFont
        let textColor: UIColor
        let backgroudColor: UIColor
    }

    let text: String
    let appearance: LabelViewModel.LabelAppearence
}

