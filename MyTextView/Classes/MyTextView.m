//
//  MyTextView.m
//
//  Created by 张威 on 15/2/3.
//  Copyright (c) 2015年 张威. All rights reserved.
//

#import "MyTextView.h"
#import "NSString+Size.h"
#import "UIView+Extension.h"

@interface MyTextView ()

@property (nonatomic, weak) UILabel *placeholderLabel;

@end

@implementation MyTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeTopLeft;

        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel;
        
        // 设置默认的占位文字颜色
        self.placeholderColor = [UIColor lightGrayColor];
        
        // 设置默认的字体
        self.font = [UIFont systemFontOfSize:14];
        
        // 监听内部文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 监听文字改变
- (void)textDidChange
{
    // text属性：只包括普通的文本字符串
    // attributedText：包括了显示在textView里面的所有内容（表情、text）
    NSInteger count = self.text.length;
    if (count > self.maxTextLength)
    {
//        [MBProgressHUD showError:@"输入字数超过限制"];
        self.text = [self.text substringToIndex:self.maxTextLength];
    }
    
    if (self.valueDelegate &&[self.valueDelegate respondsToSelector:@selector(sendValue:)]) {
        [self.valueDelegate  sendValue:self.text.length];
    }

    self.placeholderLabel.hidden = self.hasText;
}

#pragma mark - 公共方法
- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    // 设置文字
    self.placeholderLabel.text = placeholder;
    self.placeholderLabel.font = [UIFont systemFontOfSize:14];
    // 重新计算子控件的fame
    [self setNeedsLayout];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    // 设置颜色
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    // 重新计算子控件的fame
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placeholderLabel.y = 8;
    self.placeholderLabel.x = 5;
    self.placeholderLabel.width = self.width - 2 * self.placeholderLabel.x;
    // 根据文字计算label的高度
    CGSize maxSize = CGSizeMake(self.placeholderLabel.width, MAXFLOAT);
    CGSize placehoderSize = [self.placeholder sizeWithFont:self.placeholderLabel.font maxSize:maxSize];
    self.placeholderLabel.height = placehoderSize.height;
}



@end
