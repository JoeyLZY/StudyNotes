//
//  MyYellowManView.m
//  02-SmallYellowMan
//
//  Created by 林志颖 on 15/3/31.
//  Copyright (c) 2015年 林志颖. All rights reserved.
//

#import "MyYellowManView.h"
#define YMTopY 250
#define YMRadius 150
#define YMColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
BOOL isShake=NO;
@interface MyYellowManView()
//@property (nonatomic, assign) BOOL isShake;
@end
@implementation MyYellowManView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(change) userInfo:nil repeats:YES];
    
    
}

- (void)change {
    isShake = !isShake;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
   
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    drawBody(ctx, rect);
    
    drawMouth(ctx, rect);
    
    drawEyes(ctx, rect);
    
    drawHair(ctx, rect);
    
}

void drawHair(CGContextRef ctx, CGRect rect) {
    [[UIColor blackColor] set];
    CGContextSetLineWidth(ctx, 1);
    CGFloat topX = rect.size.width * 0.5;
    CGFloat topY = YMTopY - YMRadius+5;
    CGContextMoveToPoint(ctx, topX, topY);
    CGContextAddLineToPoint(ctx, topX+(isShake?5:0), topY-30);

    CGContextMoveToPoint(ctx, topX+10, topY);
    CGContextAddLineToPoint(ctx, topX+20+(isShake?3:0), topY-30);
    
    CGContextMoveToPoint(ctx, topX+20, topY+5);
    CGContextAddLineToPoint(ctx, topX+35+(isShake?2:0), topY-30);
    
    CGContextMoveToPoint(ctx, topX-10, topY);
    CGContextAddLineToPoint(ctx, topX-20+(isShake?1:0), topY-30);
    
    CGContextMoveToPoint(ctx, topX-20, topY);
    CGContextAddLineToPoint(ctx, topX-30+(isShake?2:0), topY-30);
    
    CGContextStrokePath(ctx);
}

void drawEyes(CGContextRef ctx, CGRect rect) {
    // 1.黑色绑带
    CGFloat startX = rect.size.width * 0.5 - YMRadius;
    CGFloat startY = YMTopY;
    CGContextMoveToPoint(ctx, startX, startY);
    
    CGFloat endX = startX + 2*YMRadius;
    CGFloat endY = startY;
    CGContextAddLineToPoint(ctx, endX, endY);
    
    CGContextSetLineWidth(ctx, 15);
    
    CGContextStrokePath(ctx);
    
    // 2.外圈镜框
    [YMColor (61,62,66) set];
    CGFloat kuangRadius = YMRadius * 0.47;
    CGFloat kuangY = startY;
    CGFloat kuangX = rect.size.width * 0.5 - kuangRadius+5;
    CGFloat rKuangX = rect.size.width-kuangX;
    CGFloat rKuangY = kuangY;
    CGContextAddArc(ctx, kuangX, kuangY, kuangRadius, 0, M_PI*2, 0);
    CGContextAddArc(ctx, rKuangX ,kuangY, kuangRadius, 0, M_PI*2, 0);
    CGContextFillPath(ctx);
    
    // 3.里面的白色框
    [[UIColor whiteColor] set];
    CGFloat whiteRadius = kuangRadius * 0.75;
    CGFloat whiteX = kuangX;
    CGFloat whiteY = kuangY;
    CGContextAddArc(ctx, whiteX, whiteY, whiteRadius, 0, M_PI*2, 0);
    drawCircle(ctx, whiteRadius, rKuangX, rKuangY);
    CGContextFillPath(ctx);
    
    // 4.白色框里的棕色
    [YMColor(68, 29, 21) set];
    CGFloat brownRadius = whiteRadius * 0.6;
    CGFloat brownX = whiteX + 6;
    CGFloat brownY = whiteY+(isShake?5:0);
    CGFloat rBrownX = rKuangX - 6+(isShake?5:0);
    CGFloat rBrownY = brownY;
    CGContextAddArc(ctx, brownX, brownY, brownRadius, 0, M_PI*2, 0);
    drawCircle(ctx, brownRadius, rBrownX, rBrownY);
    CGContextFillPath(ctx);
    
    // 5.黑眼珠
    [[UIColor blackColor] set];
    CGFloat blackRadius = brownRadius * 0.5;
    CGFloat blackX = brownX;
    CGFloat blackY = brownY;
    CGFloat rBlackX = rBrownX;
    CGFloat rBlackY = rBrownY;
    CGContextAddArc(ctx, blackX, blackY, blackRadius, 0, M_PI*2, 0);
    drawCircle(ctx, blackRadius, rBlackX, rBlackY);
    CGContextFillPath(ctx);
    
    // 6.白色闪光
    [[UIColor whiteColor] set];
    CGFloat flashRadius = blackRadius * 0.5;
    CGFloat flashX = blackX - blackRadius + 1;
    CGFloat flashY = blackY - blackRadius + 1;
    CGFloat rFlashX = rBlackX - blackRadius + 1;
    CGFloat rFlashY = rBlackY - blackRadius + 1;
    CGContextAddArc(ctx, flashX, flashY, flashRadius, 0, M_PI*2, 0);
    drawCircle(ctx, flashRadius, rFlashX, rFlashY);
    CGContextFillPath(ctx);
    
}

void drawMouth(CGContextRef ctx, CGRect rect) {
    CGFloat controlX = rect.size.width * 0.5;
    CGFloat controlY = YMTopY + 150;
    
    CGFloat marginX = 30;
    CGFloat marginY = 15;
    
    CGFloat currentX = controlX - marginX;
    CGFloat currentY = controlY - marginY;
    CGContextMoveToPoint(ctx, currentX, currentY);
    
    CGFloat endX = controlX + marginX;
    CGFloat endY = currentY + (isShake?5:0);
    
    CGContextAddQuadCurveToPoint(ctx, controlX, controlY, endX, endY);
    
    [[UIColor blackColor] set];
    
    CGContextStrokePath(ctx);
    
    
}

void drawBody(CGContextRef ctx, CGRect rect) {
    // 头
    CGFloat topArcX = rect.size.width * 0.5;
    CGFloat topArcY = YMTopY;
    CGFloat topRadius = YMRadius;
    CGContextAddArc(ctx, topArcX, topArcY, topRadius, 0, M_PI, 1);
    
    // 身
    CGFloat middleLineX = topArcX - topRadius;
    CGFloat middleLineH = 200;
    CGFloat middleLineY = topArcY + middleLineH;
    CGContextAddLineToPoint(ctx, middleLineX, middleLineY);
    
    // 下面
    CGFloat buttomArcX = topArcX;
    CGFloat buttomArcY = YMTopY + middleLineH;
    CGFloat buttomRadius = YMRadius;
    CGContextAddArc(ctx, buttomArcX, buttomArcY, buttomRadius, M_PI, 0 ,1);
    
    
    CGContextClosePath(ctx);
    
    [YMColor(252, 218, 0) set];
    
    CGContextFillPath(ctx);
}

void drawCircle(CGContextRef ctx, int radius, CGFloat centerX, CGFloat centerY) {
    CGContextAddArc(ctx, centerX, centerY, radius, 0, M_PI*2, 0);
}
@end
