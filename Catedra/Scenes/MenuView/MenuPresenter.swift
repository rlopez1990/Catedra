//
//  MenuPresenter.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 19/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

final class MenuPresenter {

    private enum Constants {
        static let textColor: UIColor = .black
        static let leftSeparatorColor: UIColor = UIColor(red: 5.0 / 255.0, green: 33.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)
        static let rightSeparatorColor: UIColor = UIColor(red: 215.0 / 255.0, green: 82.0 / 255.0, blue: 144.0 / 255.0, alpha: 1.0)
        static let font: UIFont = .systemFont(ofSize: 30)
        static let cellVerticalPadding: CGFloat = 15.0
        static let cellHeight: CGFloat = 100
    }

    func tableViewModel() -> TableViewModel {
        return .init(allowSelection: true,
                     cellHeight: Constants.cellHeight,
                     backgroundColor: UIColor.clear,
                     separatorStyle: .none)
    }

    func optionViewModels(for informationDetailViewModel: InformationDetailViewModel) -> OptionViewModel {
        let labelViewModel: LabelViewModel = labelViewModels(for: informationDetailViewModel)
        return .init(label: labelViewModel,
                     verticalPadding: Constants.cellVerticalPadding,
                     leftSeparatorColor: Constants.leftSeparatorColor,
                     rightSeparatorColor: Constants.rightSeparatorColor,
                     backgroundColor: .clear)
    }
}
// MARK - Private Methods

private extension MenuPresenter {
    func labelViewModels(for informationDetailViewModel: InformationDetailViewModel) -> LabelViewModel {
        return .init(text: informationDetailViewModel.title,
                     appearance: .init(font: Constants.font,
                                       textColor: Constants.textColor,
                                       backgroudColor: .white))
    }
}
