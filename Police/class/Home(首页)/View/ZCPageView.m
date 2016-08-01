//
//  ZCPageView.m
//  Police
//
//  Created by ZhangCheng on 16/7/23.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCPageView.h"
#define ZCImageViewCount 3

@interface ZCPageView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
/** 存放图片控件*/
@property (nonatomic, strong) NSMutableArray *imageViews;
/** */
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation ZCPageView

- (NSMutableArray *)imageViews{
    if (_imageViews == nil) {
        _imageViews = [NSMutableArray array];
    }
    
    return _imageViews;
}

+ (instancetype)pageView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (void)awakeFromNib
{
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    

    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    
    for (int i = 0; i < ZCImageViewCount; i++) {
        UIImageView *imageView  = [[UIImageView alloc] init];
        [self.scrollView addSubview:imageView];
        [self.imageViews addObject:imageView];
    }
    
    
}

- (void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;

    self.pageControl.numberOfPages = imageNames.count;
    self.pageControl.currentPage = 0;
    
    [self updateContent];
    [self startAutoScroll];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.scrollView.contentSize = CGSizeMake(self.width * ZCImageViewCount, self.height);
    
    
    
    
    for (int i = 0; i < ZCImageViewCount; i ++) {
        UIImageView *imgView = self.imageViews[i];
        imgView.frame = CGRectMake( self.width * i, 0, self.width, self.height);
        
    }
    
    
}

#pragma mark - 开始／暂停自动滚动
- (void)startAutoScroll{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    self.timer = timer;


}

- (void)stopAutoScroll{

    [self.timer setFireDate:[NSDate distantFuture]];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 找出最中间的那个图片控件
    NSInteger page = 0;
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i< ZCImageViewCount; i++) {
        UIImageView *imageView = self.imageViews[i];
        CGFloat distance = 0;

        distance = ABS(imageView.frame.origin.x - scrollView.contentOffset.x);

        if (distance < minDistance) {
            minDistance = distance;
            page = imageView.tag;
        }
    }
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopAutoScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

    [self startAutoScroll];
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updateContent];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self updateContent];
}

#pragma mark - 滚动到下一页
- (void)nextPage{

    [self.scrollView setContentOffset:CGPointMake(2 * self.width, 0) animated:YES];
    
}

#pragma mark - 内容更新
- (void)updateContent
{
    // 设置图片
    for (int i = 0; i< ZCImageViewCount; i++) {
        
        
        UIImageView *imageView = self.imageViews[i];
        NSInteger index = self.pageControl.currentPage;
        
        
        
        if (i == 0) {
            index--;
        } else if (i == 2) {
            index++;
        }
        
        
        
        if (index < 0) {
            index = self.pageControl.numberOfPages - 1;
        } else if (index >= self.pageControl.numberOfPages) {
            index = 0;
        }
        
        
        imageView.tag = index;
        imageView.image = [UIImage imageNamed:self.imageNames[index]];
        
    }
    
    // 设置偏移量在中间

    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);

}


@end
