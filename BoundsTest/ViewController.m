//
//  ViewController.m
//  BoundsTest
//
//  Created by xionghuaxin on 7/13/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ViewController.h"
#import "XAlertViewHelper.h"

@interface ViewController ()
@property(nonatomic,strong)UIView *parentsViewA;
@property(nonatomic,strong)UIView *testView;
@property(nonatomic,strong)UIButton *changeBoundsButton;

@end

@implementation ViewController


-(UIView *)parentsViewA
{
    if (_parentsViewA == nil) {
        _parentsViewA = [[UIView alloc]init];
        _parentsViewA.backgroundColor = [UIColor grayColor];
        _parentsViewA.bounds = CGRectMake(0, 0, 200, 200);
        _parentsViewA.center = self.view.center;
        
    }
    return _parentsViewA;
}

-(UIButton *)changeBoundsButton
{
    if (_changeBoundsButton == nil) {
        _changeBoundsButton =[UIButton buttonWithType:UIButtonTypeCustom];
        _changeBoundsButton.frame =CGRectMake(375/2-60, 607, 120, 40);
        [_changeBoundsButton setTitle:@"设置坐标" forState:UIControlStateNormal];
        _changeBoundsButton.backgroundColor = [UIColor brownColor];
        [_changeBoundsButton addTarget:self action:@selector(changBounds) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBoundsButton;
}
-(UIView *)testView
{
    if (_testView == nil) {
        _testView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        _testView.backgroundColor = [UIColor greenColor];
        
    }
    return _testView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

-(void)setupUI
{
    [self.view addSubview:self.parentsViewA];
    [self.parentsViewA addSubview:self.testView];
    [self.view addSubview:self.changeBoundsButton];
}

-(void)changBounds
{
    
    __block CGFloat bounds_oringal_x = self.parentsViewA.bounds.origin.x;
    __block CGFloat bounds_oringal_y = self.parentsViewA.bounds.origin.y;
    __block CGFloat bounds_width = self.parentsViewA.frame.size.width;
    __block CGFloat bounds_height = self.parentsViewA.frame.size.height;
    [XAlertViewHelper showAlerViewWithTitle:@"设置parentsViewA bounds" AndMessage:@"设置bounds_oringal_x" AndActionMessages:@[@"确定",@"取消"] AndButtonActionS:^(NSString *parameter) {
        bounds_oringal_x = [NSNumber numberWithInteger:parameter.integerValue].floatValue ? [NSNumber numberWithInteger:parameter.integerValue].floatValue :bounds_oringal_x;
        [XAlertViewHelper showAlerViewWithTitle:@"设置parentsViewA bounds" AndMessage:@"设置bounds_oringal_y" AndActionMessages:@[@"确定",@"取消"] AndButtonActionS:^(NSString *parameter) {
            bounds_oringal_y = [NSNumber numberWithInteger:parameter.integerValue].floatValue? [NSNumber numberWithInteger:parameter.integerValue].floatValue :bounds_oringal_y;
            [XAlertViewHelper showAlerViewWithTitle:@"设置parentsViewA bounds" AndMessage:@"设置bounds_width" AndActionMessages:@[@"确定",@"取消"] AndButtonActionS:^(NSString *parameter) {
                bounds_width = [NSNumber numberWithInteger:parameter.integerValue].floatValue?[NSNumber numberWithInteger:parameter.integerValue].floatValue:bounds_width;
                [XAlertViewHelper showAlerViewWithTitle:@"设置parentsViewA bounds" AndMessage:@"设置bounds_height" AndActionMessages:@[@"确定",@"取消"] AndButtonActionS:^(NSString *parameter) {
                    bounds_height = [NSNumber numberWithInteger:parameter.integerValue].floatValue?[NSNumber numberWithInteger:parameter.integerValue].floatValue:bounds_height;
                    self.parentsViewA.bounds = CGRectMake(bounds_oringal_x, bounds_oringal_y, bounds_width, bounds_height);
                    [self.view setNeedsLayout];

                }];

            }];
           
        }];

    }];
    
    
}

@end
