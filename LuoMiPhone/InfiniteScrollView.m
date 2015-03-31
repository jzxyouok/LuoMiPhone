//
//  InfiniteScrollView.m
//  InfiniteScrollView
//
//  Created by Tim Geng on 1/13/15.
//  Copyright (c) 2015 PwC. All rights reserved.
//

#import "InfiniteScrollView.h"

@interface InfiniteScrollView () <UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,assign) NSUInteger currentIndex;
@property(nonatomic,strong) NSArray *displayViews;
@property(nonatomic) CGFloat previousScrollViewOffsetX;
@property(nonatomic,strong) UIPageControl *pageControl;
@property(nonatomic,strong) NSTimer *timer;

@end

@implementation InfiniteScrollView


-(void)scrolltorect{
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:YES];

}

-(void)setAutomaticScroll:(BOOL)automaticScroll{
    if (automaticScroll) {
        [self.timer fire];
    }else{
        if (self.timer.valid) {
            [self.timer invalidate];
        }
    }
}

-(void)viewTappedInScrollview:(UIGestureRecognizer *)tap
{
    if (self.viewTapped) {
        self.viewTapped(self.currentIndex);
    }
}

-(void)setViews:(NSArray *)views{
    for (int i = 0; i < views.count; i++) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTappedInScrollview:)];
        UIView *view = [views objectAtIndex:i];
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:tapGesture];
    }
    
    self.currentIndex = 0;
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * 3, self.frame.size.height);
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.previousScrollViewOffsetX = self.frame.size.width;
    self.displayViews = views;
    [self setContentViews:views currentIndex:self.currentIndex];
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.frame.size.width - 150, self.frame.size.height - 30 , 200, 30)];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.currentPage = self.currentIndex;
    self.pageControl.numberOfPages = views.count;
    self.timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    
   [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"GroupByScrollCancel"] forState:UIControlStateNormal];
    button.frame = CGRectMake(self.scrollView.frame.size.width - 30, 5, 30, 30);
    [button addTarget:self action:@selector(closeButton) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 20;
    button.layer.masksToBounds = YES;
    
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    
    [self addSubview:button];
}

-(void)closeButton{
    if (self.closeButtonClicked) {
        self.closeButtonClicked();
    }
}

-(void)autoScroll{
    NSLog(@"auto scroll invoked");
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x + self.scrollView.frame.size.width, self.scrollView.contentOffset.y) animated:YES];
}



-(id)initWithFrame:(CGRect)frame withViews:(NSArray *)views{
    if (self = [super initWithFrame:frame]) {
        self.currentIndex = 0;
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.contentSize = CGSizeMake(self.frame.size.width * 3, self.frame.size.height);
        self.scrollView.delegate = self;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.previousScrollViewOffsetX = self.frame.size.width;
        self.displayViews = views;
        [self setContentViews:views currentIndex:self.currentIndex];
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 100, self.frame.size.height , 200, 30)];
        self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        self.pageControl.currentPage = self.currentIndex;
        self.pageControl.numberOfPages = views.count;
        self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
        
    }
    return self;
}

-(void)setContentViews:(NSArray *)views currentIndex:(NSInteger)index {
    if (self.currentIndex == 0) {
        
        UIView *view = [views objectAtIndex:views.count - 1];
        view.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self.scrollView addSubview:view];
        
        for (NSInteger i = 0; i < 2; i++) {
            UIView *view = [views objectAtIndex:i];
            view.frame = CGRectMake(self.frame.size.width * (i + 1), 0, self.frame.size.width, self.frame.size.height);
            [self.scrollView addSubview:view];
        }
    } else if (self.currentIndex == (views.count - 1)) {
        
        UIView *view = [views objectAtIndex:0];
        view.frame = CGRectMake(2 * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        [self.scrollView addSubview:view];
        
        for (NSInteger i = (views.count - 2); i < views.count; i++) {
            UIView *view = [views objectAtIndex:i];
            view.frame = CGRectMake(self.frame.size.width * (i - (views.count - 2)), 0, self.frame.size.width, self.frame.size.height);
            [self.scrollView addSubview:view];
        }
    } else {
        for (NSInteger i = self.currentIndex - 1; i < self.currentIndex + 2; i++) {
            UIView *view = [views objectAtIndex:i];
            view.frame = CGRectMake(self.frame.size.width * (i - (self.currentIndex - 1)), 0, self.frame.size.width, self.frame.size.height);
            [self.scrollView addSubview:view];
        }
    }
    self.previousScrollViewOffsetX = self.frame.size.width;

  //  [self.scrollView scrollRectToVisible:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) animated:YES];
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.previousScrollViewOffsetX = scrollView.contentOffset.x;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}// called on finger up as we are moving


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    [self setScrollViewParameters:scrollView];
}

-(void)setScrollViewParameters:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x > self.previousScrollViewOffsetX) {
        self.currentIndex = self.currentIndex + 1;
    }else if(scrollView.contentOffset.x < self.previousScrollViewOffsetX){
        self.currentIndex = self.currentIndex - 1;
    }
    if (self.currentIndex == self.displayViews.count ) {
        self.currentIndex = 0;
    }
    if (self.currentIndex == -1) {
        self.currentIndex = self.displayViews.count - 1;
    }
    self.previousScrollViewOffsetX = scrollView.contentOffset.x;
    [self setContentViews:self.displayViews currentIndex:self.currentIndex];
    self.pageControl.currentPage = self.currentIndex;
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self setScrollViewParameters:scrollView];

}

@end
