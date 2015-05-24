//
//  TPLSegmentButtonControl.m
//  污染举报封装
//
//  Created by 谭鄱仑 on 15-3-12.
//  Copyright (c) 2015年 谭鄱仑. All rights reserved.
//

#import "TPLSegmentButtonControl.h"






@implementation TPLSegmentButtonModel



@end


@implementation TPLSegmentButton

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}


-(void)beenNormal
{
    self.backgroundColor = [UIColor whiteColor];
}


-(void)beenSelected
{
    self.backgroundColor = [UIColor yellowColor];
}


@end




@interface TPLSegmentButtonControl ()
{
//view
    NSMutableArray * _buttonsArray;
    NSArray * _modelsArray;
//data
    NSString * _buttonClassName;
//辅助变量
}
@end

@implementation TPLSegmentButtonControl

#pragma mark
#pragma mark           property
#pragma mark
//数据模型数组，根据传入的数组，去掉之前的按钮，重新创建新的按钮
-(void)setModelsArray:(NSArray *)modelsArray
{
    //清空之前的按钮
    for (TPLSegmentButton * button in _buttonsArray)
    {
        [button removeFromSuperview];
    }
    [_buttonsArray removeAllObjects];
    
    //更改按钮模型数据
    _modelsArray = modelsArray;
    
    //根据新的模型数据创建按钮
    for (TPLSegmentButtonModel * model in _modelsArray)
    {
        TPLSegmentButton * button = [[NSClassFromString(model.className) alloc] init];
        if (!button || ![button isKindOfClass:[TPLSegmentButton class]])//如果类名有误,或者不是TPLSegmentButton的子类
        {
            button = [[NSClassFromString(@"TPLSegmentButton") alloc] init];

        }
        [self addSubview:button];
        [_buttonsArray addObject:button];
        //添加手势
        UITapGestureRecognizer * tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapOne:)];
        tapOne.numberOfTapsRequired = 1;
        [button addGestureRecognizer:tapOne];
    }
    
    //排列并刷新数据
    [self viewRefresh:YES dataRefresh:YES];
}

//配置
-(void)setUpIndent:(CGFloat)upIndent
{
    _upIndent = upIndent;
    [self viewRefresh:YES dataRefresh:NO];
}
-(void)setBottomIndent:(CGFloat)bottomIndent
{
    _bottomIndent = bottomIndent;
    [self viewRefresh:YES dataRefresh:NO];
}
-(void)setLeftIndent:(CGFloat)leftIndent
{
    _leftIndent = leftIndent;
    [self viewRefresh:YES dataRefresh:NO];
}
-(void)setRightIndent:(CGFloat)rightIndent
{
    _rightIndent = rightIndent;
    [self viewRefresh:YES dataRefresh:NO];
}
-(void)setSpaceBetween:(CGFloat)spaceBetween
{
    _spaceBetween = spaceBetween;
    [self viewRefresh:YES dataRefresh:NO];
}

#pragma mark
#pragma mark           init
#pragma mark

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //初始化
        _buttonsArray = [[NSMutableArray alloc] initWithCapacity:0];
        _modelsArray = @[];
        //配置
        _upIndent = 0;
        _bottomIndent = 0;
        _leftIndent = 0;
        _rightIndent = 0;
        _spaceBetween = 0;
        
    }
    return self;

}

#pragma mark
#pragma mark           touch & clicked & UIGestureRecognizer
#pragma mark
-(void)buttonTapOne:(UITapGestureRecognizer*)tapOne
{
    static int i = 0; //防止多次点击
    if (0 == i && _currentSelectButton != tapOne.view)
    {
        i = 1;
        NSInteger index = [_buttonsArray indexOfObject:tapOne.view];
        [self clickedIndex:index];
        i = 0;
    }
    else
    {
        return;
    }
    
}

#pragma mark
#pragma mark           show
#pragma mark

//刷新视图
-(void)viewRefresh:(BOOL)viewRefresh dataRefresh:(BOOL)dataRefresh
{
    if (_buttonsArray.count > 0)
    {
        CGFloat x = _leftIndent;
        CGFloat y = _upIndent;
        CGFloat buttonWidth = (self.frame.size.width - _leftIndent - _rightIndent - _spaceBetween*(_buttonsArray.count - 1))/_buttonsArray.count;
        CGFloat buttonHeight = self.frame.size.height - _upIndent - _bottomIndent;
        for (int i = 0;i < _buttonsArray.count;i++)
        {
            TPLSegmentButton * button = [_buttonsArray objectAtIndex:i];
            if (viewRefresh)
            {
                x = i*(buttonWidth+_spaceBetween)+_leftIndent;
                CGRect frame = CGRectMake(x, y, buttonWidth, buttonHeight);
                button.frame = frame;
            }
            if (dataRefresh)
            {
                button.model = [_modelsArray objectAtIndex:i];
            }
        }
    }
}

//刷新数据
-(void)refreshViewWithModelArray:(NSArray*)modlesArray
{
    _modelsArray = modlesArray;
    [self viewRefresh:NO dataRefresh:YES];
    
}


#pragma mark
#pragma mark           function
#pragma mark
//触发指定按钮
-(void)clickedIndex:(NSInteger)index
{
    [_currentSelectButton beenNormal];
    _currentSelectButton = [_buttonsArray objectAtIndex:index];
    [_currentSelectButton beenSelected];
    [self sendActionsForControlEvents:UIControlEventValueChanged];

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
