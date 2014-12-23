//
//  Show.swift
//  Ticket
//
//  Created by Shahaf Shaked on 12/13/14.
//  Copyright (c) 2014 Ticket. All rights reserved.
//

import UIKit

class Show: NSObject {
    
    dynamic var name: String
    dynamic var date: String
    dynamic var time: String
    dynamic var location: String
    dynamic var showDescription: String
    dynamic var imageUrl: String
    dynamic var image: UIImage?
    
    
    init(name: String, date: String, time: String, location: String, showDescription: String, imageUrl: String) {
        self.name = name
        self.date = date
        self.time = time
        self.location = location
        self.showDescription = showDescription
        self.imageUrl = imageUrl
        self.image = nil
        
        super.init()
        
        loadImageFromUrl(imageUrl)
    }
    
    
    func loadImageFromUrl(url: String) {
        var imageUrl = NSURL(string: url)
        var request = NSURLRequest(URL: imageUrl!)
        var requestQueue : NSOperationQueue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request, queue: requestQueue, completionHandler:
            {(response: NSURLResponse!, responseData: NSData!, error: NSError!) -> Void in
                if (error == nil) {
                    dispatch_async(dispatch_get_main_queue()) {
                        () -> Void in
                        self.image = UIImage(data: responseData)!
                    }
                }
        })
    }
}