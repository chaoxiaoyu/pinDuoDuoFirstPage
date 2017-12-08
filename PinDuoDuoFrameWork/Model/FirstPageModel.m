//
//  FirstPageModel.m
//  PinDuoDuoFrameWork
//
//  Created by abc on 17/1/10.
//  Copyright © 2017年 翔天. All rights reserved.
//

#import "FirstPageModel.h"

@implementation FirstPageModel

- (instancetype)initWithButtonTitle:(NSString *)btnTitle andCellTitle:(NSString *)celltitle
{
      if (self = [super init])
      {
            self.buttonTitle = btnTitle;
            self.cellTitle = celltitle;
      }
      return self;
}

- (NSArray *)modelArray
{
      NSArray *modelArray ;
      return modelArray;
}

@end
