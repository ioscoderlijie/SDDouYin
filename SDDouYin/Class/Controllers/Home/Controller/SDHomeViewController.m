//
//  SDHomeViewController.m
//  SDDouYin
//
//  Created by slowdony on 2018/5/15.
//  Copyright © 2018年 slowdony. All rights reserved.
//


#import "SDHomeViewController.h"
#import "SDShowTopView.h"
#import "SDRecommendViewController.h"
#import "SDNearbyViewController.h"
/**
 首页
 */
@interface SDHomeViewController ()
<UIScrollViewDelegate>
///顶部标题
@property (nonatomic,strong) SDShowTopView *showTopView;
///推荐
@property (nonatomic,strong) SDRecommendViewController *recommendVC;
///附近
@property (nonatomic,strong) SDNearbyViewController *nearbyVC;
@property (nonatomic,strong) UIScrollView * mainScrollView;
@end

@implementation SDHomeViewController

-(UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kBottomTabbarHeight);
        _mainScrollView.delegate = self;
        _mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*2,SCREEN_HEIGHT-kBottomTabbarHeight);
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.bounces =NO;
        _mainScrollView.scrollEnabled = NO;
    }
    return _mainScrollView;
}
/**
 附近
 */
-(SDNearbyViewController *)nearbyVC{
    
    if (!_nearbyVC){
        _nearbyVC = [[SDNearbyViewController alloc]init];
        [self addChildViewController:_nearbyVC];
        _nearbyVC.view.frame =CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kBottomTabbarHeight);
    }
    return _nearbyVC;
}
/**
 推荐
 */
-(SDRecommendViewController *)recommendVC{
    
    if (!_recommendVC){
        _recommendVC = [[SDRecommendViewController alloc]init];
        [self addChildViewController:_recommendVC];
        _recommendVC.view.frame =CGRectMake(0,0 , SCREEN_WIDTH, SCREEN_HEIGHT-kBottomTabbarHeight);
    }
    return _recommendVC;
}

-(SDShowTopView *)showTopView{
    if (!_showTopView) {
        NSArray *arr = @[@"推荐",@"附近"];
        CGFloat width = SCREEN_WIDTH;
        _showTopView = [[SDShowTopView alloc]initWithFrame:CGRectMake(0, 0, width, kNavigationStatusBarHeight)];
        _showTopView.selectIndex = 0;
        [_showTopView setTopTitleArr:arr];
        _showTopView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
        KWeakself
        _showTopView.selectBtnBlock = ^(UIButton *selectBtn) {
            CGFloat index = (selectBtn.tag-1000)*SCREEN_WIDTH;
            CGPoint point = CGPointMake(index, 0);
            [weakSelf.mainScrollView setContentOffset:point animated:NO];
        };
    }
    return _showTopView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    
    [self.view addSubview:self.mainScrollView];
    [self.view addSubview:self.showTopView];
    [self.mainScrollView addSubview:self.recommendVC.view];
    
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x ==SCREEN_WIDTH){
        [self.mainScrollView addSubview:self.nearbyVC.view];
    }
}
//scrollview 减速停止时
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat i = self.mainScrollView.contentOffset.x/SCREEN_WIDTH;
    self.showTopView.selectIndex = i;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (void)rightBtnClick:(UIButton *)sender
{
    DLog(@"右按钮");
}
- (void)leftBtnClick:(UIButton *)sender
{
    DLog(@"左按钮");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
