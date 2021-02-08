//
//  Coordinator.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
