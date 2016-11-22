//
//  GoodsCategory.m
//  ZXShopCart
//
//  Created by Xiang on 16/1/28.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "GoodsCategory.h"
#import "GoodsModel.h"
#import "MJExtension.h"

@implementation GoodsCategory

// 实现这个方法的目的：告诉MJExtension框架goodsArray数组里面装的是GoodsModel模型
+ (NSDictionary *)objectClassInArray {
    return @{
             @"goodsArray" : [GoodsModel class],
             };
}

// 实现这个方法的目的：告诉MJExtension框架模型中的属性名对应着字典的哪个key
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"goodsCategoryName" : @"name",
             @"goodsCategoryDesc" : @"desciption",
             @"goodsArray"        : @"goods"
             };
}

@end
