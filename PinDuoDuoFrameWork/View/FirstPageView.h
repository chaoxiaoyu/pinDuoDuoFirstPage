//
//  FirstPageView.h
//  PinDuoDuoFrameWork
//
//  Created by abc on 17/1/10.
//  Copyright © 2017年 翔天. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Public.h"

@interface FirstPageView : UIView<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *topScrollView;
@property (strong, nonatomic) UIView *lineView;
@property (strong, nonatomic) UIScrollView *bottomScrollView;

- (instancetype)initWithFrame:(CGRect)frame andModelArray:(NSArray *)modelArray;

@end
