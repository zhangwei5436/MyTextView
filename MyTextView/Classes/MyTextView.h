//
//  MyTextView.h
//
//  Created by 张威  on 15/2/3.
//  Copyright (c) 2015年 张威. All rights reserved.
//

#import <UIKit/UIKit.h>

// 代理协议
@protocol passTextViewValueDelegate <NSObject>

@optional
-(void)sendValue:(NSInteger)textLength;

@end

@interface MyTextView : UITextView

@property (nonatomic, assign) NSInteger maxTextLength;
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic,assign)id<passTextViewValueDelegate>valueDelegate;
@end
