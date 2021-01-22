//
//  Loadable.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 19/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

protocol Loadable {
    func addLoadView(inView: UIView)
    func removeLoadView()
}
