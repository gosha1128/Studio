//
//  AppDelegate.m
//  studioapp
//
//  Created by George Williams on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize vc=_vc;

-(void) report_memory {
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(),
                                   TASK_BASIC_INFO,
                                   (task_info_t)&info,
                                   &size);
    if( kerr == KERN_SUCCESS ) {
        NSLog(@"Memory in use (in bytes): %u", info.resident_size);
    } else {
        NSLog(@"Error with task_info(): %s", mach_error_string(kerr));
    }
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    [ self report_memory ];
#if 0
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"App Low Memory" 
                                                    message:@"App Low Memory" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
#endif
}

-(void) lowMemNotification:(id)obj
{
    
    [ self report_memory ];
    
#if 0
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"App Low Memory" 
                                                    message:@"App Low Memory" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
#endif
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                            selector:@selector(lowMemNotification:)
                                            name: UIApplicationDidReceiveMemoryWarningNotification 
                                            object:nil];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    if ( self.vc != nil )
    {
#ifdef DO_GALLERY
        [ self.vc galleryTap:nil ];
#endif
        
        [ self.vc gotoSection:Section_Home :NO ];
        if ( !self.vc.blinking )
        {
            self.vc.larr.hidden = NO;
            self.vc.rarr.hidden = NO;
            self.vc.barr.hidden = NO;
            self.vc.tarr.hidden = NO;
            [ self.vc blink:YES ];
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}
 

-(void) SetMainVC:(ViewController *)vc
{
    self.vc = vc;
}


@end
