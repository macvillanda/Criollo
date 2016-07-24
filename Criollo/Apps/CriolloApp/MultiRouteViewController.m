//
//  MultiRouteViewController.m
//  HelloWorld-ObjC
//
//  Created by Cătălin Stan on 11/23/15.
//  Copyright © 2015 Catalin Stan. All rights reserved.
//

#import "MultiRouteViewController.h"
#import "APIController.h"
#import "HelloWorldViewController.h"

@implementation MultiRouteViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil prefix:(NSString * _Nullable)prefix {
    self  = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil prefix:prefix];
    if ( self != nil ) {
        [self addBlock:^(CRRequest * _Nonnull request, CRResponse * _Nonnull response, CRRouteCompletionBlock  _Nonnull completionHandler) {
            [response setValue:@"text/plain" forHTTPHeaderField:@"Content-type"];
            [response send:@"Hello :)"];
            completionHandler();
        } forPath:@"/hello"];

        [self addBlock:^(CRRequest * _Nonnull request, CRResponse * _Nonnull response, CRRouteCompletionBlock  _Nonnull completionHandler) {
            [response setValue:@"text/plain" forHTTPHeaderField:@"Content-type"];
            [response send:NSStringFromCRHTTPMethod(request.method)];
            completionHandler();
        } forPath:@"/method"];

        [self addViewController:[HelloWorldViewController class] withNibName:nil bundle:nil forPath:@"/hello-c" HTTPMethod:CRHTTPMethodAll recursive:YES];
        [self addController:[APIController class] forPath:@"/api" HTTPMethod:CRHTTPMethodAll recursive:YES];

        // Placeholder path controller
        [self addViewController:[HelloWorldViewController class] withNibName:@"HelloWorldViewController" bundle:nil forPath:@"/:year/:month/:slug" HTTPMethod:CRHTTPMethodAll recursive:NO];

    }
    return self;
}

- (NSString *)presentViewControllerWithRequest:(CRRequest *)request response:(CRResponse *)response {
    self.vars[@"title"] = NSStringFromClass(self.class);

    NSMutableString* text = [NSMutableString string];
    [text appendString:@"<h3>Request Enviroment:</h3><pre>"];
    [request.env enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        [text appendFormat:@"%@: %@\n", key, obj];
    }];
    [text appendString:@"</pre>"];
    self.vars[@"text"] = text;

    return [super presentViewControllerWithRequest:request response:response];
}

@end
