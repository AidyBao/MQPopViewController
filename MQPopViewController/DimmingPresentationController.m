//
//  DimmingPresentationController.m
//  MQPopViewController
//
//  Created by 120v on 2018/3/16.
//  Copyright © 2018年 MQ. All rights reserved.
//

#import "DimmingPresentationController.h"

@interface DimmingPresentationController()
@property (nonatomic,strong) UIView * maskView;
@end

@implementation DimmingPresentationController
- (UIView *)maskView{
    if (_maskView == nil) {
        _maskView = [[UIView alloc] initWithFrame:CGRectZero];
        [_maskView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.25]];
    }
    return _maskView;
}

-(void)presentationTransitionWillBegin{
    self.maskView.frame = self.containerView.bounds;
    [self.containerView insertSubview:self.maskView atIndex:0];
    
    self.maskView.alpha = 0;
    if (self.presentedViewController.transitionCoordinator) {
        [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self.maskView.alpha = 1.0;
            
        } completion:nil];
    }
}

-(void)dismissalTransitionWillBegin{
    if (self.presentedViewController.transitionCoordinator) {
        [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self.maskView.alpha = 0;
            
        } completion:nil];
    }
}

-(BOOL)shouldRemovePresentersView{
    return false;
}

@end
