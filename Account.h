//
//  Account.h
//  MobilIM
//
//  Created by Ahmet ÖZTÜRK on 10/11/14.
//  Copyright (c) 2014 Ahmet ÖZTÜRK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Account : NSManagedObject

@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * password;
@property (nonatomic) Boolean enabled;
@property (nonatomic, retain) NSString * nickName;

@end
