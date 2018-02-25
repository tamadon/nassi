//
//  MilkListViewController.swift
//  nassi
//
//  Created by Hideaki Tamai on 2017/08/12.
//  Copyright © 2017年 tamadon. All rights reserved.
//

import UIKit

class MilkListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var headerView: UIView!

    let milkAmounts = ["60", "80", "100", "120", "140", "160", "180", "200"]

    override func viewDidLoad() {
        tableView.tableHeaderView = headerView
    }

    @IBAction func onTapCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MilkListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(milkAmounts[indexPath.row]) ml"

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return milkAmounts.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let params = ["username": "ミルク", "text": "bot: \(milkAmounts[indexPath.row]) ml :tanonda:", "icon_emoji": ":baby_bottle:"]
        let api = API(parameters: params)
        api.request(success: { _ in }, fail: { _ in })
        self.dismiss(animated: true, completion: nil)

    }
}

extension MilkListViewController: UITableViewDataSource {
    
}
