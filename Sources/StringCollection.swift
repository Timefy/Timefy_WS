//
//  StringCollection.swift
//  perfect_local
//
//  Created by Joel Broström on 2017-08-24.
//
//

import Foundation


//    enum _URI {
//        enum user {
//            case list
//            case individual
//            var json
//        }
//    }
// return append(self.value)- ish

    struct URI {
        static let root = "/"
        static let users = "users"
        static let tasks = "tasks"
        static let projects = "project"
        static let usersJson = "users/json"
        static let tasksJson = "tasks/json"
        static let projectsJson = "projects/json"
    }
    
    struct ContentType {
        static let JasonApplication = "application/json"
    }
    
    struct Text {
        static let htmlText = "text/html"
        static let helloWorld = "<html><title>Hello, world!</title><body>Hello, world!</body></html>"
    }
    



