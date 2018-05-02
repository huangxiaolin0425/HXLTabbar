//
//  UIButton+Property.m
//  HXTabBar
//
//  Created by Cocav on 2018/5/2.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import "UIButton+Property.h"
#import <objc/runtime.h>
@implementation UIButton (Property)
- (void)setAnima:(NSString *)anima{
//     objc_setAssociatedObject（将某个值跟某个对象关联起来，将某个值存储到某个对象中）
//     object:给哪个对象添加属性
//     key:属性名称
//     value:属性值
//     policy:保存策略
    objc_setAssociatedObject(self, @"anima", anima, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)anima{
      return objc_getAssociatedObject(self, @"anima");
}

@end
