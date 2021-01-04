//
//  ViewController.swift
//  BlueToothPrj
//
//  Created by EricM on 12/3/20.
//
import UIKit
import Charts
import CoreBluetooth


class WeightViewController: UIViewController {
    
    //MARK: Properties
    var apiClient = ApiClient()
    var summaryData = [Country](){
        didSet{
            DispatchQueue.main.async {
                //self.tableview.reloadata
            }
        }
    }
    
    var cbManager: CBCentralManager!
//    var weightData = [Weight](){
//        didSet{
//            applySnapshot(weight: weightData)
//        }
//    }
    var newData = [Weighted](){
        didSet{
            applySnapshot(weight: newData)
        }
    }
    
    //views
    private var weightCollectionView: UICollectionView!
    private var myChartView = LineChartView()
    
    
//    var exampleData = Weight.init(weight: 6)
//    var exampleData2 = Weight.init(weight: 5)
//    var exampleData3 = Weight.init(weight: 7)
    
    
    // sections for collection view
    enum Section {
        case main
    }
    
    //MARK: typealias datasource and snapshot
    typealias DataSource = UICollectionViewDiffableDataSource<Section,Weighted>
    typealias DatasourceSnapshot = NSDiffableDataSourceSnapshot<Section,Weighted>
    private var dataSource: DataSource!
    private var snapshot = DatasourceSnapshot()
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchData()
        collectionViewSetup()
        configureDatasource()
        loadData()
        //applySnapshot(weight: [exampleData,exampleData2,exampleData3])
        //   cbManager = CBCentralManager(delegate: self, queue: nil, options: .none) //bluetooth on device don't work on simulation
        lineViewChartSetup()
    }
    
    //MARK: Chart View Setup
    private func lineViewChartSetup(){
        myChartView.delegate = self
        view.addSubview(myChartView)
        myChartView.pinchZoomEnabled = true
        myChartView.translatesAutoresizingMaskIntoConstraints = false
        myChartView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        myChartView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        myChartView.frame = CGRect(x: view.frame.size.width, y: view.frame.size.width, width: 100, height: 100)
        
        NSLayoutConstraint.activate([
            myChartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myChartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myChartView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            myChartView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myChartView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        for x in newData{
            setChartData(xaxis: Double(x.id), yaxis: Double(x.lbs))
        }
    }
    
    var plots = [ChartDataEntry]()
    
    func setChartData(xaxis: Double, yaxis: Double){
        plots.append(ChartDataEntry(x: xaxis, y: yaxis))
        
        let set = LineChartDataSet(entries: plots)
        set.colors = ChartColorTemplates.joyful()
        let data = LineChartData(dataSet: set)
        myChartView.data = data
    }
    
    //MARK: collection view Setup
    private func collectionViewSetup(){
        weightCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionLayout())
        weightCollectionView.delegate = self
        weightCollectionView.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        weightCollectionView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        weightCollectionView.register(WeightCell.self, forCellWithReuseIdentifier: WeightCell.cellIdentifier)
        view.addSubview(weightCollectionView)
    }
    
    //MARK: Layout of collectionView
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
    
    private func configureDatasource(){
        dataSource = DataSource(collectionView: weightCollectionView, cellProvider: { (collectionView, indexPath, weight) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeightCell.cellIdentifier, for: indexPath) as! WeightCell
            
            cell.textLabel.text = "test"
            //            cell.reset()
            
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
    
    private func loadData(){
        // just the string for the name of the file
        guard let pathToJSONFile =
                Bundle.main.path(forResource: "JsonTestData", ofType: "json") else {fatalError("couldn't Find json file")}
        print(pathToJSONFile)
        // is a reference to the ctual location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do{
            let data = try Data(contentsOf: url)
            newData = try WeightData.getWeights(from: data).weight
            // if either try fails the catch will catch both of them
        } catch{
            fatalError("couldn't get weight from JSON")
        }
    }
    
    //MARK: Apply new changes
    private func applySnapshot(weight: [Weighted]){
        snapshot = DatasourceSnapshot()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(weight)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}


//MARK: Extensions
extension WeightViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let weight = dataSource.itemIdentifier(for: indexPath) else {return}
        print(weight.lbs)
    }
    
}

extension WeightViewController: ChartViewDelegate{}


extension WeightViewController: CBCentralManagerDelegate{
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        
        case .unknown:
            print("uknown")
        case .resetting:
            print("resetting")
        case .unsupported:
            print("unsupported")
        case .unauthorized:
            print("unauthorized")
        case .poweredOff:
            print("powered off")
        case .poweredOn:
            print("powered on")
            cbManager.scanForPeripherals(withServices: nil)
        @unknown default:
            print("default")
        }
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(peripheral)
    }
    
}


