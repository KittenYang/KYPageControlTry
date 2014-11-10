//
//  AppStoreViewController.h
//  App Store Demo
//
//  Created by Kitten Yang on 14/11/9.
//  Copyright (c) 2014年 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageControlView.h"

@interface AppStoreViewController : UIViewController<UIScrollViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *ImageScrollView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
