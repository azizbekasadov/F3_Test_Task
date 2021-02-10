//
//  SettingsTableViewController.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 08/02/21.
//

import UIKit

enum SettingsType: String, CaseIterable {
    case urlSession = "URLSession"
    case alamofire = "Alamofire"
    case uiKit = "UIKit"
    case swiftUI = "SwiftUI"
    case searchBar = "SearchBar"
    case searchController = "SearchController"
    case combine = "Combine"
}

class SettingsTableViewController: UITableViewController {

    // switch -> URLSession, Alamofire
    // switch -> UIKit, SwiftUI
    // switch -> SearchBar only, w/ SearchController (UIKit)
    
    private var titles: [SettingsType] = []
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateLanguage()
        self.configureUI()
        self.loadData()
    }
    
    private func configureUI() {
        self.view.backgroundColor = UIColor.systemGroupedBackground
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.backgroundColor = UIColor.systemBackground
        self.tableView.tableFooterView = UIView()
    }
    
    private func updateLanguage() {
        self.title = "Settings"
    }
    
    private func loadData() {
        self.titles = SettingsType.allCases.filter { $0 != .combine && $0 != .swiftUI } // SettingsType.allCases
    }
}

// MARK: DataSource & Delegate
extension SettingsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
     
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.titles[indexPath.row].rawValue
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = self.titles[indexPath.row]
        self.coordinator?.preview(item: type)
    }
}
