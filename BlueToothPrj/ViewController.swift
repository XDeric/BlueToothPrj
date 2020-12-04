//
//  ViewController.swift
//  BlueToothPrj
//
//  Created by EricM on 12/3/20.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.datasource = self
        fetchData()
    }
    
    var apiClient = ApiClient()
    var summaryData = [Country](){
        didSet{
            DispatchQueue.main.async {
                //self.tableview.reloadata
            }
        }
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

}

extension ViewController: CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        
        case .unknown:
            <#code#>
        case .resetting:
            <#code#>
        case .unsupported:
            <#code#>
        case .unauthorized:
            <#code#>
        case .poweredOff:
            <#code#>
        case .poweredOn:
            <#code#>
        @unknown default:
            <#code#>
        }
        
    }
    
    
}
