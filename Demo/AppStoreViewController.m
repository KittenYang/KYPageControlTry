//
//  AppStoreViewController.m
//  App Store Demo
//
//  Created by Kitten Yang on 14/11/9.
//  Copyright (c) 2014年 Kitten Yang. All rights reserved.
//

#import "AppStoreViewController.h"
#import "UIViewExt.h"
#import "UIColor+KYRandomColor.h"


#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation AppStoreViewController{
    UIView *pageIndicator;
    PageControlView *pageControlView;
    NSTimer *timer;
}

-(void)viewDidLoad{
    //最大的ScrollView
    self.scrollView.frame = CGRectMake(0,0,ScreenWidth,ScreenHeight);
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, 850);
    
    //轮播ScrollView
    self.ImageScrollView = [[UIScrollView alloc]init];
    self.ImageScrollView.frame = CGRectMake(0, 0, ScreenWidth, 200);
    self.ImageScrollView.pagingEnabled = YES;
    self.ImageScrollView.contentSize = CGSizeMake(self.ImageScrollView.frame.size.width*3, self.ImageScrollView.frame.size.height);
    self.ImageScrollView.bounces = NO;
    self.ImageScrollView.showsHorizontalScrollIndicator = NO;
    self.ImageScrollView.delegate  =self;
    self.ImageScrollView.tag = 101;
    
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*ScreenWidth, 0,ScreenWidth, 200)];
        NSLog(@"imageView.frame%d:%@",i, NSStringFromCGRect(imageView.frame));
        [self.ImageScrollView addSubview:imageView];
        NSString *imageName = [NSString stringWithFormat:@"img_%d",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.contentMode = UIViewContentModeScaleToFill;
    }
    [self.scrollView addSubview:self.ImageScrollView];
    
    //pageControl
    pageControlView = [[PageControlView alloc]initWithOrigin:CGPointMake(0, self.ImageScrollView.bottom - 40) PageNumber:3];
    [self.scrollView addSubview:pageControlView];
    timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    
    //CollectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(30, self.ImageScrollView.bottom+10, ScreenWidth,150) collectionViewLayout:flowLayout];
    
    
}

-(void)addTimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}


-(void)nextImage{
    [UIView animateWithDuration:0.5 animations:^{
        if (self.ImageScrollView.contentOffset.x == ScreenWidth*2) {
            self.ImageScrollView.contentOffset = CGPointMake(0,0);
        }else if(self.ImageScrollView.contentOffset.x == ScreenWidth *1 ){
            self.ImageScrollView.contentOffset = CGPointMake(ScreenWidth*2,0);
        }else if(self.ImageScrollView.contentOffset.x == 0){
            self.ImageScrollView.contentOffset = CGPointMake(ScreenWidth,0);
        }
    }];
}

#pragma mark - UIScorllViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double distance = self.ImageScrollView.contentOffset.x/ScreenWidth;
    
    if ([pageControlView respondsToSelector:@selector(moveThePage:)]) {
        [pageControlView moveThePage:distance];
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (scrollView.tag == 101) {
        [timer invalidate];
    }
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.tag == 101) {
        [self addTimer];
    }
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor randomColor];
    return cell;
}




@end
