//
//  UIImage+extension.m
//  Swift2.0
//
//  Created by Chuanxun on 16/2/19.
//  Copyright © 2016年 李亮. All rights reserved.
//

#import "UIImage+extension.h"

@implementation UIImage (extension)

-(void)printSize
{
    
    NSLog(@"My Size is %@",NSStringFromCGSize(self.size));
}

@end
