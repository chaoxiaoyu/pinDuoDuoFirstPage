//
//  FirstPageView.m
//  PinDuoDuoFrameWork
//
//  Created by abc on 17/1/10.
//  Copyright © 2017年 翔天. All rights reserved.
//http://www.cocoachina.com/ios/20141216/10645.html

#import "FirstPageView.h"
#import "FirstPageModel.h"

@interface FirstPageView()
{
      UIButton *selectedBtn;
      BOOL btnTapped;
}

@end

@implementation FirstPageView

- (instancetype)initWithFrame:(CGRect)frame andModelArray:(NSArray *)modelArray
{
      if (self = [super initWithFrame:frame])
      {
            btnTapped = NO;
            self.topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOPSCROLL_HEIGHT)];
            self.topScrollView.showsHorizontalScrollIndicator = NO;
            static CGFloat buttonOriginX = 10.0;
            for (int i=0;i<modelArray.count;i++)
            {
                  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                                    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
                  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                  [button.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
                  FirstPageModel *model = modelArray[i];
                  CGSize buttonSize = [model.buttonTitle sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
                  button.frame = CGRectMake(buttonOriginX, 5, buttonSize.width, 14);
                  button.tag = 100 + i;
                  if (i == 0)
                  {
                        button.selected = YES;
                        self.lineView = [[UIView alloc] initWithFrame:CGRectMake(button.frame.origin.x, CGRectGetMaxY(self.topScrollView.frame)-2, buttonSize.width, 2)];
                        self.lineView.backgroundColor = [UIColor redColor];
                        [self.topScrollView addSubview:self.lineView];
                        selectedBtn = button;
                  }
                  else
                  {
                        button.selected = NO;
                  }

                  [button setTitle:model.buttonTitle forState:UIControlStateNormal];
                  [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
                  [self.topScrollView addSubview:button];
                  buttonOriginX = CGRectGetMaxX(button.frame) + 20;
            }
            self.topScrollView.contentSize = CGSizeMake(buttonOriginX - 10, TOPSCROLL_HEIGHT);
            [self addSubview:self.topScrollView];
            self.topScrollView.backgroundColor = [UIColor grayColor];
            
            //bottomScrollView
            self.bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topScrollView.frame), SCREEN_WIDTH, frame.size.height-CGRectGetMaxY(self.topScrollView.frame))];
            self.bottomScrollView.delegate = self;
            self.bottomScrollView.pagingEnabled = YES;
            self.bottomScrollView.bounces = NO;
            self.bottomScrollView.showsVerticalScrollIndicator = YES;
            self.bottomScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * modelArray.count, frame.size.height-CGRectGetMaxY(self.topScrollView.frame));
            [self addSubview:self.bottomScrollView];
            
      }
      return self;
}

- (void)buttonTapped:(UIButton *)button
{
      btnTapped = YES;
//      self.bottomScrollView.contentOffset = CGPointMake(button.tag - 100, self.bottomScrollView.frame.origin.y);
      [self.bottomScrollView setContentOffset:CGPointMake((button.tag - 100)*SCREEN_WIDTH, self.bottomScrollView.frame.origin.y) animated:YES];//animated为YES，会调用-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView；
//      selectedBtn.selected = NO;
//      button.selected = YES;
//      selectedBtn = button;
      
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

      if(!btnTapped)
      {
            [self btnColorGradientWhenScroll:scrollView];
            [self sliderViewScrollWithTheScrollView:scrollView];
      }
      
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
      btnTapped = NO;
      
      if([self.bottomScrollView isEqual:scrollView])
      {
            int x = scrollView.contentOffset.x/SCREEN_WIDTH;
            
            switch (x) {
                  case 0:
                        self.backgroundColor = [UIColor blueColor];
                        break;
                        
                  case 1:
                        self.backgroundColor = [UIColor orangeColor];
                        break;
                  case 2:
                        self.backgroundColor = [UIColor greenColor];
                        break;
                  case 3:
                        self.backgroundColor = [UIColor yellowColor];
                        break;
                  case 4:
                        self.backgroundColor = [UIColor blueColor];
                        break;
                        
                  case 5:
                        self.backgroundColor = [UIColor orangeColor];
                        break;
                  case 6:
                        self.backgroundColor = [UIColor greenColor];
                        break;
                  case 7:
                        self.backgroundColor = [UIColor yellowColor];
                        break;
                        
                  default:
                        break;
            }

            UIButton *button = (UIButton *)[self viewWithTag:100+x];
            button.selected = YES;
            if((selectedBtn.tag-100) != x)
            {
                  selectedBtn.selected = NO;
            }
            
            selectedBtn = button;
            
            self.lineView.frame = CGRectMake(button.frame.origin.x, CGRectGetMaxY(self.topScrollView.frame)-2, button.frame.size.width, 2);
            
            [self setBtnLocationCenter:button];
      }
}

//选中按钮居中显示
- (void)setBtnLocationCenter:(UIButton *)button
{
      CGFloat offSetX = button.center.x - SCREEN_WIDTH/2.0;
      offSetX = offSetX < 0 ? 0:offSetX;
      //最大滑动范围
      CGFloat maxOffSetX = self.topScrollView.contentSize.width - SCREEN_WIDTH;
      offSetX = offSetX > maxOffSetX ? maxOffSetX:offSetX;
      self.topScrollView.contentOffset = CGPointMake(offSetX, 0);
      
}

//滑动过程中，btntitle颜色渐变
-(void)btnColorGradientWhenScroll:(UIScrollView *)scrollView
{
      CGFloat currentX = scrollView.contentOffset.x/scrollView.bounds.size.width;
      UIButton *left_btn = [self viewWithTag:100+(int)currentX];
      UIButton *right_btn = [self viewWithTag:left_btn.tag+1];
      CGFloat rightScale = currentX - (left_btn.tag - 100);
      CGFloat leftScale = 1 - rightScale;
      left_btn.titleLabel.textColor = [UIColor colorWithRed:leftScale green:0 blue:0 alpha:1.0];
      right_btn.titleLabel.textColor = [UIColor colorWithRed:rightScale green:0 blue:0 alpha:1.0];
}

//滑动过程中，按钮下方的滑动条随着滑动
-(void)sliderViewScrollWithTheScrollView:(UIScrollView *)scrollView
{
      CGFloat currentX = scrollView.contentOffset.x/scrollView.bounds.size.width;
      UIButton *left_btn = [self viewWithTag:100+(int)currentX];
      UIButton *right_btn = [self viewWithTag:left_btn.tag+1];
      CGFloat rightScale = currentX - (left_btn.tag - 100);
      CGFloat scrollWidth = right_btn.center.x - left_btn.center.x;
      CGFloat originX = left_btn.frame.origin.x;
      CGRect frame = CGRectMake(originX+scrollWidth*rightScale, self.lineView.frame.origin.y, left_btn.frame.size.width+(right_btn.frame.size.width-left_btn.frame.size.width)*rightScale, 2);
      self.lineView.frame = frame;
}


-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
      [self scrollViewDidEndDecelerating:scrollView];
}

@end
