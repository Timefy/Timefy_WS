//
//  main.swift
//  Timefy_Perfect_DB
//
//  Created by Joel Broström on 2017-08-24.
//
//



import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()

var routes = Routes()


routes.add(method: .get, uri: URI.root, handler: {
	request, response in
	response.setHeader(.contentType, value: Text.htmlText)
	response.appendBody(string: Text.helloWorld)
	response.completed()
	}
)


// Adding a route to handle the GET TimefyUsers list URL
routes.add(method: .get, uri: URI.users, handler: {
    request, response in
    
    let timefyUsers = TimefyUsers()
    
    response.setHeader(.contentType, value: URI.usersJson)
    response.appendBody(string: timefyUsers.list())
    response.completed()
}
)


//// Adding a route to handle the POST Users add URL, with post body params
//routes.add(method: .post, uri: URI.users, handler: {
//	request, response in
//
//	let timefyUsers = TimefyUsers()
//
//	response.setHeader(.contentType, value: ContentType.JasonApplication)
//	response.appendBody(string: timefyUsers.add(request))
//	response.completed()
//	}
//)

// Adding a route to handle the POST TimefyUsers add via JSON
routes.add(method: .post, uri: URI.usersJson, handler: {
    request, response in
    
    let users = TimefyUsers()
    
    response.setHeader(.contentType, value: ContentType.JasonApplication)
    response.appendBody(string: users.add(request.postBodyString!))
    response.completed()
}
)





server.addRoutes(routes)
server.serverPort = 8181

do {
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print("Network error thrown: \(err) \(msg)")
}

