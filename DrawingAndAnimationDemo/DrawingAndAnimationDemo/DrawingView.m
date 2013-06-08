//
//  DrawingView.m
//  DrawingAndAnimationDemo
//
//  Created by admin on 12-8-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DrawingView.h"
#import <QuartzCore/QuartzCore.h>

@interface DrawingView ()
- (void)drawRooftopAtTopPointOf:(CGPoint)paramTopPoint textToDisplay:(NSString *)paramText lineJoin:(CGLineJoin)paramLineJoin;
- (void)drawRectAtoTopOfScreen;
@end

@implementation DrawingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    /*
    // 绘制简单的字符串
    UIFont *thonburiBold = [UIFont fontWithName:@"Thonburi-Bold" size:30.0f];
    NSString *mString = @"Test drawing string";
    
    [mString drawAtPoint:CGPointMake(40, 180) withFont:thonburiBold];
     */
    
    
    /*
    // 绘制彩色的字符串
    UIColor *magentaColor = [UIColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1.0f]; // 加载颜色
    [magentaColor set]; //set the color in the graphical context //在当前的上下文中设置颜色
    
    UIFont *thonburiBold = [UIFont fontWithName:@"Thonburi-Bold" size:30.0f]; // 加载字体
    NSString *mString = @"Test drawing string with color"; // 要绘制的文本
    
    //[mString drawAtPoint:CGPointMake(25.0f, 190.0f) withFont:thonburiBold];
    [mString drawInRect:CGRectMake(25.0f, 190.0f, 270.0f, 80.0f) withFont:thonburiBold]; // 会自动换行，当rect够大，水平放不下时
     */
    
    /*
    // 绘制 图像
    UIImage *image = [UIImage imageNamed:@"xcode.png"];
    if(image != nil){
        NSLog(@"successfully loaded the image.");
    }else {
        NSLog(@"Failed to load the image.");
    }
    
    //[image drawAtPoint:CGPointMake(20.0f, 200.0f)];
    //[image drawAtPoint:CGPointMake(20.0f, 200.0f) blendMode:kCGBlendModeScreen alpha:1.0f];
    //[image drawInRect:CGRectMake(20.0f, 10.0f, 40.0f, 40.0f)];
    //[image drawInRect:CGRectMake(0.0f, 0.0f, self.bounds.size.width, self.bounds.size.height) blendMode:kCGBlendModeScreen alpha:1.0f];
    [image drawAsPatternInRect:CGRectMake(0.0f, 0.0f, self.bounds.size.width, self.bounds.size.height)]; // draws the image as a CGPattern //绘制出CG效果
    */
    
    /*
    // 绘制简单线条
    [[UIColor greenColor] set]; //设置线条颜色
    CGContextRef context = UIGraphicsGetCurrentContext(); // 获取当前图形上下文
    CGContextSetLineWidth(context, 5.0f); //设置线条宽度
    CGContextMoveToPoint(context, 10.0f, 10.0f); //设置线条起点
    CGContextAddLineToPoint(context, 200.0f, 200.0f); //设置线条终点
    CGContextStrokePath(context); //用当前图形上下文的颜色填充线条
    */
    
    /*
    // 绘制折线
    [[UIColor greenColor] set]; //设置线条颜色
    CGContextRef context = UIGraphicsGetCurrentContext(); // 获取当前图形上下文
    CGContextSetLineWidth(context, 50.0f); //设置线条宽度
    CGContextMoveToPoint(context, 10.0f, 10.0f); //设置线条起点
    CGContextAddLineToPoint(context, 200.0f, 200.0f); 
    CGContextAddLineToPoint(context, 220.0f, 120.0f);
    //CGContextAddLineToPoint(context, 10.0f, 10.0f);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextStrokePath(context); //用当前图形上下文的颜色填充线条
     */
    
    /*
    // 绘制图形和文字
    [self drawRooftopAtTopPointOf:CGPointMake(160.0f, 40.0f) textToDisplay:@"Miter" lineJoin:kCGLineJoinMiter];
    [self drawRooftopAtTopPointOf:CGPointMake(160.0f, 180.0f) textToDisplay:@"Bevel" lineJoin:kCGLineJoinBevel];
    [self drawRooftopAtTopPointOf:CGPointMake(160.0f, 320.0f) textToDisplay:@"Round" lineJoin:kCGLineJoinRound];
     */
    
    /*
    // 使用路径CGMutablePathRef绘图
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGPathMoveToPoint(path, NULL, screenBounds.origin.x, screenBounds.origin.y);
    CGPathAddLineToPoint(path, NULL, screenBounds.size.width, screenBounds.size.height);
    CGPathMoveToPoint(path, NULL, screenBounds.size.width, screenBounds.origin.y);
    CGPathAddLineToPoint(path, NULL, screenBounds.origin.x, screenBounds.size.height);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextAddPath(currentContext, path);
    
    [[UIColor blueColor] setStroke];
    CGContextDrawPath(currentContext, kCGPathStroke);
    
    CGPathRelease(path);
     */
    
    /*
    // 绘制 单个 矩形
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
    CGPathAddRect(path, NULL, rectangle);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill]; //设置矩形填充颜色
    [[UIColor brownColor] setStroke]; // 设置矩形描边颜色
    
    CGContextSetLineWidth(context, 5.0f);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGPathRelease(path);
     */
    
    /*
    // 绘制 一组 矩形
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
    CGRect rectangle2 = CGRectMake(40.0f, 100.0f, 90.0f, 300.0f);
    CGRect rectangles[2] = {rectangle, rectangle2};
    
    CGPathAddRects(path, NULL, (const CGRect *)rectangles, 2);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill]; //设置矩形填充颜色
    [[UIColor brownColor] setStroke]; // 设置矩形描边颜色
    
    CGContextSetLineWidth(context, 5.0f);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGPathRelease(path);
    */
    
    /*
    // 为 形状 添加阴影
    [self drawRectAtoTopOfScreen];
     */
    
    /*
     // 创建 渐变 效果
    [self drawGradient];
     */
    
    /*
    // 平移图形上下文中的形状 1
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
    CGAffineTransform transform = CGAffineTransformMakeTranslation(100.0f, 0.0f); // x右移100，y不变
    CGPathAddRect(path, &transform, rectangle);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0] setFill];
    [[UIColor brownColor] setStroke];
    CGContextSetLineWidth(context, 5.0f);
    CGContextDrawPath(context, kCGPathFillStroke);
    CGPathRelease(path);
    */
    
    /* 
     *说明*：
         除了对路径上的形状应用变换，还可以通过CGContextTranslateCTM过程对图形上下文应用变换。这样将把一个平移变换应用到当前变换
     矩阵（CTM，current transformation matrix）。CTM设置了你的图形上下文的中心，它把你绘制的每个点映射到屏幕上。例如：你在（0,0）
     处绘制一个点，core graphics通过查找CTM来寻找屏幕的中点，CTM将做一些计算，并告知Core Graphics点（0,0）在屏幕的左上角。
     使用过程如CGContextTranslateCTM, 你可以改变CTM的配置，随后强制所有绘制在图形上下文的形状转移到画布上的另一个地方。
     */
    
    // 平移图形上下文中的形状 2
    /*
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
    CGPathAddRect(path, NULL, rectangle);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 100.0f, 0.0f);
    
    CGContextAddPath(context, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0] setFill];
    [[UIColor brownColor] setStroke];
    CGContextSetLineWidth(context, 5.0f);
    CGContextDrawPath(context, kCGPathFillStroke);
    CGPathRelease(path);
    
    CGContextRestoreGState(context);
     */
    
    /*
    // 缩放图形上下文中的形状 1
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
    CGAffineTransform transform = CGAffineTransformMakeScale(0.5f, 0.5f); // x右移100，y不变
    CGPathAddRect(path, &transform, rectangle);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0] setFill];
    [[UIColor brownColor] setStroke];
    CGContextSetLineWidth(context, 5.0f);
    CGContextDrawPath(context, kCGPathFillStroke);
    CGPathRelease(path);
    */
    
    /*
    // 缩放图形上下文中的形状 2
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
    CGPathAddRect(path, NULL, rectangle);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSaveGState(context);
    CGContextScaleCTM(context, 0.5, 0.5f);
    
    CGContextAddPath(context, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0] setFill];
    [[UIColor brownColor] setStroke];
    CGContextSetLineWidth(context, 5.0f);
    CGContextDrawPath(context, kCGPathFillStroke);
    CGPathRelease(path);
    
    CGContextRestoreGState(context);
     */
    
    /*
     // 旋转图形上下文中的形状 1
     CGMutablePathRef path = CGPathCreateMutable();
     CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
     CGAffineTransform transform = CGAffineTransformMakeRotation((45.0f * M_PI)/180.0f); // x右移100，y不变
     CGPathAddRect(path, &transform, rectangle);
     CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextAddPath(context, path);
     [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0] setFill];
     [[UIColor brownColor] setStroke];
     CGContextSetLineWidth(context, 5.0f);
     CGContextDrawPath(context, kCGPathFillStroke);
     CGPathRelease(path);
    */ 
    
    /*
     // 旋转图形上下文中的形状 2
     CGMutablePathRef path = CGPathCreateMutable();
     CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
     CGPathAddRect(path, NULL, rectangle);
     CGContextRef context = UIGraphicsGetCurrentContext();
     
     CGContextSaveGState(context);
     CGContextRotateCTM(context, (45.0f * M_PI)/180.0f);
     
     CGContextAddPath(context, path);
     [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0] setFill];
     [[UIColor brownColor] setStroke];
     CGContextSetLineWidth(context, 5.0f);
     CGContextDrawPath(context, kCGPathFillStroke);
     CGPathRelease(path);
     
     CGContextRestoreGState(context);
     */
}


- (void)drawRooftopAtTopPointOf:(CGPoint)paramTopPoint textToDisplay:(NSString *)paramText lineJoin:(CGLineJoin)paramLineJoin {

    [[UIColor blueColor] set];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetLineJoin(currentContext, paramLineJoin);
    CGContextSetLineWidth(currentContext, 25.0f);
    CGContextMoveToPoint(currentContext, paramTopPoint.x - 140.0f, paramTopPoint.y + 100.0f);
    CGContextAddLineToPoint(currentContext, paramTopPoint.x, paramTopPoint.y);
    CGContextAddLineToPoint(currentContext, paramTopPoint.x + 140.0f, paramTopPoint.y + 100.0f);
    CGContextStrokePath(currentContext);
    
    [[UIColor blackColor] set];
    [paramText drawAtPoint:CGPointMake(paramTopPoint.x-40.0f, paramTopPoint.y+60.0f) withFont:[UIFont boldSystemFontOfSize:30.0f]];
}

- (void)drawRectAtoTopOfScreen {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    
    CGContextSetShadowWithColor(currentContext, CGSizeMake(10.0f, 10.0f), 20.0f, [[UIColor grayColor] CGColor]);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect firstRect = CGRectMake(55.0f, 60.0f, 150.0f, 150.0f);
    CGPathAddRect(path, NULL, firstRect);
    CGContextAddPath(currentContext, path);
    
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    
    CGContextDrawPath(currentContext, kCGPathFill);
    
    CGPathRelease(path);
    
    CGContextRestoreGState(currentContext);
    
    // !说明： CGContextSaveGState(currentContext); CGContextRestoreGState(currentContext); 这两句很重要，在设置阴影后，会影响到当前的图形上下文，将会是后面绘制的矩形也默认带阴影，所以要在每次添加阴影效果的时候先保存下当前图形上下文的状态，在设置完阴影效果后，不需要时，再将图形上下文的状态设置回来。
}

- (void)drawGradient {
    // 创建 渐变
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    UIColor *startColor = [UIColor blueColor];
    CGFloat *startColorComponents = (CGFloat *)CGColorGetComponents([startColor CGColor]);
    
    UIColor *endColor = [UIColor greenColor];
    CGFloat *endColorComponents = (CGFloat *)CGColorGetComponents([endColor CGColor]);
    
    CGFloat colorComponents[8] = {
        
        startColorComponents[0],
        startColorComponents[1],
        startColorComponents[2],
        startColorComponents[3],
        endColorComponents[0],
        endColorComponents[1],
        endColorComponents[2],
        endColorComponents[3]
    };
    
    CGFloat colorIndices[2] = {0.0f, 1.0f};
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colorComponents, colorIndices, 2);
    
    CGColorSpaceRelease(colorSpace);
    
    CGPoint startPoint = CGPointMake(120, 260);
    //CGPointMake(rect.size.width/2.0f, 0.0f); //上下
    //CGPointMake(0, 0);  // 对角
    //CGPointMake(0.0, rect.size.height/2.0f);    //左右
    
    CGPoint endPoint = CGPointMake(200, 220);
    //CGPointMake(rect.size.width/2.0f, rect.size.height); 
    //CGPointMake(rect.size.width, rect.size.height);  
    //CGPointMake(rect.size.width, rect.size.height/2.0f);
    
    CGContextDrawLinearGradient(context, 
                                gradient, 
                                startPoint,
                                endPoint,
                                0);
    CGGradientRelease(gradient);
}

@end
