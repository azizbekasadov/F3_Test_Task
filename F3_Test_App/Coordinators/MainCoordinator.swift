//
//  MainCoordinator.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import UIKit
import SwiftUI

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SettingsTableViewController()
        viewController.coordinator = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func preview(item: SettingsType) {
        switch item {
        case .alamofire:
            self.showSearchController(urlRequestType: .alamofire)
        case .searchBar, .uiKit, .urlSession:
            self.showSearchController()
        case .searchController:
            self.showSearchController(searchType: .searchController)
        case .swiftUI:
            self.showSearchController(configuration: .swiftUI)
        case .combine:
            self.showSearchController(urlRequestType: .combine)
        }
    }
    
    func showDetails(item: ResultsViewModel) {
        let viewController = DetailsViewController()
        viewController.data = item
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showSearchController(configuration: SettingsType = .uiKit,
                                    urlRequestType: SettingsType = .urlSession,
                                            searchType: SettingsType = .searchBar) {
        if configuration == .uiKit {
            let viewController = SearchTableViewController()
            viewController.coordinator = self
            viewController.isUsingURLSession = urlRequestType == .urlSession
            viewController.isUsingSearchBar = searchType == .searchBar
            viewController.isUsingCombine = urlRequestType == .combine
            self.navigationController.pushViewController(viewController, animated: true)
        } else if configuration == .swiftUI {
            let viewController = UIHostingController(rootView: ContentView())
            self.navigationController.pushViewController(viewController, animated: true)
        }
    }
}
