//
//  ViewController.m
//  pageControllers
//
//  Created by Cyrilshanway on 11/13/14.
//  Copyright (c) 2014 Cyrilshanway. All rights reserved.
//

#import "PageViewController.h"
#import "ChildViewController.h"

@interface PageViewController ()<
UIPageViewControllerDataSource
>


@property (nonatomic, strong) NSNumber*pageCount;
@end

@implementation PageViewController

-(void)awakeFromNib{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
        
    
    
    //設定UIPageControl
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];//未點到的點點狀態
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];//點到的頁面時狀態
    pageControl.backgroundColor = [UIColor brownColor];//pagecontrol背景顏色
    
    
    
    
    
        
    
    
    // Do any additional setup after loading the view, typically from a nib.
    //設定頁數
    _pageCount = [NSNumber numberWithInt:5];
    //設定翻頁方式
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    //data source delegate
    self.pageController.dataSource = self;
    //pageControler的frame
    self.pageController.view.frame = CGRectMake(CGRectGetMinX(self.view.frame), CGRectGetMinY(self.view.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.tabBarController.tabBar.frame));
    
    // 設定頁面哪一頁顯示
    ChildViewController *initialViewController = [self viewControllerAtIndex:0];
    [self.pageController setViewControllers:@[initialViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    //把pageController加進childVioewController
    [self addChildViewController:self.pageController];
    //把pageController.view加進view上
    [self.view addSubview:self.pageController.view];
    //使用多子視圖要用在父視圖上的實作方法
    [self.pageController didMoveToParentViewController:self];
}

#pragma mark - 新增method
// 控制頁面展示的方法
- (ChildViewController *)viewControllerAtIndex:(NSUInteger)index{
    ChildViewController *childVC = [self.storyboard instantiateViewControllerWithIdentifier:@"childViewController"];
    
    childVC.pageIndex = index;
    
    return childVC;
}

#pragma mark - UIPageViewControllerDataSource
-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return self.pageCount.integerValue;
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return 0;
}
#pragma mark - UIPageViewControllerDataSource
//require
//往前翻到頭時
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSUInteger index = ((ChildViewController *) viewController).pageIndex;
    //先找到目前翻到哪頁
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    //往後找直到找到最後一個
    index--;
    //回傳最後一個viewController
    return [self viewControllerAtIndex:index];
}
//翻後翻翻到底時
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSUInteger index = ((ChildViewController *) viewController).pageIndex;
    //先找到目前翻到哪頁
    if ((index == NSNotFound) || index == self.pageCount.integerValue) {
        return nil;
    }
    //往後找直到找到最後一個
    index++;
    
    return [self viewControllerAtIndex:index];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
