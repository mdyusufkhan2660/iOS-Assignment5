//
//  ProfileTableViewCell.swift
//  Assignment5
//
//  Created by Yusuf Khan on 2022-12-05.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    static let identifier = "ProfileTableViewCell"
    
    private let iconContainer : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 60
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let statusLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(statusLabel)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imgView.image = UIImage(systemName: "qrcode")!
        
        accessoryView = imgView
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size : CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize : CGFloat = size
        iconImageView.frame = CGRect(x: (size - imageSize)/2, y: (size - imageSize)/2, width: imageSize, height: imageSize)
        
        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: -15,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
        
        statusLabel.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 10,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        statusLabel.text = nil
        iconContainer.backgroundColor = nil
    }
    
    public func configure(with model : ProfileOption) {
        statusLabel.text = model.status
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
}
