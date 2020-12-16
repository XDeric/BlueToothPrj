//
//  WeightCell.swift
//  BlueToothPrj
//
//  Created by EricM on 12/6/20.
//

import Foundation
import UIKit

class WeightCell: UICollectionViewCell{
    
    static var cellIdentifier = "wCell"
    
    weak var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let textLabel = UILabel(frame: .zero)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        textLabel.backgroundColor = .white
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
        ])
        self.textLabel = textLabel
        //self.reset()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Performs any clean up necessary to prepare the view for use again.
    override func prepareForReuse() {
        super.prepareForReuse()
        //self.reset()
    }
    
    func reset() {
        self.textLabel.textAlignment = .center
    }
    
}
