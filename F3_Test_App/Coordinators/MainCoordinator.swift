//
//  MainCoordinator.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SearchTableViewController()
        viewController.coordinator = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func preview(item: AnyObject) {
        
    }
}
