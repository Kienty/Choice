# Choice
自定义选择卡选择器,可以自定义选择是否有图片显示
- (void)Choice:(NSInteger)index;//设置默认选中的index
Copy void(^ChoiceBlock)(NSInteger tag);//点击选择的回调

//使用说明
   传空的图片数组可以隐藏图片
    NSArray *noteImgArray = @[@"icon-28",@"icon-29",@"icon-30"];
    NSArray *clickImgArray = @[@"icon-28-click",@"icon-29-click",@"icon-30-click"];
    NSArray *titleArray = @[@"选择1",@"选择2",@"选择3"];
    [_headerView createUI:titleArray
                  noteImg:noteImgArray
                 clickImg:clickImgArray];
    [_headerView Choice:0];
    [self.view addSubview:_headerView];
