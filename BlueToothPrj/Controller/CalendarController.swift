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
    
    enum Section {
        case main
    }
    //MARK: typealias datasource and snapshot
    typealias DataSource = UITableViewDiffableDataSource<Section,SavedWeightData>
    typealias DatasourceSnapshot = NSDiffableDataSourceSnapshot<Section,SavedWeightData>
    private var dataSource: DataSource!
    private var snapshot = DatasourceSnapshot()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self if this viewcontroller
        calendar.delegate = self
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        calendarSetup()
        tableViewSetup()
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
        calTableView.backgroundColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
        calTableView.delegate = self
        view.addSubview(calTableView)
        
        NSLayoutConstraint.activate([
            calTableView.topAnchor.constraint(equalTo: calendar.bottomAnchor),
            calTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            calTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            calTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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

extension CalendarVC: UITableViewDelegate{}
