//
//  DetailsHeaderView.m
//  KeepCar
//
//  Created by MacBook Air on 2017/11/24.
//  Copyright © 2017年 kien. All rights reserved.
//

#import "DetailsHeaderView.h"
//block self
#define WeakSelf        __weak __typeof(self) wself = self;
//Window相关
#define Screen_Width                 [UIScreen mainScreen].bounds.size.width
#define Screen_Height                [UIScreen mainScreen].bounds.size.height
#define SetFrameByXPos(frame,xpos)        {CGRect rect = frame; rect.origin.x = xpos; frame = rect;}
#define Frame(Xpos, Ypos, Width, Height)   CGRectMake(Xpos, Ypos, Width, Height)
#define VIEW_HEIGHT(view)  view.frame.size.height
#define VIEW_ORGIN_X(view)  view.frame.origin.x
@implementation DetailsHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [self colorFromHexRGB:@"f7f8fb"];
        self.btnArray = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)createUI:(NSArray *)titleArray
         noteImg:(NSArray *)imgArray
        clickImg:(NSArray *)array{
    for (int i=0; i<titleArray.count; i++) {
        float x = Screen_Width/3;
        UIButton *btn = [self objectBtn];
        SetFrameByXPos(btn.frame, i*x);
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:imgArray[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:array[i]] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.btnArray addObject:btn];
    }
    
    _xhLabel = [[UILabel alloc] initWithFrame:Frame(0, VIEW_HEIGHT(self)-1, Screen_Width/3, 1)];
    _xhLabel.backgroundColor = [self colorFromHexRGB:@"8fc843"];
    [self addSubview:_xhLabel];
}
- (UIButton *)objectBtn{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, Screen_Width/3, 45);
    button.backgroundColor = [UIColor clearColor];
    button.imageEdgeInsets = UIEdgeInsetsMake(10, 20, 10, 60);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -button.currentImage.size.width+15, 0, 0);
    [button setTitleColor:[self colorFromHexRGB:@"696969"] forState:UIControlStateNormal];
    [button setTitleColor:[self colorFromHexRGB:@"8fc843"] forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    return button;
}
- (void)btnClick:(UIButton *)sender{
    [self Choice:sender.tag];
    if (self.ChoiceBlock) {
        self.ChoiceBlock(sender.tag);
    }
}
- (void)Choice:(NSInteger)index{
    UIButton *btn1 = (UIButton *)self.btnArray[index];
    for (UIButton *btn in self.btnArray) {
        if (btn.tag == btn1.tag) {
            btn.selected = YES;
        }else{
            btn.selected = NO;
        }
    }
    WeakSelf;
    [UIView animateWithDuration:0.25 animations:^{
        SetFrameByXPos(wself.xhLabel.frame, VIEW_ORGIN_X(btn1));
    }];
   
}
////根据16进制显示颜色
- (id)colorFromHexRGB:(NSString *)inColorString {
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    if (![self isEmptyString:inColorString]) {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha: 1.0];
    return result;
}
//字符串为空检查
- (BOOL)isEmptyString:(NSString *)sourceStr1 {
    //    NSString *sourceStr1 = [NSString stringWithFormat:@"%@",sourceStr];
    if ((NSNull *)sourceStr1 == [NSNull null]) {
        return YES;
    }
    if (sourceStr1 == NULL) {
        return YES;
    }
    if (sourceStr1 == nil) {
        return YES;
    }
    if ([sourceStr1 isEqualToString:@""]) {
        return YES;
    }
    if (sourceStr1.length == 0) {
        return YES;
    }
    if ([sourceStr1 isEqualToString:@"null"]) {
        return YES;
    }
    if ([sourceStr1 isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([sourceStr1 isEqualToString:@"<null>"]) {
        return YES;
    }
    return NO;
}
@end
