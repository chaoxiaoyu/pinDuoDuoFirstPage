//
//  Public.h
//  PinDuoDuoShouye
//
//  Created by abc on 17/1/9.
//  Copyright © 2017年 翔天. All rights reserved.
//

#ifndef Public_h
#define Public_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define TOPSCROLL_HEIGHT 25

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#endif /* Public_h */
