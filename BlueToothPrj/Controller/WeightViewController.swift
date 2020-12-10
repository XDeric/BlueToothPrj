//
//  ViewController.swift
//  BlueToothPrj
//
//  Created by EricM on 12/3/20.
//

import UIKit
import CoreBluetooth

class WeightViewController: UIViewController {
    
    var apiClient = ApiClient()
    var summaryData = [Country](){
        didSet{
            DispatchQueue.main.async {
                //self.tableview.reloadata
            }
        }
    }
    
    enum Section {
        case main
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Int>
    
    struct Item: Hashable {
        let name: String
        let price: Double
        let identifier = UUID()
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(identifier)
        }
    }
    
    private var weightCollectionView: UICollectionView = {
        var wCV = UICollectionView()
        //wCV.datasource = self
        
        
        return wCV
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.datasource = self
        fetchData()
        setUpCollectionView
    }
    
    
    
    private func fetchData(){
        apiClient.fetchCovidData { [weak self] (result) in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let data):
                self?.summaryData = data
            }
        }
    }
    
    func setUpCollectionView(){
        
        weightCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(weightCollectionView)
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: weightCollectionView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: weightCollectionView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: weightCollectionView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: weightCollectionView.trailingAnchor),
        ])
    }
    
}

extension WeightViewController: CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        
        case .unknown:
            print("uknown")
        case .resetting:
            print("uknown")
        case .unsupported:
            print("uknown")
        case .unauthorized:
            print("uknown")
        case .poweredOff:
            print("uknown")
        case .poweredOn:
            print("uknown")
        @unknown default:
            print("uknown")
        }
        
    }
    
    
}
