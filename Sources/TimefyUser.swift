//
//  User.swift
//  perfect_local
//
//  Created by Joel Broström on 2017-08-24.
//
//

import PerfectLib

class TimefyUser : JSONConvertibleObject {
    
    static let registerName = "timefyUser"
    
    var id: String = ""
    var created: Int64 = 0
    var updated: Int64 = 0
    var name: String = ""
    var email: String = ""
    var password: String = ""
    var superuser: Bool = false
    //   var customer: customer?
    
    init(id: String = "", created: Int64 = 0, updated: Int64 = 0, email: String = "", name: String = "", password: String = "", superuser: Bool = false) {
        self.id         = id
        self.created    = created
        self.updated    = updated
        self.name       = name
        self.email      = email
        self.password   = password
        self.superuser  = superuser
        
    }
    
    override public func setJSONValues(_ values: [String : Any]) {
        self.id             = getJSONValue(named: "id", from: values, defaultValue: "")
        self.created		= getJSONValue(named: "created", from: values, defaultValue: 0)
        self.updated		= getJSONValue(named: "updated", from: values, defaultValue: 0)
        self.name           = getJSONValue(named: "name", from: values, defaultValue: "")
        self.password       = getJSONValue(named: "password", from: values, defaultValue: "")
        self.email			= getJSONValue(named: "email", from: values, defaultValue: "")
        self.superuser      = getJSONValue(named: "superuser", from: values, defaultValue: false)
    }
    
    override public func getJSONValues() -> [String : Any] {
        return [
            "id":           id,
            "created":      created,
            "updated":      updated,
            "name":         name,
            "password":     password,
            "email":        email,
            "superuser":    superuser
        ]
    }

}
