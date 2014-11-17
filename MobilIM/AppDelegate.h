//
//  AppDelegate.h
//  MobilIM
//
//  Created by Ahmet ÖZTÜRK on 08/11/14.
//  Copyright (c) 2014 Ahmet ÖZTÜRK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XmppConnectionManager.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) XmppConnectionManager *connectionManager;


@end

