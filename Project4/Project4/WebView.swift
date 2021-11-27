//
//  WebView.swift
//  Project4
//
//  Created by Hyago Henrique on 26/11/21.
//

import UIKit

class WebView: UITableViewController {
    var websites = ["apple.com", "hackingwithswift.com"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "WebSites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Websites", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 16)
        return cell
    }

}