//
//  BaseTableViewController.m
//  MobilIM
//
//  Created by Ahmet ÖZTÜRK on 09/11/14.
//  Copyright (c) 2014 Ahmet ÖZTÜRK. All rights reserved.
//

#import "BaseTableViewController.h"
#import "AppDelegate.h"

@interface BaseTableViewController()



@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSManagedObjectContext*)managedObjectContext
{
    return [(AppDelegate *)[[UIApplication sharedApplication]delegate]managedObjectContext];
}


-(void)cancelAndDismiss
{
    [self.managedObjectContext rollback];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)saveAndDismiss
{
    NSError *error;
    if( [self.managedObjectContext hasChanges]) {
        if( ![self.managedObjectContext save:&error]) {
            NSLog(@"Save failed:%@", [error localizedDescription]);
        }
        else
            NSLog(@"Save succeded");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
