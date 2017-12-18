//
//  ViewController.m
//  Choice
//
//  Created by MacBook Air on 2017/12/18.
//  Copyright © 2017年 kien. All rights reserved.
//

#import "ViewController.h"
#import "DetailsHeaderView.h"
//block self
#define WeakSelf        __weak __typeof(self) wself = self;
//Window相关
#define Screen_Width                 [UIScreen mainScreen].bounds.size.width
#define Screen_Height                [UIScreen mainScreen].bounds.size.height
#define Frame(Xpos, Ypos, Width, Height)   CGRectMake(Xpos, Ypos, Width, Height)
#define Strong          @property(nonatomic, strong)

@interface ViewController ()
Strong DetailsHeaderView *headerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self choiceView];
     
}
//左边图片，右边文字
- (void)choiceView{
    _headerView = [[DetailsHeaderView alloc] initWithFrame:Frame(0, 100, Screen_Width, 45)];
    NSArray *noteImgArray = @[@"icon-28",@"icon-29",@"icon-30"];
    NSArray *clickImgArray = @[@"icon-28-click",@"icon-29-click",@"icon-30-click"];
    NSArray *titleArray = @[@"基本信息",@"维修记录",@"历史消费"];
    [_headerView createUI:titleArray
                  noteImg:noteImgArray
                 clickImg:clickImgArray];
    [_headerView Choice:0];
    [self.view addSubview:_headerView];
    WeakSelf;
    _headerView.ChoiceBlock = ^(NSInteger tag) {
//        wself.type = tag;
//        if (tag == 0) {
//            wself.detailsTab.hidden = NO;
//            wself.recordTab.hidden = YES;
//            wself.historyTab.hidden = YES;
//            [wself.detailsTab reloadData];
//        }else if (tag == 1){
//            wself.detailsTab.hidden = YES;
//            wself.recordTab.hidden = NO;
//            wself.historyTab.hidden = YES;
//            [wself.recordTab reloadData];
//        }else if (tag == 2){
//            wself.detailsTab.hidden = YES;
//            wself.recordTab.hidden = YES;
//            wself.historyTab.hidden = NO;
//            [wself.historyTab reloadData];
//        }
//        [wself createTime];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
