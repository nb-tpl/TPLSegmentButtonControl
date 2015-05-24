//
//  TPLSegmentSignView.m
//  污染举报封装
//
//  Created by 谭鄱仑 on 15-3-12.
//  Copyright (c) 2015年 谭鄱仑. All rights reserved.
//

#import "TPLSegmentSignView.h"



@implementation TPLSegmentSignModel



@end

@interface TPLSegmentSignView ()
{
//view
    NSMutableArray * _signsArray;
    NSMutableArray * _signLabelsArray;
    UIView * _centerLine;
}

@end

@implementation TPLSegmentSignView


#pragma mark
#pragma mark           porperty
#pragma mark
-(void)setModelsArray:(NSArray *)modelsArray
{
    //清空
    for (UIView * view in _signsArray)
    {
        [view removeFromSuperview];
    }
    [_signsArray removeAllObjects];
    for (UIView * view in _signLabelsArray)
    {
        [view removeFromSuperview];
    }
    [_signLabelsArray removeAllObjects];
    
    _modelsArray = modelsArray;
    
    for (int i = 0; i < _modelsArray.count; i++)
    {
        UIView * sign = [[UIView alloc] init];
        [_signsArray addObject:sign];
        [self addSubview:sign];
        UILabel * label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:8];
        label.textAlignment = NSTextAlignmentCenter;
        [_signLabelsArray addObject:label];
        [self addSubview:label];
    }
    
    [self viewRefresh:YES dataRefresh:YES];
}

//中心线颜色
-(void)setCenterLineColor:(UIColor *)centerLineColor
{
    _centerLineColor = centerLineColor;
    _centerLine.backgroundColor = centerLineColor;
}
//中心线粗细
-(void)setCenterLineHeight:(CGFloat)centerLineHeight
{
    _centerLineHeight = centerLineHeight;
    _centerLine.frame = CGRectMake(_centerLine.frame.origin.x, (_signHeight - _centerLineHeight)/2, self.frame.size.width, _centerLineHeight);}
//标志容量
-(void)setSignsCount:(NSInteger)signsCount
{
    _signsCount = signsCount;
    [self viewRefresh:YES dataRefresh:NO];
}

//上部，sign的高度
-(void)setSignHeight:(CGFloat)signHeight
{
    _signHeight = signHeight;
    [self viewRefresh:YES dataRefresh:NO];
}
//下部，文字描述的高度
-(void)setSignLabelHeight:(CGFloat)signLabelHeight
{
    _signLabelHeight = signLabelHeight;
    [self viewRefresh:YES dataRefresh:NO];
}


#pragma mark
#pragma mark           init
#pragma mark
-(void)initConfig
{
    _centerLineColor = [UIColor blackColor];
    _centerLineHeight = 1;
    _signsCount = 31;
    _signHeight = 12;
    _signLabelHeight = 15;
}
-(void)initData
{
    _signsArray = [[NSMutableArray alloc] initWithCapacity:0];
    _signLabelsArray = [[NSMutableArray alloc] initWithCapacity:0];
}
-(void)initBaseView
{
    _centerLine = [[UIView alloc] initWithFrame:CGRectMake(0, (_signHeight - _centerLineHeight)/2, self.frame.size.width, _centerLineHeight)];
    _centerLine.backgroundColor = _centerLineColor;
    [self addSubview:_centerLine];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        [self initConfig];
        [self initData];
        [self initBaseView];

        
    }
    return self;
}


#pragma mark
#pragma mark           show
#pragma mark

-(void)viewRefresh:(BOOL)viewRefresh dataRefresh:(BOOL)dataRefresh
{
    _centerLine.frame = CGRectMake(_centerLine.frame.origin.x, (_signHeight - _centerLineHeight)/2, self.frame.size.width, _centerLineHeight);
    CGFloat signWidth = self.frame.size.width/_signsCount;
    for (int i = 0; i < _signsArray.count; i++)
    {
        UIView * sign = [_signsArray objectAtIndex:i];
        UILabel * label = [_signLabelsArray objectAtIndex:i];
        TPLSegmentSignModel * model = [_modelsArray objectAtIndex:i];
        if (viewRefresh)
        {
            label.frame = CGRectMake((model.index - 1)*signWidth - 4, _signHeight, signWidth + 8, _signLabelHeight);
            sign.frame = CGRectMake(0, 0, model.signWidth, model.signWidth);
                        sign.layer.cornerRadius = model.signWidth/2;
            sign.center = CGPointMake(label.center.x, _signHeight/2);
        }
        if (dataRefresh)
        {
            sign.backgroundColor = model.signColor;
            label.text = model.signText;
            label.adjustsFontSizeToFitWidth = YES;
        }
    }
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
