//
//  ResultsTableViewCell.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 07/02/21.
//

import UIKit
import SDWebImage

class ResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var data: ResultsViewModel! {
        didSet {
            self.titleLabel.text = self.data.title
            self.authorLabel.text = self.data.authors
            
            if let imageName = self.data.image {
                self.thumbnailImageView.sd_imageTransition = .fade
                self.thumbnailImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
                self.thumbnailImageView.sd_setImage(with: URL(string: imageName), completed: nil)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.updateColors(state: selected)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: true)
        self.updateColors(state: highlighted)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.updateColors()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureLayers()
    }
    
    private func configureUI() {
        self.titleLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        self.authorLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        
        self.updateColors()
    }
    
    private func configureLayers() {
        self.thumbnailImageView.layer.cornerRadius = 6
        self.thumbnailImageView.layer.borderWidth = 0.5
        self.thumbnailImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc private func updateColors(state: Bool = false) {
        self.titleLabel.textColor = state ? UIColor.white : UIColor.systemGray
        self.authorLabel.textColor = state ? UIColor.white : UIColor.systemGray3
        self.contentView.backgroundColor = state ? UIColor.systemBlue : UIColor.systemBackground
    }
    
}
