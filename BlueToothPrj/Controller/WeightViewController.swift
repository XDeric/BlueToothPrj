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
    
    var cbManager: CBCentralManager!
    var weightData = [Weight](){
        didSet{
            applySnapshot(weight: weightData)
        }
    }
    
    var exampleData = Weight.init(weight: 6)
    var exampleData2 = Weight.init(weight: 5)
    var exampleData3 = Weight.init(weight: 7)
//    var test: [Weight] = [exampleData.self,exampleData2.self,exampleData.self]
    
    enum Section {
        case main
    }
    
    //MARK: typealias datasource and snapshot
    typealias DataSource = UICollectionViewDiffableDataSource<Section,Weight>
    typealias DatasourceSnapshot = NSDiffableDataSourceSnapshot<Section,Weight>
    private var dataSource: DataSource!
    private var snapshot = DatasourceSnapshot()
    
    
    //Mark: Weight CollectionView
    private var weightCollectionView: UICollectionView!
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchData()
        collectionViewSetup()
        configureDatasource()
        applySnapshot(weight: [exampleData,exampleData2,exampleData3])
        //cbManager = CBCentralManager(delegate: self, queue: nil, options: .none)
    }
    
    private func collectionLayout()-> UICollectionViewLayout{
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(75))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        
        //layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    private func collectionViewSetup(){
        weightCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionLayout())
        weightCollectionView.delegate = self
        weightCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        weightCollectionView.backgroundColor = .systemRed
        weightCollectionView.register(WeightCell.self, forCellWithReuseIdentifier: WeightCell.cellIdentifier)
        view.addSubview(weightCollectionView)
    }
    
    private func configureDatasource(){
        dataSource = DataSource(collectionView: weightCollectionView, cellProvider: { (collectionView, indexPath, weight) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeightCell.cellIdentifier, for: indexPath) as! WeightCell
            
            cell.textLabel.text = "test"
            
            cell.reset()
            
            return cell
        })
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
    
    //apply new changes
    private func applySnapshot(weight: [Weight]){
        snapshot = DatasourceSnapshot()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(weight)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}



extension WeightViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let weight = dataSource.itemIdentifier(for: indexPath) else {return}
        print(weight.time)
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
