//
//  ShowTableViewCell.swift
//  Ticket
//
//  Created by Shahaf Shaked on 12/4/14.
//  Copyright (c) 2014 Ticket. All rights reserved.
//

import UIKit

private var observationContext = 0

class ShowTableViewCell: UITableViewCell {

    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var showDate: UILabel!
    @IBOutlet weak var showTime: UILabel!
    @IBOutlet weak var showLocation: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    
    private var show: Show? = nil
    
    func setShow(show: Show) {
        self.show = show
        startObservingShow(show)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func startObservingShow(show: Show) {
        let options = NSKeyValueObservingOptions.Initial | NSKeyValueObservingOptions.New
        
        show.addObserver(self, forKeyPath: "name", options: options, context: &observationContext)
        show.addObserver(self, forKeyPath: "date", options: options, context: &observationContext)
        show.addObserver(self, forKeyPath: "time", options: options, context: &observationContext)
        show.addObserver(self, forKeyPath: "location", options: options, context: &observationContext)
        show.addObserver(self, forKeyPath: "image", options: options, context: &observationContext)
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        
        if context == &observationContext {
            
            switch keyPath {
                case "name":
                    self.showName.text = (object as Show).name
                case "date":
                    self.showDate.text = (object as Show).date
                case "time":
                    self.showTime.text = (object as Show).time
                case "location":
                    self.showLocation.text = (object as Show).location
                case "image":
                    if ((object as Show).image != nil) {
                        self.showImage.image = (object as Show).image
                    }
                default:
                    var str = "do nothing"
            }
        }
    }
}
