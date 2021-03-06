//
//  AppDelegate.m
//  App42APISample
//
//  Created by Rajeev Ranjan on 24/03/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#import "AppDelegate.h"
#import "UserServiceAPIList.h"
#import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>

#define APP_Key     @"67359321652c10b15fd5f659d096a2051745aa4f339b936d6ce5dccb165de863"
#define SECRET_Key  @"2d44878dd428046f23bd4b3807ce83e982db9900f4c5a8305255da4764c76610"


@interface AppDelegate ()
{
    NSString *deviceToken;
}
@end



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [App42API initializeWithAPIKey:APP_Key andSecretKey:SECRET_Key];
    [App42API enableApp42Trace:YES];
    
    //App42ServiceList *serviceList = [[App42ServiceList alloc] initWithStyle:UITableViewStylePlain];
    NSDictionary *serviceList = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"App42Services" ofType:@"plist"]];
    UserServiceAPIList *serviceAPIList = [[UserServiceAPIList alloc] initWithStyle:UITableViewStylePlain];
    //NSLog(@"%@",[serviceList objectForKey:cell.textLabel.text]);
    serviceAPIList.apiList = [serviceList objectForKey:@"User Service"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:serviceAPIList];
    
    [self.window setRootViewController:navController];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}




#pragma mark- App State Delegates

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
