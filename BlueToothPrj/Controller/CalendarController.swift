//
//  CalendarController.swift
//  BlueToothPrj
//
//  Created by EricM on 1/20/21.
//

import UIKit
import FSCalendar

class CalendarVC: UIViewController, FSCalendarDelegate {
    
    private var calendar: FSCalendar = {
        let cal = FSCalendar()
        
        
        return cal
    }()
    
    private lazy var nextView: UIButton = {
        let bt = UIButton()
        bt.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        bt.layer.cornerRadius = 5
        bt.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        bt.backgroundColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
        bt.setTitle("NextView", for: .normal)
        bt.isEnabled = true
        
        bt.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self if this viewcontroller
        calendar.delegate = self
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layoutSetup()
    }
    
    private func layoutSetup(){
        calendar.translatesAutoresizingMaskIntoConstraints = false
        nextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendar)
        view.addSubview(nextView)
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            calendar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            nextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    ///If nextView button gets tapped
    @objc private func didTapButton(){
        let weightVC = WeightViewController()
        weightVC.modalPresentationStyle = .fullScreen
        present(weightVC, animated: true)
    }
    
}
