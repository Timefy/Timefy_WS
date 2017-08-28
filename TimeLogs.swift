//
//  TimeLogs.swift
//  Timefy_WS
//
//  Created by Joel Broström on 2017-08-28.
//
//

import Foundation
import  PerfectHTTP

public class TimeLogs {
    // Container for array of type Client
    var data = [TimeLog]()
    
    // Populating with a mock data object
    init(){
        
        //Mock data
        let c1 = Client(id: "0001", name: "Jhon Connor")
        let c2 = Client(id: "0002", name: "Skynet")
        let c3 = Client(id: "0003", name: "US.gov")
        let c4 = Client(id: "0004", name: "Kyle Reese")
        
        let p1 = Project(id: "0001", name: "Save Sarah Conner")
        let p2 = Project(id: "0002", name: "Ddos Skynet")
        let p3 = Project(id: "0003", name: "Babysit Jhon")
        let p4 = Project(id: "0004", name: "Kill Marcus Wright")
        
        let t1 = Task(id: "0001", name: "Buy roses")
        let t2 = Task(id: "0002", name: "Get jacket and boots")
        let t3 = Task(id: "0003", name: "Ping skynet")
        let t4 = Task(id: "0004", name: "Buy dry ice")
        
        let d1 = "2000-01-31"
        let d2 = "1991-04-01"
        let d3 = "1991-11-13"
        let d4 = "2021-04-01"

        
        
        data = [
            TimeLog(client: c1, project: p1, task: t1, dateString: d1),
            TimeLog(client: c2, project: p2, task: t2, dateString: d2),
            TimeLog(client: c3, project: p3, task: t3, dateString: d3),
            TimeLog(client: c4, project: p4, task: t4, dateString: d4)
        ]
    }
    
    // A simple JSON encoding function for listing data members.
    public func list() -> String {
        print("list start")
        return toString()
    }
    
    

// Accepts raw JSON string, to be converted to JSON and consumed.
    
public func add(_ json: String) -> String {
    
    do {
        let incoming = try json.jsonDecode() as! [String: Any]
        guard let id        = incoming["id"]        as? String,
            let created     = incoming["created"]   as? Int,
            let updated     = incoming["updated"]   as? Int,
            let name        = incoming["name"]      as? String,
            let clientJson  = incoming["client"]    as? [String: Any],
            let projectJson = incoming["project"]   as? [String: Any],
            let taskJson    = incoming["task"]      as? [String: Any],
            let dateString  = incoming["dateString"] as? String
 //           let date        = incoming["date"]      as? Date
            else {fatalError("\nJSON does not conform to TimefyUser init\n)")}
        
        var client = Client(), project = Project(), task = Task()
        
        
        let objectArray = [clientJson, projectJson, taskJson]
        
        
        
        for (index, n) in objectArray.enumerated() {
            var id = ""
            var created = 0
            var updated = 0
            var name = ""
            for (key, value) in n {
                switch key {
                case "id":
                    id = value as! String
                case "created":
                    created = value as! Int
                case "updated":
                    updated = value as! Int
                case "name":
                    name = value as! String
                default:
                    break
                }
            }
            switch index {
            case 0:
               client = Client(id: id, created: Int64(created), updated: Int64(updated), name: name)
            case 1:
                project = Project(id: id, created: Int64(created), updated: Int64(updated), name: name)
            case 2:
               task = Task(id: id, created: Int64(created), updated: Int64(updated), name: name)
            default:
                print("No bueno")
            }
        }
            
            
        

        let new = TimeLog(
            id:         id,
            created:    Int64(created),
            updated:    Int64(updated),
            name:       name,
            client:     client,
            project:    project,
            task:       task,
            dateString: dateString
//            date:       date
        )
        data.append(new)
    } catch {
        return "ERROR"
    }
    return toString()
}


// Convenient encoding method that returns a string from JSON objects.
private func toString() -> String {
    print("toSring start")
    var out = [String]()
    
    for m in self.data {
        do {
            out.append(try m.jsonEncodedString())
        } catch {
            print(error)
        }
    }
    return "[\(out.joined(separator: ","))]"
}

}
