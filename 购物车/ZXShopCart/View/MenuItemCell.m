//
//  MenuItemCell.m
//  ZXShopCart
//
//  Created by Xiang on 16/2/17.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "MenuItemCell.h"
#import "GoodsModel.h"

@interface MenuItemCell ()

@property (strong, nonatomic) UIImageView *goodsIconView;
@property (strong, nonatomic)  UILabel *goodsNameLabel;
@property (strong, nonatomic)  UILabel *goodsOriginalPriceLabel;
@property (strong, nonatomic)  UILabel *goodsSalePriceLabel;
@property (strong, nonatomic)  UILabel *goodsCountLabel;
@property (strong, nonatomic)  UIButton *minusButton;
//@property (weak, nonatomic) IBOutlet UIView *soldoutBackgroudView;
@property (strong, nonatomic)  UIImageView *soldoutIconView;
//@property (weak, nonatomic) IBOutlet UIButton *plusButton;

@end

@implementation MenuItemCell

- (void)setGoods:(GoodsModel *)goods {
    _goods = goods;
    
    self.goodsIconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", goods.goodsIcon]];
    self.goodsNameLabel.text = [NSString stringWithFormat:@"%@", goods.goodsName];
    self.goodsOriginalPriceLabel.text = [NSString stringWithFormat:@"原价：¥ %.2f", goods.goodsOriginalPrice];
    self.goodsSalePriceLabel.text = [NSString stringWithFormat:@"¥ %.2f", goods.goodsSalePrice];
    self.goodsCountLabel.text = [NSString stringWithFormat:@"%zd", goods.orderCount];
    
    if (_goods.orderCount > 0) {
        [self.minusButton setHidden:NO];
        [self.goodsCountLabel setHidden:NO];
    } else {
        [self.minusButton setHidden:YES];
        [self.goodsCountLabel setHidden:YES];
    }
    
    if (!_goods.goodsStock  > 0) {
        //self.soldoutBackgroudView.hidden = NO;
        self.soldoutIconView.hidden = NO;
        _plusButton.enabled = NO;
    } else {
        //self.soldoutBackgroudView.hidden = YES;
        self.soldoutIconView.hidden = YES;
        _plusButton.enabled = YES;
    }
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        _goodsIconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 40, 40)];
//        [self addSubview:_goodsIconView];
        
        _goodsNameLabel= [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 150, 20)];
//        _goodsNameLabel.backgroundColor = [UIColor greenColor];
        _goodsNameLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_goodsNameLabel];
        
        _goodsSalePriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_goodsNameLabel.frame), 100, 20)];
        _goodsSalePriceLabel.textColor = [UIColor redColor];
        _goodsSalePriceLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_goodsSalePriceLabel];
        
        
        _minusButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _minusButton.backgroundColor = [UIColor yellowColor];
        _minusButton.frame = CGRectMake(CGRectGetMaxX(_goodsNameLabel.frame), 15, 20, 20);
        [_minusButton addTarget:self action:@selector(minusButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [_minusButton setBackgroundImage:[UIImage imageNamed:@"sub"] forState:UIControlStateNormal];
        [self addSubview:_minusButton];
        
        _goodsCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_minusButton.frame), 15, 30, 20)];
//        _goodsCountLabel.backgroundColor = [UIColor orangeColor];
        _goodsCountLabel.font = [UIFont systemFontOfSize:12];
        _goodsCountLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_goodsCountLabel];

        _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _plusButton.backgroundColor = [UIColor redColor];
        _plusButton.frame = CGRectMake(CGRectGetMaxX(_goodsCountLabel.frame), 15, 20, 20);
        [_plusButton setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [_plusButton addTarget:self action:@selector(plusButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_plusButton];
        
        _soldoutIconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 40, 40)];
        [self addSubview:_soldoutIconView];
    }
    return self;
}
- (void)plusButtonClicked {
    _goods.orderCount++;    // 修改模型
    _goods.goodsStock--;
    _goodsCountLabel.text = [NSString stringWithFormat:@"%i", _goods.orderCount];
    _minusButton.hidden = NO;
    _goodsCountLabel.hidden = NO;
    if (_goods.goodsStock == 0) {
        _plusButton.enabled = NO;
        self.soldoutIconView.hidden = NO;
    }
    
    // 通知代理（调用代理的方法）
    // respondsToSelector:能判断某个对象是否实现了某个方法
    if ([self.delegate respondsToSelector:@selector(menuItemCellDidClickPlusButton:)]) {
        [self.delegate menuItemCellDidClickPlusButton:self];
    }
}

- (void)minusButtonClicked {
    _goods.orderCount--;
    _goods.goodsStock++;
    _goodsCountLabel.text = [NSString stringWithFormat:@"%i", _goods.orderCount];
    
    if (_goods.orderCount == 0) {
        _minusButton.hidden = YES;
        _goodsCountLabel.hidden = YES;
    }
    
    if (_goods.goodsStock > 0) {
        _plusButton.enabled = YES;
        self.soldoutIconView.hidden = YES;
    }
    
    // 通知代理（调用代理的方法）
    if ([self.delegate respondsToSelector:@selector(menuItemCellDidClickMinusButton:)]) {
        [self.delegate menuItemCellDidClickMinusButton:self];
    }
}

@end
