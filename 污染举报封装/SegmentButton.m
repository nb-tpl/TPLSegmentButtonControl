//
//  SegmentButton.m
//  污染举报封装
//
//  Created by 谭鄱仑 on 15-3-12.
//  Copyright (c) 2015年 谭鄱仑. All rights reserved.
//

#import "SegmentButton.h"

@implementation SegmentButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor purpleColor];
        //[UIColor colorWithRed:arc4random()%101*0.01 green:arc4random()%101*0.01 blue:arc4random()%101*0.01 alpha:1];
    }
    return self;
}



-(void)beenNormal
{
    self.backgroundColor = [UIColor purpleColor];
}


-(void)beenSelected
{
    self.backgroundColor =[UIColor orangeColor];//[UIColor colorWithRed:arc4random()%101*0.01 green:arc4random()%101*0.01 blue:arc4random()%101*0.01 alpha:1];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
