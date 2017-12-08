//
//  FirstPageModel.h
//  PinDuoDuoFrameWork
//
//  Created by abc on 17/1/10.
//  Copyright © 2017年 翔天. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Public.h"

@interface FirstPageModel : NSObject

@property (strong, nonatomic) NSString *buttonTitle;
@property (strong, nonatomic) NSString *cellTitle;

- (instancetype)initWithButtonTitle:(NSString *)btnTitle andCellTitle:(NSString *)celltitle;

- (NSArray *)modelArray;

@end
