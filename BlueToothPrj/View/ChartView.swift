//
//  ChartSetup.swift
//  BlueToothPrj
//
//  Created by EricM on 12/27/20.
//

import Charts
import UIKit

class ChartView: UIView, ChartViewDelegate {
    
    var lineChart = LineChartView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        lineChart.delegate = self
        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(lineChart)
        
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: lineChart.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: lineChart.centerYAnchor),
        ])
        
    }
    var plots = [ChartDataEntry]()
    
    func setChartData(xaxis: Double, yaxis: Double){
        plots.append(ChartDataEntry(x: xaxis, y: yaxis))
        
        let set = LineChartDataSet(entries: plots)
        set.colors = ChartColorTemplates.material()
        let data = LineChartData(dataSet: set)
        lineChart.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
