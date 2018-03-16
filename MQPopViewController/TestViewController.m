//
//  TestViewController.m
//  MQPopViewController
//
//  Created by 120v on 2018/3/16.
//  Copyright © 2018年 MQ. All rights reserved.
//

#import "TestViewController.h"
#import "DimmingPresentationController.h"

@interface TestViewController ()<UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation TestViewController

+ (void)showUpon:(UIViewController *)vc{
    TestViewController *testVc = [[TestViewController alloc] init];
    [vc presentViewController:testVc animated:true completion:nil];
}


- (instancetype)init{
    if (self = [super init]) {
        [self setModalPresentationStyle:UIModalPresentationCustom];
        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (!CGRectContainsPoint(self.contentView.frame, point)) {
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    return [[DimmingPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end
