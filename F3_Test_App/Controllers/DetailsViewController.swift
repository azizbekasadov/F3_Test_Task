//
//  DetailsViewController.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 10/02/21.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet private weak var headerContainerView: UIView!
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorsLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var data: ResultsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureUI()
        self.loadData()
    }
    
    private func configureUI() {
        self.titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        self.authorsLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        self.descriptionLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        
        self.thumbnailImageView.layer.cornerRadius = 6
        self.thumbnailImageView.layer.borderWidth = 0.5
        self.thumbnailImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func loadData() {
        if let imageURL = self.data.image {
            self.thumbnailImageView.sd_setImage(with: URL(string: imageURL), completed: nil)
        }
        
        self.titleLabel.text = self.data.title
        self.authorsLabel.text = self.data.authors
        self.descriptionLabel.text = self.data.description
    }
}
