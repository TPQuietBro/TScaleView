//
//  ViewController.m
//  TCALayerDemo
//
//  Created by allentang on 2018/10/29.
//  Copyright © 2018 allentang. All rights reserved.
//

#import "ViewController.h"
#import "TScaleView.h"

@interface ViewController ()
@property (weak, nonatomic) TScaleView *subview;
@property (weak, nonatomic) IBOutlet UITextField *t1;
@property (weak, nonatomic) IBOutlet UITextField *t2;
@property (weak, nonatomic) IBOutlet UITextField *t3;
@property (weak, nonatomic) IBOutlet UITextField *t4;
@property (nonatomic,assign) CGPoint oriPostion;
@property (nonatomic,assign) CGPoint oriAnchor;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    TScaleView *subview = [[TScaleView alloc] initWithDirection:TScaleRight];
//    TScaleView *subview = [[TScaleView alloc] initWithDirection:TScaleLeft];
//    TScaleView *subview = [[TScaleView alloc] initWithDirection:TScaleUp];
    TScaleView *subview = [[TScaleView alloc] initWithDirection:TScaleDown];
    subview.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:subview];
    subview.frame = CGRectMake(0, 0, 200, 200);
    self.subview = subview;
    
    self.oriPostion = self.subview.layer.position;
    self.oriAnchor = self.subview.layer.anchorPoint;
    
    NSLog(@"begin-position:%@",NSStringFromCGPoint(self.subview.layer.position));
    NSLog(@"begin-anchorPoint:%@",NSStringFromCGPoint(self.subview.layer.anchorPoint));
}
- (IBAction)clickPostion:(id)sender {
    self.subview.layer.position = CGPointMake(self.t1.text.floatValue, self.t2.text.floatValue);
    NSLog(@"position:%@",NSStringFromCGPoint(self.subview.layer.position));
}
- (IBAction)clickAnchor:(id)sender {
    self.subview.layer.anchorPoint = CGPointMake(self.t3.text.floatValue, self.t4.text.floatValue);
    NSLog(@"anchorPoint:%@",NSStringFromCGPoint(self.subview.layer.anchorPoint));
}
- (IBAction)rest:(id)sender {
    self.subview.layer.position = self.oriPostion;
    self.subview.layer.anchorPoint = self.oriAnchor;
    self.t1.text = @"";
    self.t2.text = @"";
    self.t3.text = @"";
    self.t4.text = @"";
}


@end
