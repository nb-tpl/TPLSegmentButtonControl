//
//  TPLSegmentSignView.h
//  污染举报封装
//
//  Created by 谭鄱仑 on 15-3-12.
//  Copyright (c) 2015年 谭鄱仑. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TPLSegmentSignModel : NSObject

@property(nonatomic,assign)int index;

@property(nonatomic,assign)CGFloat signWidth;

@property(nonatomic,strong)NSString * signText;

@property(nonatomic,strong)UIColor * signColor;
@end

@interface TPLSegmentSignView : UIView



@property(nonatomic,strong)NSArray * modelsArray;


//中心线颜色
@property(nonatomic,strong)UIColor * centerLineColor;
//中心线粗细
@property(nonatomic,assign)CGFloat   centerLineHeight;
//标志容量
@property(nonatomic,assign)NSInteger signsCount;

//上部，sign的高度
@property(nonatomic,assign)CGFloat signHeight;
//下部，文字描述的高度
@property(nonatomic,assign)CGFloat signLabelHeight;

@end
