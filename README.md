

[![Criollo](https://criollo.io/res/doc/images/criollo-github.png)](https://criollo.io/)

#### A powerful Cocoa based web application framework for OS X and iOS.

[![Version Status](https://img.shields.io/cocoapods/v/Criollo.svg?style=flat)](http://cocoadocs.org/docsets/Criollo)  [![Platform](http://img.shields.io/cocoapods/p/Criollo.svg?style=flat)](http://cocoapods.org/?q=Criollo) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
 [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat)](https://opensource.org/licenses/MIT) [![Twitter](https://img.shields.io/badge/twitter-@Criolloio-orange.svg?style=flat)](http://twitter.com/Criolloio)


Criollo helps create fast standalone or embedded web apps that deliver content directly over HTTP or FastCGI. You can write code in Swift or Objective-C and you can use the Cocoa technologies you already know. 

It's as easy as this:

```swift
let server = CRHTTPServer()
server.get("/") { (request, response, completionHandler) in
	response.send("Hello world!")
}
server.startListening()
```

... and in Objective-C:

```objective-c
CRServer* server = [[CRHTTPServer alloc] init];
[server get:@"/" block:^(CRRequest *req, CRResponse *res, CRRouteCompletionBlock next) {
	[response send:@"Hello world!"];
}];
[server startListening];
```

# Key Features

Criollo is designed with speed, security and flexibility in mind, that's why it comes with a few very useful features out of the box, thus allowing you to focus on the actual job your project needs to do, without having to jump through hoops in order to make it happen.

### Routing

When defining routes, paths can be specified in three ways:

- **Fixed string** (ex. `/api`). This will match the string exactly.
- **Placeholders** (ex. `/posts/:pid`). The next path component after `/posts`, will be matched and added to `request.query` under the `pid` key.
- **Regex patterns** (ex. `/[0-9]{4}/[0-9]{1,2}/[a-zA-Z0-9-]+`). When the three patterns are matched, they are added to `request.query`, under the keys `0`, `1` and `2` respectively.

```swift
self.server.add("/api") { (req, res, next) in
	// /api/?pid=12345
	res.send(req.query)
}

self.server.add("/posts/:pid") { (req, res, next) in
	// /posts/12345
	res.send(req.query);
}

self.server.add("/[0-9]{4}/[0-9]{1,2}/[a-zA-Z0-9-]+") { (req, res, next) in
	// /2017/10/my-first-criollo-app
	res.send(req.query);
}
```

```objective-c
[self.server add:@"/api" block:^(CRRequest *req, CRResponse *res, CRRouteCompletionBlock next) {
    // /api/?pid=12345
    [response send:request.query];
}];

[self.server add:@"/posts/:pid" block:^(CRRequest *req, CRResponse *res, CRRouteCompletionBlock next) {
    // /posts/12345
    [response send:request.query];
}];

[self.server add:@"/[0-9]{4}/[0-9]{1,2}/[a-zA-Z0-9-]+" block:^(CRRequest *req, CRResponse *res, CRRouteCompletionBlock next) {
    // /2017/10/my-first-criollo-app
    [response send:request.query];
}];
```

### Controllers
### View Controllers
### Static File/Directory Serving
### Multipart File Uploads

## Why?

Criollo was created in order to take advantage of the truly awesome tools and APIs that the Apple stack provides and serve content produced with them over the web. 

It incorporates an HTTP web server and a [FastCGI](https://fast-cgi.github.io/) application server that are used to deliver content. The server is built on Grand Central Dispatch and designed for *speed*.

## How to Use

Criollo can easily be embedded as a web-server inside your OS X or iOS app, should you be in need of such a feature, however it was designed to create standalone, long-lived daemon style apps. It is fully [`launchd`](http://launchd.info/) compatible and replicates the lifecycle and behavior of `NSApplication`, so that the learning curve should be as smooth as possible. 

For a more real-world example, check out the [criollo.io](https://criollo.io) website, made using Criollo and available for your cloning pleasure at [https://github.com/thecatalinstan/Criollo-Web](https://github.com/thecatalinstan/Criollo-Web).

See the [Hello World Multi Target example](https://github.com/thecatalinstan/Criollo/tree/master/Examples/HelloWorld-MultiTarget) for a demo of the two usage patterns.

## Getting Started

- [Download Criollo](https://github.com/thecatalinstan/Criollo/archive/master.zip) and try out the included OS X and iOS [example apps](https://github.com/thecatalinstan/Criollo/Examples). *Criollo requires [CocoaAsyncSocket](https://github.com/robbiehanson/CocoaAsyncSocket), so do not forget to [download](https://github.com/robbiehanson/CocoaAsyncSocket/archive/master.zip) it into `Libraries/CocoaAsyncSocket`*.
- Read the [“Getting Started” guide](https://github.com/thecatalinstan/Criollo/wiki/Getting-Started) and move further with the [“Doing More Stuff” guide](https://github.com/thecatalinstan/Criollo/wiki/Doing-More-Stuff)
- Check out the [documentation](http://cocoadocs.org/docsets/Criollo/) for a look at the APIs available
- Learn how to deploy your Criollo apps in the [“Deployment” guide](https://github.com/thecatalinstan/Criollo/wiki/Deployment)

## Installing

The preferred way of installing Criollo is through [CocoaPods](http://cocoapods.org). However, you can also embed the framework in your projects manually.

### Installing with CocoaPods

1. Create the Podfile if you don’t already have one. You can do so by running `pod init` in the folder of the project.
2. Add Criollo to your Podfile. `pod 'Criollo', '~> 0.4’`
3. Run `pod install`

Please note that Criollo will download [CocoaAsyncSocket](https://github.com/robbiehanson/CocoaAsyncSocket) as a dependency.

### Cloning the repo

Criollo uses [CocoaAsyncSocket](https://github.com/robbiehanson/CocoaAsyncSocket) which is included as a git submodule

```bashh
git clone --recursive https://github.com/thecatalinstan/Criollo.git
```

## Get in Touch

If you have any **questions** regarding the project or **how to** do anything with it, please feel free to get in touch either on Twitter [@criolloio](https://twitter.com/criolloio) or by plain old email [criollo@criollo.io](mailto:criollo@criollo.io).

I really encourage you to [submit an issue](https://github.com/thecatalinstan/Criollo/issues/new), as your input is really and truly appreciated.
