//
//  Projects.swift
//  Timefy_WS
//
//  Created by Joel Broström on 2017-08-25.
//
//

import PerfectHTTP

public class Projects {
    // Container for array of type Project
    var data = [Project]()
    
    // Populating with a mock data object
    init(){
        data = [
            Project(id: "0001", name: "Save Sarah Conner"),
            Project(id: "0002", name: "Ping Skynet"),
            Project(id: "0003", name: "Help Kyle Reese"),
            Project(id: "0004", name: "Kill Marcus Wright")
        ]
    }
    
    // A simple JSON encoding function for listing data members.
    public func list() -> String {
        return toString()
    }
    
    //	// Accepts the HTTPRequest object and adds a new Project from post params.
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
            
            let new = Project(
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

