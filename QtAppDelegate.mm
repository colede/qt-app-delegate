//
//  QtAppDelegate.m
//  Background Fetch app delegate
//
//  Created by Derek Cole,
//

#import "QtAppDelegate.h"

@implementation QtAppDelegate
static QtAppDelegate *sharedAppDelegate = nil;

+(QtAppDelegate *)sharedQtAppDelegate{
    static dispatch_once_t pred;
    static QtAppDelegate *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] init];
    });
    return shared;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    // Override point for customization after application launch.
    NSLog(@"DId this launch option happen");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"In the background");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        NSLog(@"In the foreground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    // We will add content here soon.
    NSLog(@"In the completionHandler");
}


void QtAppDelegateInitialize ()
{
    //want this function to get the current UIApplication, and set itself as the new app delegate.
    QtAppDelegate *appDelegate = (QtAppDelegate *)[[UIApplication sharedApplication] delegate];
    [[UIApplication sharedApplication] setDelegate:[QtAppDelegate sharedQtAppDelegate]];
    [[QtAppDelegate sharedQtAppDelegate] setWindow:appDelegate.window];
    
    NSLog(@"Created a new appdelegate");
}

@end
