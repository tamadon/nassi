//
//  EventViewController.swift
//  nassi
//
//  Created by Hideaki Tamai on 2017/08/06.
//  Copyright © 2017年 tamadon. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let slackBarbuttonItem = UIBarButtonItem(image: UIImage.Asset.ic_chat_bubble_outline_36pt, style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.tapSlackBarButtonItem(sender:)))
        let spreadsheetBarbuttonItem = UIBarButtonItem(image: UIImage.Asset.ic_grid_on_36pt, style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.tapSpreadsheetBarButtonItem(sender:)))

        let uiBarButtonItems: NSArray = [slackBarbuttonItem, spreadsheetBarbuttonItem]

        self.navigationItem.setRightBarButtonItems((uiBarButtonItems as! [UIBarButtonItem]), animated: true)
    }

    // MARK: IBAction
    @IBAction func tapPoopButton(_ sender: Any) {
        let params1 = ["username": "うんち", "text": "bot: :tanonda:", "icon_emoji": ":poop:"]
        let api1 = API(parameters: params1)
        api1.request(success: { (data: Dictionary) in debugPrint(data) }, fail: { (error: Error?) in print(error ?? "fail") })
        let params2 = ["username": "しっこ", "text": "bot: :tanonda:", "icon_emoji": ":sweat_drops:"]
        let api2 = API(parameters: params2)
        api2.request(success: { (data: Dictionary) in debugPrint(data) }, fail: { (error: Error?) in print(error ?? "fail") })
    }

    @IBAction func tapSweatDropsButton(_ sender: Any) {
        let params = ["username": "しっこ", "text": "bot: :tanonda:", "icon_emoji": ":sweat_drops:"]
        let api = API(parameters: params)
        api.request(success: { (data: Dictionary) in debugPrint(data) }, fail: { (error: Error?) in print(error ?? "fail") })
    }

    @IBAction func tapRightBreastFeedingButton(_ sender: Any) {
        let params = ["username": "母乳右", "text": "bot: :tanonda:", "icon_emoji": ":ok_woman:"]
        let api = API(parameters: params)
        api.request(success: { (data: Dictionary) in debugPrint(data) }, fail: { (error: Error?) in print(error ?? "fail") })
    }

    @IBAction func tapLeftBreastFeedingButton(_ sender: Any) {
        let params = ["username": "母乳左", "text": "bot: :tanonda:", "icon_emoji": ":ok_woman:"]
        let api = API(parameters: params)
        api.request(success: { (data: Dictionary) in debugPrint(data) }, fail: { (error: Error?) in print(error ?? "fail") })
    }

    @IBAction func tapBabyBottle80mlButton(_ sender: Any) {
        let viewController = MilkListViewController.initialViewController()
        present(viewController, animated: true, completion: nil)
    }

    @objc private func tapSlackBarButtonItem(sender: UIButton){
        let env = ProcessInfo.processInfo.environment
        self.openURLScheme(env[Const.envSlackUrlSchime]!)
    }

    @objc private func tapSpreadsheetBarButtonItem(sender: UIButton){
        let env = ProcessInfo.processInfo.environment
        self.openURLScheme(env[Const.envSpreadSheetURLScheme]!)
    }

    private func openURLScheme(_ scheme: String) {
        let encodedScheme = scheme.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url: URL! = URL(string: encodedScheme!)
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("failed to open..")
        }
    }
}
