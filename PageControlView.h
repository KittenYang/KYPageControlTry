//
//  PageControlView.h
//  App Store Demo
//
//  Created by Kitten Yang on 14/11/10.
//  Copyright (c) 2014年 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageControlView : UIView
-(id)initWithOrigin:(CGPoint)pageOrigin PageNumber:(int)pageNumber;
-(void)moveThePage:(double)distance;
@end

