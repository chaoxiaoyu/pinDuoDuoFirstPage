//
//  UIView+SliderView.m
//  PinDuoDuoFrameWork
//
//  Created by abc on 17/1/12.
//  Copyright © 2017年 翔天. All rights reserved.
//

#import "UIView+SliderView.h"

@implementation UIView (SliderView)


-(CGFloat)Slider_originX
{
      return self.frame.origin.x;
}

-(CGFloat)Slider_originY
{
      return self.frame.origin.y;
}

-(CGFloat)Slider_width
{
      return self.frame.size.width;
}

-(CGFloat)Slider_height
{
      return self.frame.size.height;
}

-(CGFloat)Slider_rightX
{
      return CGRectGetMaxX(self.frame);
}

-(CGFloat)Slider_centerX
{
      return self.center.x;
}

-(CGFloat)Slider_centerY
{
      return self.center.y;
}

-(CGSize)Slider_size
{
      return self.frame.size;
}

-(void)setSlider_size:(CGSize)Slider_size
{
      CGRect frame = self.frame;
      frame.size = Slider_size;
      self.frame = frame;
}

-(void)setSlider_width:(CGFloat)Slider_width
{
      CGRect frame = self.frame;
      frame.size.width = Slider_width;
      self.frame = frame;
}

-(void)setSlider_height:(CGFloat)Slider_height
{
      CGRect frame = self.frame;
      frame.size.height = Slider_height;
      self.frame = frame;
}

-(void)setSlider_rightX:(CGFloat)Slider_rightX
{
      self.Slider_originX = Slider_rightX - self.Slider_width;
}

-(void)setSlider_centerX:(CGFloat)Slider_centerX
{
      CGPoint center = self.center;
      center.x = Slider_centerX;
      self.center = center;
}

-(void)setSlider_centerY:(CGFloat)Slider_centerY
{
      CGPoint center = self.center;
      center.y = Slider_centerY;
      self.center = center;
}

-(void)setSlider_originX:(CGFloat)Slider_originX
{
      CGRect frame = self.frame;
      frame.origin.x = Slider_originX;
      self.frame = frame;
}

-(void)setSlider_originY:(CGFloat)Slider_originY
{
      CGRect frame = self.frame;
      frame.origin.y = Slider_originY;
      self.frame = frame;

}

@end
