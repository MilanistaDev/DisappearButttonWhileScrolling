//
//  ViewController.swift
//  ScrollButtton
//
//  Created by Takuya Aso on 2019/08/10.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.bottomButton.alpha = 0.0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.bottomButton.alpha = 1.0
    }
}

extension ViewController: UITableViewDelegate {
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
}
