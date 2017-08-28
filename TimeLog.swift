//
//  TimeLog.swift
//  Timefy_WS
//
//  Created by Joel Broström on 2017-08-28.
//
//
import Foundation
import PerfectLib

class TimeLog: JSONConvertibleObject {
    
    static let registerName = "timefyUser"
    
    var id:             String = ""
    var created:        Int64 = 0
    var updated:        Int64 = 0
    var name:           String = ""
    var client:         Client?
    var project:        Project?
    var task:           Task?
//    var user:         User?
//    var customer:     Customer?
//    var date:           Date?
    var notes:          String = ""
    var dateString:     String = ""
    var duration:       Double = 0
    
    init(id:            String = "",
         created:       Int64 = 0,
         updated:       Int64 = 0,
         name:          String = "",
         client:        Client,
         project:       Project,
         task:          Task,
//         date:          Date = Date(),
         notes:         String = "",
         dateString:    String = "",
         duraton:       Double = 0) {
        
        self.id         = id
        self.created    = created
        self.updated    = updated
        self.name       = name
        self.client     = client
        self.project    = project
        self.task       = task
//        self.date       = date
        self.notes      = notes
        self.dateString = dateString
        self.duration   = duraton
    }
    
    override public func setJSONValues(_ values: [String : Any]) {
        self.id         = getJSONValue(named: "id", from: values, defaultValue: "")
        self.created    = getJSONValue(named: "created", from: values, defaultValue: 0)
        self.updated	= getJSONValue(named: "updated", from: values, defaultValue: 0)
        self.name       = getJSONValue(named: "name", from: values, defaultValue: "")
        self.client     = getJSONValue(named: "client", from: values, defaultValue: nil)
        self.project    = getJSONValue(named: "project", from: values, defaultValue: nil)
        self.task       = getJSONValue(named: "task", from: values, defaultValue: nil)
//        self.date       = getJSONValue(named: "date", from: values, defaultValue: nil)
        self.notes      = getJSONValue(named: "notes", from: values, defaultValue: "")
        self.dateString = getJSONValue(named: "dateString", from: values, defaultValue: "")
        self.duration   = getJSONValue(named: "duration", from: values, defaultValue: 0.0)
    }
    
    override public func getJSONValues() -> [String : Any] {
        return [
            "id":           id,
            "created":      created,
            "updated":      updated,
            "name":         name,
            "client":       client ?? "",
            "project":      project ?? "",
            "task":         task ?? "",
//            "date":         date ?? "",
            "notes":        notes,
            "dateString":   dateString,
            "duration":     duration
        ]
    }
}
