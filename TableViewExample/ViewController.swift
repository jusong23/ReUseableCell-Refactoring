//
//  ViewController.swift
//  TableViewExample
//
//  Created by iot-parksooseong on 2023/02/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tvTemp: UITableView!
    
    private lazy var arrTempModel = {
        var arr = [TempModel]()
        for i in 0..<100 {
            arr.append(TempModel(text: "\(i+1)", isOn: false))
        }
        return arr
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTempModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "TempTableViewCell") as? TempTableViewCell) ?? TempTableViewCell(style: .default, reuseIdentifier: "TempTableViewCell")
        let tempModel = arrTempModel[indexPath.row]
        cell.lblText.text = tempModel.text
        
        cell.swTemp.setOn(tempModel.isOn, animated: false)
        // (Lifecycle) 저장된 모델의 값으로 초기화
        cell.row = indexPath.row
        // (Lifecycle) cell 내의 변수 row에다가 ViewController의 indexPath.row를 집어넣어줌
        
        cell.delegate = self
        return cell
    }
}

extension ViewController: TempTableViewCellDelegate {
    func TempTableViewCell_switchIsOn(_ row: Int, _ isOn: Bool) {
        print(#function)
        print(row)
        arrTempModel[row].isOn = isOn
        // 1. 셀이 선택되면 모델의 값이 변경
    }
}
