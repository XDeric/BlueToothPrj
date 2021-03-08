//
//  SettingController.swift
//  BlueToothPrj
//
//  Created by EricM on 2/2/21.
//

import UIKit

class SettingController: UIViewController {
    
    private var setTableView = UITableView()
    
    enum Section {
        case main
    }
    //MARK: typealias datasource and snapshot
    typealias DataSourceTable = UITableViewDiffableDataSource<Section,SavedWeightData>
    typealias DatasourceSnapshotTable = NSDiffableDataSourceSnapshot<Section,SavedWeightData>
    private var dataSource: DataSourceTable!
    private var snapshot = DatasourceSnapshotTable()
    
    lazy var back: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
    
    @objc func btnPressed(){
        print("pressed")
        
    }
    
    private func setupConstraints(){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        // Do any additional setup after loading the view.
    }
}
