//
//  SYTabBar.m
//  CustomTabBar
//
//  Created by yang.sun on 2020/7/18.
//  Copyright © 2020 sun. All rights reserved.
//

#import "SYTabBar.h"

@interface SYTabBar ()

//中间按钮
@property (nonatomic,strong)UIButton *midButton;

@end

@implementation SYTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
   

        self.backgroundColor = [UIColor whiteColor];
        
        self.midButton = [UIButton buttonWithType:UIButtonTypeSystem];
//        [_midButton setBackgroundImage:[UIImage imageNamed:@"OrderNavBar"] forState:UIControlStateNormal];
        [_midButton addTarget:self action:@selector(midButtonClick) forControlEvents:UIControlEventTouchUpInside];
//        [_midButton setBackgroundColor:[UIColor redColor]];
        [self addSubview:_midButton];

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
 
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    _midButton.frame = CGRectMake(width / 5 * 2, -26, width / 5, 75);
    
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"OrderNavBar"]];
    imageview.frame = CGRectMake( (width / 5 - 54) / 2, 10, 54, 54);
    [_midButton addSubview:imageview];
    
    [self bringSubviewToFront:self.midButton];
}

//点击了中间按钮
- (void)midButtonClick
{
    //如果tabbar的代理实现了对应的代理方法，那么就调用代理的该方法
    if ([self.delegate respondsToSelector:@selector(tabBarMidButtonClick:)]) {
        [self.myDelegate tabBarMidButtonClick:self];
    }

}

//重写hitTest方法，去监听中间按钮点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {

        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:_midButton];

        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ( [_midButton pointInside:newP withEvent:event]) {
            return _midButton;
        }else{//如果点不在发布按钮身上，直接让系统处理就可以了

            return [super hitTest:point withEvent:event];
        }
    }

    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}

@end


