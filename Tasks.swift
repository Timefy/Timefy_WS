//
//  Tasks.swift
//  Timefy_WS
//
//  Created by Joel Broström on 2017-08-25.
//
//

import PerfectHTTP

public class Tasks {
    // Container for array of type Person
    var data = [Task]()
    
    // Populating with a mock data object
    init(){
        data = [
            Task(id: "0001", name: "Save Sarah Conner"),
            Task(id: "0002", name: "Get jacket and boots"),
            Task(id: "0003", name: "Help Kyle Reese"),
            Task(id: "0004", name: "Kill Marcus Wright")
        ]
    }
    
    // A simple JSON encoding function for listing data members.
    public func list() -> String {
        return toString()
    }
    
    //	// Accepts the HTTPRequest object and adds a new Person from post params.
    //	public func add(_ request: HTTPRequest) -> String {
    //		let new = Person(
    //			firstName: request.param(name: "firstName")!,
    //			lastName: request.param(name: "lastName")!,
    //			email: request.param(name: "email")!
    //		)
    //		data.append(new)
    //		return toString()
    //	}
    
    // Accepts raw JSON string, to be converted to JSON and consumed.
    public func add(_ json: String) -> String {
        do {
            let incoming = try json.jsonDecode() as! [String: Any]
            
            guard let id        = incoming["id"] as? String,
                let created     = incoming["created"] as? Int,
                let updated     = incoming["updated"] as? Int,
                let name        = incoming["name"] as? String
                else {fatalError("\nJSON does not conform to TimefyUser init\n)")}
            
            let new = Task(
                id: id,
                created: Int64(created),
                updated: Int64(updated),
                name: name
            )
            data.append(new)
        } catch {
            return "ERROR"
        }
        return toString()
    }
    
    
    // Convenient encoding method that returns a string from JSON objects.
    private func toString() -> String {
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


