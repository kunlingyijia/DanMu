//
//  DanMuManger.h
//  自制弹幕
//
//  Created by 席亚坤 on 16/5/12.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DanmuView.h"
@interface DanMuManger : NSObject
@property (nonatomic, strong) NSMutableArray *allComments;
@property (nonatomic, strong) NSMutableArray *tmpComments;
@property (nonatomic, strong) NSMutableArray *bulletQueue;

@property BOOL bStarted;
@property BOOL bStopAnimation;

///弹幕视图
@property(nonatomic,copy)void(^MakeDanMuView)(DanmuView *view);
-(void)start;
-(void)stop;
@end
