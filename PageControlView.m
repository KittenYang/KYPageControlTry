//
//  PageControlView.m
//  App Store Demo
//
//  Created by Kitten Yang on 14/11/10.
//  Copyright (c) 2014年 Kitten Yang. All rights reserved.
//

#import "PageControlView.h"
#import "UIViewExt.h"
#define PageHeight 10
#define PageWidth  10

@implementation PageControlView{
    UIView *pageIndicator;
}


-(id)initWithOrigin:(CGPoint)pageOrigin PageNumber:(int)pageNumber{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(pageOrigin.x, pageOrigin.y, (PageWidth+20)*pageNumber, (PageHeight+20));
        for (int i = 0; i<pageNumber; i++) {
            UIImageView *page = [[UIImageView alloc]initWithFrame:CGRectMake(20+i*PageWidth+i*5, (self.height - PageWidth)/2 + 5, PageWidth, PageHeight)];
            page.backgroundColor = [UIColor whiteColor];
            [self addSubview:page];
        }
        
    }
    self.backgroundColor = [UIColor clearColor];
    
    pageIndicator = [[UIView alloc]initWithFrame:CGRectMake(20,(self.height - PageWidth)/2 +5, PageWidth, PageHeight)];
    pageIndicator.backgroundColor = [UIColor redColor];
    [self addSubview:pageIndicator];
    return self;
}

-(void)moveThePage:(double)distance{
    pageIndicator.frame = CGRectMake(20+distance*(PageWidth+5),(self.height - PageWidth)/2 +5  , PageWidth, PageHeight);
}



@end
