//
//  TPLSegmentButtonControl.h
//  污染举报封装
//
//  Created by 谭鄱仑 on 15-3-12.
//  Copyright (c) 2015年 谭鄱仑. All rights reserved.
//

#import <UIKit/UIKit.h>


//按钮基本数据模型,TPLSegmentButtonControl通过这些模型实例化出不同的按钮对象
@interface TPLSegmentButtonModel : NSObject

//按钮类名，必须要是TPLSegmentButton的子类
@property(nonatomic,strong)NSString * className;

@end


//按钮基本类，使用的时候通过继承按钮这个达到多样化
@interface TPLSegmentButton : UIView

@property(nonatomic,strong)TPLSegmentButtonModel * model;



//暴漏出来的方法,用于覆写
-(void)beenNormal;
-(void)beenSelected;


@end

@interface TPLSegmentButtonControl : UIControl


#pragma mark
#pragma mark           信息
#pragma mark
@property(nonatomic,readonly)TPLSegmentButton * currentSelectButton;


#pragma mark
#pragma mark           配置信息
#pragma mark
//按钮上缩进
@property(nonatomic,assign)CGFloat upIndent;
//按钮下缩进
@property(nonatomic,assign)CGFloat bottomIndent;
//按钮左缩进
@property(nonatomic,assign)CGFloat leftIndent;
//按钮右缩进
@property(nonatomic,assign)CGFloat rightIndent;
//按钮间距
@property(nonatomic,assign)CGFloat spaceBetween;


//数据模型数组，根据传入的数组，去掉之前的按钮，重新创建新的按钮
@property(nonatomic,strong)NSArray * modelsArray;





//不重创视图，仅刷新数据
-(void)refreshViewWithModelArray:(NSArray*)modlesArray;


//触发指定按钮
-(void)clickedIndex:(NSInteger)index;



@end
