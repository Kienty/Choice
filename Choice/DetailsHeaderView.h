//
//  DetailsHeaderView.h
//  KeepCar
//
//  Created by MacBook Air on 2017/11/24.
//  Copyright © 2017年 kien. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Copy            @property(nonatomic, copy)
#define Strong          @property(nonatomic, strong)
@interface DetailsHeaderView : UIView
Strong NSMutableArray *btnArray;
Strong NSMutableArray *btnDataArray;
Strong UILabel *xhLabel;
- (void)createUI:(NSArray *)titleArray
         noteImg:(NSArray *)imgArray
        clickImg:(NSArray *)array;
- (void)Choice:(NSInteger)index;//设置默认选中的index
Copy void(^ChoiceBlock)(NSInteger tag);//点击选择的回调
@end
