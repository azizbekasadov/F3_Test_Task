//
//  SearchTableViewController.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import UIKit

fileprivate let cellid: String = "\(ResultsTableViewCell.self)"

class SearchTableViewController: UITableViewController, AlertProtocol {

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.showsSearchResultsController = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.definesPresentationContext = false
        searchController.automaticallyShowsScopeBar = false
        searchController.automaticallyShowsSearchResultsController = false
        searchController.automaticallyShowsCancelButton = true
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        return searchController
    }()
    
    private let searchService: SearchService = SearchService()
    
    weak var coordinator: MainCoordinator?
    
    private var results: [ResultsViewModel]?
    private var response: Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateLanguage()
        self.configureUI()
    }
    
    // MARK: Language
    private func updateLanguage() {
        self.title = "Library"
    }
    
    // MARK: UI
    private func configureUI() {
        self.tableView.register(UINib(nibName: cellid, bundle: nil), forCellReuseIdentifier: cellid)
        self.tableView.estimatedRowHeight = 130
        self.tableView.tableFooterView = UIView()
        
        self.navigationItem.searchController = self.searchController
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configure(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! ResultsTableViewCell
        cell.data = self.results?[indexPath.row]
        return cell
    }
    
    // MARK: Load data
    private func loadData(searchText: String) {
        self.searchService.getResults(searchText: searchText) { [weak self] (results, errorMessage) in
            if let results = results {
                self?.response = results
                self?.results = results.items?.map { ResultsViewModel(result: $0) }
                self?.tableView.reloadData()
            }
            
            if !errorMessage.isEmpty {
                self?.showErrorMessage(message: "Search error: " + errorMessage)
            }
        }
    }
    
    private func emptyContainers() {
        self.results?.removeAll()
        self.response = nil
        self.tableView.reloadData()
    }
}

// MARK: DataSource & Delegate
extension SearchTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.configure(tableView, cellForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let scale = UIScreen.main.bounds.size.width/375.0
        return scale > 1 ? 130 * scale : 130
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

extension SearchTableViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            self.emptyContainers()
            return
        }
        self.loadData(searchText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            self.emptyContainers()
            return
        }
        self.loadData(searchText: searchText)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.emptyContainers()
    }
    
}
