//
//  TableViewExtension.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 19/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

extension UITableView {
    func setup(viewModel: TableViewModel) {
        allowsSelection = viewModel.allowSelection
        rowHeight = viewModel.cellHeight
        separatorStyle = viewModel.separatorStyle
        backgroundColor = viewModel.backgroundColor
    }
}
