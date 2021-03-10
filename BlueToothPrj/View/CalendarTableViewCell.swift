//
//  CalendarTableViewCell.swift
//  BlueToothPrj
//
//  Created by EricM on 1/29/21.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
    static var cellIdentifier = "calTCell"
    
    lazy var productImage : UIImageView = {
        //will change image
        let imgView = UIImageView(image: UIImage(named: "noPic"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    lazy var label: UILabel = {
        let lab = UILabel()
         lab.font = UIFont.boldSystemFont(ofSize: 16)
         lab.textAlignment = .left
         lab.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
         return lab
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(){
        label.translatesAutoresizingMaskIntoConstraints = false
        productImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        addSubview(productImage)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
            label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            
//            productImage.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor),
            productImage.leftAnchor.constraint(equalTo: label.rightAnchor),
            productImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            productImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
