//
//  ShowList.swift
//  Ticket
//
//  Created by Shahaf Shaked on 12/13/14.
//  Copyright (c) 2014 Ticket. All rights reserved.
//

import Foundation

class ShowList {
    
    var shows = [Show]()
    
    init() {
        var show1 = Show(name: "Wicked", date: "", time: "", location: "", description: "", image: "")
        shows.append(show1)
        
        var show2 = Show(name: "The Lion King", date: "", time: "", location: "", description: "", image: "")
        shows.append(show2)
    }
    
    class var instance :ShowList {
        struct Singleton {
            static let instance = ShowList()
        }
        
        return Singleton.instance
    }
}