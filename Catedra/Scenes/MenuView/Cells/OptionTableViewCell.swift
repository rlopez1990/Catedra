//
//  OptionTableViewCell.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 18/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

final class OptionTableViewCell: UITableViewCell, TableViewCellRegistrable {
    // MARK: - Private methods
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var leftView: UIView!
    @IBOutlet weak private var rightView: UIView!
    @IBOutlet weak private var topLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak private var bottomLayoutConstraint: NSLayoutConstraint!

    func setup(viewModel: OptionViewModel) {
        titleLabel.setup(viewModel: viewModel.label)
        leftView.backgroundColor = viewModel.leftSeparatorColor
        rightView.backgroundColor = viewModel.rightSeparatorColor
        topLayoutConstraint.constant = viewModel.verticalPadding
        topLayoutConstraint.constant = viewModel.verticalPadding
        backgroundColor = viewModel.backgroundColor
        selectionStyle = .none
    }
}
