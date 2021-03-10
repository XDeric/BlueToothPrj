//
//  SettingController.swift
//  BlueToothPrj
//
//  Created by EricM on 2/2/21.
//

import UIKit

class SettingController: UIViewController {
    
    private var settTableView = UITableView()
    var btData = [BTData]()
    
    enum Section {
        case main
    }
    //MARK: typealias datasource and snapshot
    typealias DataSourceTable = UITableViewDiffableDataSource<Section,BTData>
    typealias DatasourceSnapshotTable = NSDiffableDataSourceSnapshot<Section,BTData>
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
//        settTableView.translatesAutoresizingMaskIntoConstraints = false
        settTableView = UITableView(frame: view.bounds)
        settTableView.delegate = self
        settTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        settTableView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        view.addSubview(settTableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        // Do any additional setup after loading the view.
    }
    
    //MARK: Apply new changes
    private func applySnapshot(data: [BTData]){
//        snapshot = DatasourceSnapshot()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(data)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension SettingController: UITableViewDelegate{
    
}
