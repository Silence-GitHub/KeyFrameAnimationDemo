//
//  TableViewController.swift
//  KeyFrameAnimation
//
//  Created by Kaibo Lu on 2017/2/12.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    
    private let titles: [String] = ["Background color", "Path", "Emitter"]
    
    private var vcs: [UIViewController] {
        get {
            return [BackgroundColorVC(), PathVC(), EmitterVC()]
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(vcs[indexPath.row], animated: true)
    }

}

