//
//  TempTableViewCell.swift
//  TableViewExample
//
//  Created by iot-parksooseong on 2023/02/09.
//

import UIKit

protocol TempTableViewCellDelegate: AnyObject {
    func TempTableViewCell_switchIsOn(_ row: Int, _ isOn: Bool)
}

class TempTableViewCell: UITableViewCell {
    @IBOutlet var lblText: UILabel!
    @IBOutlet var swTemp: UISwitch!
    
    var row = 0
    
    weak var delegate: TempTableViewCellDelegate?
    
    @IBAction func valueChangedSwTemp(_ sender: UISwitch) {
        delegate?.TempTableViewCell_switchIsOn(row, sender.isOn)
        // 2.delegating(ViewController)에다가 몇번째 셀이 선택되었는지를 알림
        print(#function)
        print(row)
    }
}
