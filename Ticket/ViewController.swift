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
    @IBOutlet weak var showTableActivityIndicator: UIActivityIndicatorView!
    
    var showList = [Show]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showTable.delegate = self
        showTable.dataSource = self
        
        loadShowList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ShowTableViewCell = tableView.dequeueReusableCellWithIdentifier("ShowTableViewCell") as ShowTableViewCell
        
        var myCell = showList[indexPath.row]
        cell.setShow(showList[indexPath.row])
        
        return cell
    }

    func loadShowList() {
        let url : String = "http://ticket-web-service.herokuapp.com/shows/"
        
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!) { data, response, error in
            var err: NSError?
            
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
            if(err == nil) {
                let results: NSArray = jsonResult["results"] as NSArray
                for showResult in jsonResult["results"] as NSArray {
                    
                    let show = Show(name: showResult["name"] as String, date: showResult["date"] as String, time: showResult["time"] as String, location: showResult["location"] as String, showDescription: "", imageUrl: showResult["imageUrl"] as String)
                    
                    self.showList.append(show)
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    () -> Void in
                    self.showTableActivityIndicator.stopAnimating()
                    self.showTable.reloadData()
                }
            }
        }.resume()
    }

}

