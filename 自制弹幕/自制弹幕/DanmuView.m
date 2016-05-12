//
//  DanmuView.m
//  自制弹幕
//
//  Created by 席亚坤 on 16/5/12.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "DanmuView.h"
#define mWidth [UIScreen mainScreen].bounds.size.width
#define mHeight [UIScreen mainScreen].bounds.size.height
#define mDuration   5
#define Padding  5

@implementation DanmuView

-(instancetype)initWithContent:(NSString *)content{
    if ([super init]) {
       //创建子视图
        self.backgroundColor = [UIColor redColor];
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:14]
                                     };
        float width = [content sizeWithAttributes:attributes].width;
        self.bounds = CGRectMake(0, 0, width+2*Padding, 30);
        //创建子视图
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(Padding, 0, width, 30)];
        _contentLabel.text = content;
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:_contentLabel];
    }
    return self;
    
}
- (void)startAnimation {
    
    //根据定义的duration计算速度以及完全进入屏幕的时间
    CGFloat wholeWidth = CGRectGetWidth(self.frame) + mWidth + 50;
    CGFloat speed = wholeWidth/mDuration;
    CGFloat dur = (CGRectGetWidth(self.frame) + 50)/speed;
    
    
    __block CGRect frame = self.frame;
    if (self.MoveBlock) {
        //弹幕开始进入屏幕
        self.MoveBlock(Start);
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(dur * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //dur时间后弹幕完全进入屏幕
        if (self.MoveBlock) {
            self.MoveBlock(Enter);
        }
    });
    
    //弹幕完全离开屏幕
    [UIView animateWithDuration:mDuration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        frame.origin.x = -CGRectGetWidth(frame);
        self.frame = frame;
    } completion:^(BOOL finished) {
        if (self.MoveBlock) {
            self.MoveBlock(End);
        }
        [self removeFromSuperview];
    }];
}


- (void)stopAnimation {
    [self.layer removeAllAnimations];
    [self removeFromSuperview];
}
@end
