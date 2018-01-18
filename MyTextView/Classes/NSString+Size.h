//
//  NSString+Size.h

//
//  Created by 张威 on 14/11/6.
//  Copyright (c) 2014年 张威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)
/**
 *返回值是该字符串所占的大小(width, height)
 *font : 该字符串所用的字体(字体大小不一样,显示出来的面积也不同)
 *maxSize : 为限制改字体的最大宽和高(如果显示一行,则宽高都设置为MAXFLOAT, 如果显示为多行,只需将宽设置一个有限定长值,高设置为MAXFLOAT)
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end
