//
//  AppDelegate.m
//  ChatRoomDemo
//
//  Created by su xinde on 14-1-12.
//  Copyright (c) 2014年 su xinde. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //判断是否由远程消息通知触发应用程序启动
    if ([launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]!=nil) {
        //获取应用程序消息通知标记数（即小红圈中的数字）
        int badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
        if (badge>0) {
            //如果应用程序消息通知标记数（即小红圈中的数字）大于0，清除标记。
            badge--;
            //清除标记。清除小红圈中数字，小红圈中数字为0，小红圈才会消除。
            [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
        }
    }
    //消息推送注册
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeSound|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token = [NSString stringWithFormat:@"%@", deviceToken];
    //获取终端设备标识，这个标识需要通过接口发送到服务器端，服务器端推送消息到APNS时需要知道终端的标识，APNS通过注册的终端标识找到终端设备。
    NSLog(@"My token is:%@", token);
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSString *error_str = [NSString stringWithFormat: @"%@", error];
    NSLog(@"Failed to get token, error:%@", error_str);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //在此处理接收到的消息。
    NSLog(@"Receive remote notification : %@",userInfo);
}

@end
