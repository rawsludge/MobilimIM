//
//  BaseTableViewController.h
//  MobilIM
//
//  Created by Ahmet ÖZTÜRK on 09/11/14.
//  Copyright (c) 2014 Ahmet ÖZTÜRK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface BaseTableViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;


-(void)cancelAndDismiss;
-(void)saveAndDismiss;

@end
