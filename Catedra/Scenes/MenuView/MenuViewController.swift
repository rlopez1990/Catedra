//
//  MenuViewController.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 18/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController {
    
    // MARK: - Private Properties
    @IBOutlet weak var tableView: UITableView!
    private let presenter = MenuPresenter()
    
    private let elements = [InformationDetailViewModel(title: "Informes sobre democracia", sectionPath: .democracyReports),
                            InformationDetailViewModel(title: "Informes sobre derechos humanos", sectionPath: .humaRightsReports),
                            InformationDetailViewModel(title: "Foro", sectionPath: .forum),
                            InformationDetailViewModel(title: "Voluntariado", sectionPath: .volunteers),
                            InformationDetailViewModel(title: "Podcast", sectionPath: .podcast)]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 229.0 / 255.0, green: 206.0 / 255.0, blue: 179 / 255.0, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.setup(viewModel: presenter.tableViewModel())
        // Register Cell
        OptionTableViewCell.registerCell(inTableView: tableView)
    }
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return elements.count
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell", for: indexPath) as? OptionTableViewCell else {
            return .init()
        }
        let viewModel = presenter.optionViewModels(for: elements[indexPath.row])
        cell.setup(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coordinator = ViewCoordinator()
        let viewModel = elements[indexPath.row]
        let viewController = coordinator.goToNextViewController(for: viewModel.sectionPath)
        viewController.navigationItem.title = viewModel.title
        navigationController?.pushViewController(viewController,
                                                 animated: true)
    }
}
