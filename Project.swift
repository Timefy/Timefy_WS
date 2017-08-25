//
//  Project.swift
//  Timefy_WS
//
//  Created by Joel Broström on 2017-08-25.
//
//

import PerfectLib

class Project : JSONConvertibleObject {
    
    static let registerName = "project"
    
        var id: String = ""
        var created: Int64 = 0
        var updated: Int64 = 0
        var name: String = ""
        //var client: Client?

    
    
    init(id: String = "", created: Int64 = 0, updated: Int64 = 0, name: String = "") {
        self.id         = id
        self.created    = created
        self.updated    = updated
        self.name       = name
    }
    
    override public func setJSONValues(_ values: [String : Any]) {
        self.id             = getJSONValue(named: "id", from: values, defaultValue: "")
        self.created		= getJSONValue(named: "created", from: values, defaultValue: 0)
        self.updated		= getJSONValue(named: "updated", from: values, defaultValue: 0)
        self.name           = getJSONValue(named: "name", from: values, defaultValue: "")
    }
    
    override public func getJSONValues() -> [String : Any] {
        return [
            "id":           id,
            "created":      created,
            "updated":      updated,
            "name":         name
        ]
    }
    
}
