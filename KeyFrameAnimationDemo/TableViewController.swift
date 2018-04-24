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
        
        title = "Animations"
    }

    // MARK: - Table view data source
    
    private var vcs: [[String : String]] {
        get {
            return [["title" : "Background color", "vc" : "BackgroundColorVC"],
                    ["title" : "Path", "vc" : "PathVC"]]
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vcs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = vcs[indexPath.row]["title"]
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let clazz = classFrom(vcs[indexPath.row]["vc"]!) as! UIViewController.Type
        navigationController?.pushViewController(clazz.init(), animated: true)
    }

    func classFrom(_ string: String) -> AnyClass? {
        if let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return NSClassFromString("\(name).\(string)")
        }
        return NSClassFromString(string)
    }
}

