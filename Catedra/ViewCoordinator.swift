//
//  ViewCoordinator.swift
//  Catedra
//
//  Created by Raul Lopez Martinez on 18/01/21.
//  Copyright © 2021 Raul Lopez Martinez. All rights reserved.
//

import UIKit

struct ViewCoordinator {
    
    private enum Constants {
        static let title = "Catedra Francisco I. Madero"
    }
    
    // MARK: - Private Properties
    private let viewModels: [TabBarItemViewModel]
    
    // MARK: - Initializer
    init() {
        viewModels = [TabBarItemViewModel(title: "Inicio",
                                          image: UIImage(systemName: "house"),
                                          selectedImage: UIImage(systemName: "house.fill"),
                                          viewController: WebViewController.self,
                                          sectionPath: nil),
                      TabBarItemViewModel(title: "Información",
                                          image: UIImage(systemName: "book"),
                                          selectedImage: UIImage(systemName: "book.fill"),
                                          viewController: MenuViewController.self,
                                          sectionPath: nil),
                      TabBarItemViewModel(title: "Contacto",
                                          image: UIImage(systemName: "envelope"),
                                          selectedImage: UIImage(systemName: "envelope.fill"),
                                          viewController: WebViewController.self,
                                          sectionPath: .contact)]
    }
    
    // MARK: - Public methods
    func createRootViewController() -> UIViewController {
        let tabBar = UITabBarController()
        let viewControllers = viewModels.map { createViewController(for: $0) }
        tabBar.viewControllers = viewControllers
        return tabBar
    }
    
    func goToNextViewController(for sectionPath: SectionPath) -> UIViewController {
        let viewController = WebViewController()
        viewController.path = sectionPath
        return viewController
    }
}

// MARK: - Private methods
private extension ViewCoordinator {
    func createViewController(for viewModel: TabBarItemViewModel) -> UIViewController {
        let viewController = viewModel.viewController.init()
        viewController.setup(barItemViewModel: viewModel)
        viewController.navigationItem.title = Constants.title
        
        setupSectionPathIfNeeded(for: viewController, sectionPath: viewModel.sectionPath)
        return UINavigationController(rootViewController: viewController)
    }

    func setupSectionPathIfNeeded(for viewController: UIViewController, sectionPath: SectionPath?) {
        guard let path = sectionPath,
            let webViewController = viewController as? WebViewController else {
            return
        }
        webViewController.path = path
    }
}
