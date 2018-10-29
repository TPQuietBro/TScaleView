//
//  TScaleView.m
//  TCALayerDemo
//
//  Created by allentang on 2018/10/29.
//  Copyright © 2018 allentang. All rights reserved.
//

#import "TScaleView.h"
@interface TScaleView()
@property (nonatomic,assign) TScaleDirection direction;
@property (nonatomic, strong) UIView *subview;
@end
@implementation TScaleView
- (instancetype)initWithDirection:(TScaleDirection)direction{
    if (self = [super init]) {
        _direction = direction;
        [self initSubview];
    }
    return self;
}

- (void)initSubview{
    UIView *subview = [[UIView alloc] init];
    subview.backgroundColor = [UIColor orangeColor];
    [self addSubview:subview];
    _subview = subview;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addAnimation];
    });
}

- (void)layoutSubviews{
    [super layoutSubviews];
    switch (self.direction) {
        case TScaleLeft:
        {
            _subview.frame = CGRectMake(0, 0, 100, 100);
        }
            break;
        case TScaleRight:
        {
            _subview.frame = CGRectMake(self.frame.size.width - 100, 0, 100, 100);
        }
            break;
        case TScaleUp:
        {
            _subview.frame = CGRectMake(0, self.frame.size.height - 100, 100, 100);
        }
            break;
        case TScaleDown:
        {
            _subview.frame = CGRectMake(0, 0, 100, 100);
        }
            break;
    }
    
}

- (void)addAnimation{
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.duration = 1.0f;
    animation.fromValue = @(100);
    animation.toValue = @(20);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    
    switch (self.direction) {
        case TScaleLeft:
        {
            self.subview.layer.position = CGPointMake(0, 0);
            self.subview.layer.anchorPoint = CGPointMake(0, 0);
            animation.keyPath = @"bounds.size.width";
        }
            break;
        case TScaleRight:
        {
            self.subview.layer.position = CGPointMake(self.frame.size.width, 0);
            self.subview.layer.anchorPoint = CGPointMake(1, 0);
            animation.keyPath = @"bounds.size.width";
        }
            break;
        case TScaleUp:
        {
            self.subview.layer.position = CGPointMake(0, self.frame.size.height);
            self.subview.layer.anchorPoint = CGPointMake(0, 1);
            animation.keyPath = @"bounds.size.height";
        }
            break;
        case TScaleDown:
        {
            self.subview.layer.position = CGPointMake(0, 0);
            self.subview.layer.anchorPoint = CGPointMake(0, 0);
            animation.keyPath = @"bounds.size.height";
        }
            break;
    }
    [self.subview.layer addAnimation:animation forKey:@"YYPopularAutoScaleView"];
}

@end
