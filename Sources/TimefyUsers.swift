//
//  timeLog.swift
//  perfect_local
//
//  Created by Joel Broström on 2017-08-24.
//
//

import PerfectHTTP

public class TimefyUsers {
    // Container for array of type Person
    var data = [TimefyUser]()
    
    // Populating with a mock data object
    init(){
        data = [
            TimefyUser(id: "0001", email: "sarah.conner@mailinator.com", name: "Sarah Conner", password: "123456"),
            TimefyUser(id: "0002", email: "jane.smith@mailinator.com", name: "Jane Smith", password: "qwerty"),
            TimefyUser(id: "0003", email: "kyle.reese@mailinator.com", name: "Kyle Reese", password: "abcdefg", superuser: true),
            TimefyUser(id: "0004", email: "marcus.wright@mailinator.com", name: "Marcus Wright", password: "password"),
        ]
    }
    
    // A simple JSON encoding function for listing data members.
    // Ordinarily in an API list directive, cursor commands would be included.
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
                let email       = incoming["email"] as? String,
                let name        = incoming["name"] as? String,
                let password    = incoming["password"] as? String,
                let superuser   = incoming["superuser"] as? Bool
                else {fatalError("\nJSON does not conform to TimefyUser init\n)")}
            
            let new = TimefyUser(
                id: id,
                created: Int64(created),
                updated: Int64(updated),
                email: email,
                name: name,
                password: password,
                superuser: superuser
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

