//
//  NSString+Size.m
//
//  Created by 张威 on 14/11/6.
//  Copyright (c) 2014年 张威. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)
//返回字符串所占用的尺寸.
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
