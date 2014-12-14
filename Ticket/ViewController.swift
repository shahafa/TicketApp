//
//  ViewController.swift
//  Ticket
//
//  Created by Shahaf Shaked on 12/4/14.
//  Copyright (c) 2014 Ticket. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var showTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showTable.delegate = self
        showTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShowList.instance.shows.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ShowTableViewCell = tableView.dequeueReusableCellWithIdentifier("ShowTableViewCell") as ShowTableViewCell
        
        cell.show = ShowList.instance.shows[indexPath.row]
        
        return cell
    }


}

