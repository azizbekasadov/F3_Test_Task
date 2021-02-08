//
//  SplitViewController.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 08/02/21.
//

import UIKit

class SplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.preferredPrimaryColumnWidthFraction = 0.4
        self.preferredDisplayMode = .primaryOverlay
        self.primaryEdge = .leading
        self.delegate = self
    }

}

extension SplitViewController: UISplitViewControllerDelegate {
    
    @available (iOS 14.0, *)
    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        return .primary
    }
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
