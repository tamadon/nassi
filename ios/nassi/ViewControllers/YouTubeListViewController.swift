//
//  YouTubeListViewController.swift
//  nassi
//
//  Created by Hideaki Tamai on 2017/08/07.
//  Copyright © 2017年 tamadon. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class YouTubeListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let contentsIds = ["apDyPp3tF7Q", "FKULMh0L8DM"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension YouTubeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "youTubeContentsCell", for: indexPath)
        let playerView = cell.viewWithTag(1) as! YTPlayerView
        playerView.load(withVideoId: contentsIds[indexPath.row])
        
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsIds.count
    }
}

extension YouTubeListViewController: UITableViewDataSource {

}
