//
//  UITableViewCellRegistrable.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 19/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

protocol TableViewCellRegistrable { }

extension TableViewCellRegistrable where Self: UITableViewCell {
    static func registerCell(inTableView tableView: UITableView) {
        tableView.register(self.nib, forCellReuseIdentifier: self.cellIdentifier)
    }
}

// MARK: - Private methods
private extension TableViewCellRegistrable {
    
    static var cellIdentifier: String {
        return String(describing: self)
    }

    static private var bundle: Bundle {
        return Bundle(for: MenuViewController.self)
    }

    static private var nib: UINib {
        return UINib(nibName: self.cellIdentifier, bundle: self.bundle)
    }
}
