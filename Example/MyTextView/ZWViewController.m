//
//  ZWViewController.m
//  MyTextView
//
//  Created by zhangwei5436 on 01/18/2018.
//  Copyright (c) 2018 zhangwei5436. All rights reserved.
//

#import "ZWViewController.h"
#import "MyTextView.h"
#import "UIView+Extension.h"

//定义高度
#define kUIScreenSize [UIScreen mainScreen].bounds.size
#define kUIScreenWidth kUIScreenSize.width
#define kUIScreenHeight kUIScreenSize.height
@interface ZWViewController ()<passTextViewValueDelegate>
@property(nonatomic,strong)MyTextView * textView;
@property(nonatomic,strong)UILabel * maxTextLabel;

@end

@implementation ZWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"测试";
    self.view.backgroundColor = [UIColor lightGrayColor];

    [self makeWhiteView];
}

-(void)makeWhiteView
{
    UIView  * whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, 240)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view  addSubview:whiteView];
    self.textView = [[MyTextView alloc]initWithFrame:CGRectMake(5, 0, kUIScreenWidth-10, whiteView.height-20)];
    self.textView.placeholder = @"说点什么吧...";
    self.textView.maxTextLength = 500;
    self.textView.valueDelegate = self;
    [whiteView addSubview:self.textView];
    
    self.maxTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.textView.frame), kUIScreenWidth-10, 20)];
    self.maxTextLabel.text = @"0/500";
    self.maxTextLabel.font = [UIFont systemFontOfSize:14];
    self.maxTextLabel.textColor = [UIColor lightGrayColor];
    self.maxTextLabel.textAlignment = NSTextAlignmentRight;
    [whiteView addSubview:self.maxTextLabel];
    
}

#pragma mark-passTextViewValueDelegate
-(void)sendValue:(NSInteger)textLength{
    self.maxTextLabel.text = [NSString stringWithFormat:@"%ld/500",(long)textLength];
}

@end
