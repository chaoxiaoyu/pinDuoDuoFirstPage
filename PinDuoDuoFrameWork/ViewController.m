//
//  ViewController.m
//  PinDuoDuoFrameWork
//
//  Created by abc on 17/1/10.
//  Copyright © 2017年 翔天. All rights reserved.
//

#import "ViewController.h"
#import "FirstPageView.h"
#import "FirstPageModel.h"
#import "Public.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
      [super viewDidLoad];
      
      FirstPageModel *model1 = [[FirstPageModel alloc] initWithButtonTitle:@"首页1" andCellTitle:@"cell"];
      FirstPageModel *model2 = [[FirstPageModel alloc] initWithButtonTitle:@"首页首页2" andCellTitle:@"cell"];
      FirstPageModel *model3 = [[FirstPageModel alloc] initWithButtonTitle:@"首页首页3" andCellTitle:@"cell"];
      FirstPageModel *model4 = [[FirstPageModel alloc] initWithButtonTitle:@"首页首4" andCellTitle:@"cell"];
      FirstPageModel *model5 = [[FirstPageModel alloc] initWithButtonTitle:@"首页首页首5" andCellTitle:@"cell"];
      FirstPageModel *model6 = [[FirstPageModel alloc] initWithButtonTitle:@"首页首页6" andCellTitle:@"cell"];
      FirstPageModel *model7 = [[FirstPageModel alloc] initWithButtonTitle:@"首页首7" andCellTitle:@"cell"];
      FirstPageModel *model8 = [[FirstPageModel alloc] initWithButtonTitle:@"首页首页首页8" andCellTitle:@"cell"];
      
      NSArray *modelArray = @[model1,model2,model3,model4,model5,model6,model7,model8];
      FirstPageView *firstPageView = [[FirstPageView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) andModelArray:modelArray];
      [self.view addSubview:firstPageView];
      
}


- (void)didReceiveMemoryWarning {
      [super didReceiveMemoryWarning];
      // Dispose of any resources that can be recreated.
}


@end
