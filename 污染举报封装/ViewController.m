//
//  ViewController.m
//  污染举报封装
//
//  Created by 谭鄱仑 on 15-3-12.
//  Copyright (c) 2015年 谭鄱仑. All rights reserved.
//

#import "ViewController.h"
//分段按钮
#import "TPLSegmentButtonControl.h"
#import "SegmentButton.h"

//分段标记
#import "TPLSegmentSignView.h"


@interface ViewController ()
{
    //分段按钮
    TPLSegmentButtonControl * _segmentButtonControl;
    //分段标记
    TPLSegmentSignView * _segmentSignView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //testing
    //分段按钮
    NSMutableArray * modelsArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 3; i++)
    {
        TPLSegmentButtonModel * model = [[TPLSegmentButtonModel alloc] init];
        model.className = @"SegmentButton";
        [modelsArray addObject:model];
    }
    
    _segmentButtonControl = [[TPLSegmentButtonControl alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 65)];
    _segmentButtonControl.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self.view addSubview:_segmentButtonControl];
    _segmentButtonControl.spaceBetween = 2;
    _segmentButtonControl.leftIndent = 5;
    _segmentButtonControl.rightIndent = 5;
    _segmentButtonControl.modelsArray = modelsArray;
    
    
    [_segmentButtonControl addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    
    //分段标记
    NSMutableArray * signModelsArray = [NSMutableArray arrayWithCapacity:0];
    NSArray * dateArray = @[@"3.1",@"3.2",@"3.7",@"3.9",@"3.19",@"3.25"];
    
    for (int i = 0; i < dateArray.count; i++)
    {
        TPLSegmentSignModel * signModel = [[TPLSegmentSignModel alloc] init];
        signModel.signColor = [UIColor colorWithRed:arc4random()%101*0.01 green:arc4random()%101*0.01 blue:arc4random()%101*0.01 alpha:1];
        signModel.signText = [dateArray objectAtIndex:i];
        signModel.index = [[[[dateArray objectAtIndex:i] componentsSeparatedByString:@"."] lastObject] intValue];
        signModel.signWidth = 10;
        [signModelsArray addObject:signModel];
    }

    
    
    _segmentSignView = [[TPLSegmentSignView alloc] initWithFrame:CGRectMake(0, _segmentButtonControl.frame.origin.y + _segmentButtonControl.frame.size.height, self.view.frame.size.width, 25)];
    _segmentSignView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self.view addSubview:_segmentSignView];
    
    _segmentSignView.modelsArray = signModelsArray;
    
    
    
    
    
    
    //点击第一个按钮
    [_segmentButtonControl clickedIndex:0];
}

-(void)valueChange:(TPLSegmentButtonControl*)object
{
    self.view.backgroundColor = object.currentSelectButton.backgroundColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
