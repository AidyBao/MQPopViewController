//
//  ViewController.m
//  MQPopViewController
//
//  Created by 120v on 2018/3/16.
//  Copyright © 2018年 MQ. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)popAction:(id)sender {
    
    [TestViewController showUpon:self];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
