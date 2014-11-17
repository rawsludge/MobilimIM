//
//  InitializeAccountViewController.m
//  MobilIM
//
//  Created by Ahmet ÖZTÜRK on 17/11/14.
//  Copyright (c) 2014 Ahmet ÖZTÜRK. All rights reserved.
//

#import "InitializeAccountViewController.h"

@interface InitializeAccountViewController ()

@end

@implementation InitializeAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.phoneNumber setText:[[NSUserDefaults standardUserDefaults] stringForKey:@"SBFormattedPhoneNumber"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
