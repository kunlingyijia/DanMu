//
//  DanmuView.h
//  自制弹幕
//
//  Created by 席亚坤 on 16/5/12.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <UIKit/UIKit.h>
///评论移动状态
typedef NS_ENUM(NSInteger,CommentMoveStatus){
    ///开始
    Start,
    ///输入
    Enter,
    ///结束
    End
    
};
///轨迹
typedef NS_ENUM(NSInteger,Trajectory){
    Trajectory_1,
    Trajectory_2,
    Trajectory_3,
};
@interface DanmuView : UIView
///评论移动状态Block
@property(nonatomic,copy) void(^MoveBlock)(CommentMoveStatus status);
///轨迹

@property (nonatomic,assign) Trajectory trajectory ;

///评论Label
@property (nonatomic, strong) UILabel *contentLabel ;

-(instancetype)initWithContent:(NSString *)content;
///开始动画
- (void)startAnimation;
///停止动画
- (void)stopAnimation;

@end
