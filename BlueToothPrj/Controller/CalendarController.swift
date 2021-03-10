//
//  CalendarController.swift
//  BlueToothPrj
//
//  Created by EricM on 1/20/21.
//

import UIKit
import FSCalendar

class CalendarVC: UIViewController, FSCalendarDelegate, FSCalendarDataSource{
    
    private var calendar = FSCalendar()
    private var calTableView = UITableView()
    private var selectSavedData = [SavedWeightData](){
        didSet{
            applySnapshot(weight: selectSavedData)
        }
    }
    
    enum Section {
        case main
    }
    //MARK: typealias datasource and snapshot
    typealias DataSourceTable = UITableViewDiffableDataSource<Section,SavedWeightData>
    typealias DatasourceSnapshotTable = NSDiffableDataSourceSnapshot<Section,SavedWeightData>
    private var dataSource: DataSourceTable!
    private var snapshot = DatasourceSnapshotTable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self if this viewcontroller
        calendar.delegate = self
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        calendarSetup()
        tableViewSetup() //setup cell
        configureTableViewDatasource() //
        selectLoad()
        twoTaps()
    }
    
    private func calendarSetup(){
        calendar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendar)
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            calendar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
        ])
    }
    
    private func tableViewSetup(){
        calTableView.translatesAutoresizingMaskIntoConstraints = false
        calTableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        calTableView.delegate = self
        calTableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: "calTCell")
//        calTableView.register(UITableViewCell.self, forCellReuseIdentifier: "calTCell")
        view.addSubview(calTableView)
        
        NSLayoutConstraint.activate([
            calTableView.topAnchor.constraint(equalTo: calendar.bottomAnchor),
            calTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            calTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            calTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureTableViewDatasource(){
        dataSource = DataSourceTable(tableView: calTableView, cellProvider: { (tableView, indexPath, weight) -> UITableViewCell? in
            let calCell = tableView.dequeueReusableCell(withIdentifier: "calTCell", for: indexPath) as? CalendarTableViewCell
            calCell?.label.text = ("Weight: \(weight.lbs)")
//            calCell.textLabel?.text = ("Weight: \(weight.lbs)")
            
            return calCell
        })
    }
    
    private func selectLoad(){
        do{
            try selectSavedData = SaveWeight.saveManager.getWeight()
        }catch{
            fatalError()//.localizedDescription
        }
    }
    
    private func applySnapshot(weight: [SavedWeightData]){
        snapshot.appendSections([Section.main])
        snapshot.appendItems(weight, toSection: .main)
        //print(snapshot.numberOfItems)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func twoTaps(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
            tap.numberOfTapsRequired = 2
            calendar.addGestureRecognizer(tap)
    }
    @objc func doubleTapped() {
        let weightVC = WeightViewController()
        self.navigationController?.pushViewController(weightVC, animated: true)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("selected")
    }
    
}

extension CalendarVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
