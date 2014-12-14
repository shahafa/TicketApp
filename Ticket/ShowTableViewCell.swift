//
//  ShowTableViewCell.swift
//  Ticket
//
//  Created by Shahaf Shaked on 12/4/14.
//  Copyright (c) 2014 Ticket. All rights reserved.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var showDate: UILabel!
    @IBOutlet weak var showTime: UILabel!
    @IBOutlet weak var showLocation: UILabel!
    
    private var _show: Show? = nil
    var show: Show? {
        set {
            self._show = newValue
            self.showName.text = self._show?.name
            self.showDate.text = self._show?.date
            self.showTime.text = self._show?.time
            self.showLocation.text = self._show?.location
        }
        get {
            return self._show
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
