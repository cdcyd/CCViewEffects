//
//  UIView+Effects.m
//  CCViewEffects
//
//  Created by 佰道聚合 on 2017/9/8.
//  Copyright © 2017年 cyd. All rights reserved.
//

#import "UIView+Effects.h"
#import <objc/runtime.h>

#define kConrnerCorner "UIView.privateConrnerCorner"
#define kConrnerBounds "UIView.privateConrnerBounds"
#define kConrnerRadius "UIView.privateConrnerRadius"

#define kBorderColor   "UIView.privateBorderColor"
#define kBorderWidth   "UIView.privateBorderWidth"

#define kShadowOpacity "UIView.privateShadowOpacity"
#define kShadowRadius  "UIView.privateShadowRadius"
#define kShadowOffset  "UIView.privateShadowOffset"
#define kShadowColor   "UIView.privateShadowColor"

#define kBackgroundView "UIView.BackgroundView"

@implementation UIView (Effects)
@dynamic conrnerCorner,conrnerBounds,conrnerRadius,borderColor,borderWidth,shadowColor,shadowOffset,shadowRadius,shadowOpacity,showVisual,clerVisual;

#pragma mark - 添加私有属性
// 圆角
- (UIRectCorner)cCorner{
    UIRectCorner corner = [objc_getAssociatedObject(self, kConrnerCorner) integerValue];
    return corner?corner:UIRectCornerAllCorners;
}

- (void)setCCorner:(UIRectCorner)cCorner{
    objc_setAssociatedObject(self, kConrnerCorner, [NSNumber numberWithInteger:cCorner], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)cRadius{
    return [objc_getAssociatedObject(self, kConrnerRadius) floatValue];
}

- (void)setCRadius:(CGFloat)cRadius{
    objc_setAssociatedObject(self, kConrnerRadius, [NSNumber numberWithFloat:cRadius], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)cBounds{
    return CGRectFromString(objc_getAssociatedObject(self, kConrnerBounds));
}

- (void)setCBounds:(CGRect)cBounds{
    objc_setAssociatedObject(self, kConrnerBounds, NSStringFromCGRect(cBounds), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

// 边框
- (UIColor *)bColor{
    UIColor *color = objc_getAssociatedObject(self, kBorderColor);
    return color?color:[UIColor blackColor];
}

- (void)setBColor:(UIColor *)bColor{
    objc_setAssociatedObject(self, kBorderColor, bColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)bWidth{
    return [objc_getAssociatedObject(self, kBorderWidth) floatValue];
}

- (void)setBWidth:(CGFloat)bWidth{
    objc_setAssociatedObject(self, kBorderWidth, [NSNumber numberWithFloat:bWidth], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

// 阴影
- (CGFloat)sOpacity{
    return [objc_getAssociatedObject(self, kShadowOpacity) floatValue];
}

- (void)setSOpacity:(CGFloat)sOpacity{
    objc_setAssociatedObject(self, kShadowOpacity, [NSNumber numberWithFloat:sOpacity], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)sRadius{
    return [objc_getAssociatedObject(self, kShadowRadius) floatValue];
}

- (void)setSRadius:(CGFloat)sRadius{
    objc_setAssociatedObject(self, kShadowRadius, [NSNumber numberWithFloat:sRadius], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGSize)sOffset{
    return CGSizeFromString(objc_getAssociatedObject(self, kShadowOffset));
}

- (void)setSOffset:(CGSize)sOffset{
    objc_setAssociatedObject(self, kShadowOffset, NSStringFromCGSize(sOffset), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)sColor{
    UIColor *color = objc_getAssociatedObject(self, kShadowColor);
    return color?color:[UIColor blackColor];
}

- (void)setSColor:(UIColor *)sColor{
    objc_setAssociatedObject(self, kShadowColor, sColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

// 阴影空视图，只在有圆角的时候使用
- (UIView *)sBackgroundView{
    return objc_getAssociatedObject(self, kBackgroundView);
}

- (void)setSBackgroundView:(UIView *)sBackgroundView{
    objc_setAssociatedObject(self, kBackgroundView, sBackgroundView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - 链式属性实现
- (ConrnerCorner)conrnerCorner{
    return ^(UIRectCorner corner){
        self.cCorner = corner;
        return self;
    };
}

-(ConrnerBounds)conrnerBounds{
    return ^(CGRect bounds){
        self.cBounds = bounds;
        return self;
    };
}

- (ConrnerRadius)conrnerRadius{
    return ^(CGFloat radius){
        self.cRadius = radius;
        return self;
    };
}

- (BorderColor)borderColor{
    return ^(UIColor *color){
        self.bColor = color;
        return self;
    };
}

- (BorderWidth)borderWidth{
    return ^(CGFloat width){
        self.bWidth = width;
        return self;
    };
}

- (ShadowOpacity)shadowOpacity{
    return ^(CGFloat opacity){
        self.sOpacity = opacity;
        return self;
    };
}

- (ShadowRadius)shadowRadius{
    return ^(CGFloat radius){
        self.sRadius = radius;
        return self;
    };
}

- (ShadowOffset)shadowOffset{
    return ^(CGSize size){
        self.sOffset = size;
        return self;
    };
}

- (ShadowColor)shadowColor{
    return ^(UIColor *color){
        self.sColor = color;
        return self;
    };
}

#pragma mark - 方法实现
- (ClerVisual)clerVisual{
    return ^{
        // 有阴影
        if (self.sBackgroundView) {
            [self.sBackgroundView removeFromSuperview];
            self.sBackgroundView = nil;
        }
        
        // 有圆角
        if (self.cCorner > 0 && self.bColor) {
            for (CALayer *layer in self.layer.sublayers) {
                [layer removeFromSuperlayer];
            }
        }
        
        // 这里全部清零，默认值在getter方法中设置
        self.cCorner = 0;
        self.cRadius = 0;
        self.cBounds = CGRectZero;
        self.bColor = nil;
        self.bWidth = 0;
        self.sOpacity = 0;
        self.sRadius = 0;
        self.sOffset = CGSizeZero;
        self.sColor = nil;
        self.sBackgroundView = nil;
        
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 0;
        self.layer.borderWidth = 0;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0;
        self.layer.shadowPath = nil;
        self.layer.shadowRadius = 0;
        self.layer.shadowColor = nil;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.mask = nil;
        return self;
    };
}

- (ShowVisual)showVisual{
    return ^{
        // 阴影
        if (self.sOpacity>0 && self.cRadius > 0) {
            NSAssert(self.superview, @"在阴影和圆角同时存在时，必须先将view加载到父视图上");

            // view (阴影视图)
            UIView *view = [[UIView alloc] initWithFrame:self.frame];
            view.backgroundColor = [UIColor clearColor];
            self.sBackgroundView = view;
            [self addShadow:view];
            [self.superview insertSubview:view belowSubview:self];
            
            // view (约束)
            [self.superview addConstraints:@[[NSLayoutConstraint constraintWithItem:view
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier:1.0
                                                                           constant:0],
                                             [NSLayoutConstraint constraintWithItem:view
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self
                                                                          attribute:NSLayoutAttributeLeft
                                                                         multiplier:1.0
                                                                           constant:0],
                                             [NSLayoutConstraint constraintWithItem:view
                                                                          attribute:NSLayoutAttributeRight
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self
                                                                          attribute:NSLayoutAttributeRight
                                                                         multiplier:1.0
                                                                           constant:0],
                                             [NSLayoutConstraint constraintWithItem:view
                                                                          attribute:NSLayoutAttributeBottom
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self
                                                                          attribute:NSLayoutAttributeBottom
                                                                         multiplier:1.0
                                                                           constant:0]]];
            if (self.constraints.count > 0) {
                [view setTranslatesAutoresizingMaskIntoConstraints:NO];
                [view addConstraints:self.constraints];
            }
        } else {
            [self addShadow:self];
        }

        // 边框和圆角
        [self addBorderAndRadius:self];
        return self;
    };
}

#pragma mark - Private methods
-(CGRect)drawRect{
    return CGRectEqualToRect(CGRectZero, self.cBounds)?self.bounds:self.cBounds;
}

// 添加阴影
-(void)addShadow:(UIView *)view{
    // 如果有圆角，用贝塞尔曲线绘制阴影路径
    if (self.cRadius > 0) {
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:[self drawRect]
                                                         byRoundingCorners:self.cCorner
                                                               cornerRadii:CGSizeMake(self.cRadius, self.cRadius)];
        view.layer.shadowPath = shadowPath.CGPath;
    }
    view.layer.masksToBounds = NO;
    view.layer.shadowOpacity = self.sOpacity;
    view.layer.shadowRadius = self.sRadius;
    view.layer.shadowOffset = self.sOffset;
    view.layer.shadowColor  = self.sColor.CGColor;
}

// 添加圆角和边框
-(void)addBorderAndRadius:(UIView *)view{
    if ((self.cRadius > 0 && self.cCorner != UIRectCornerAllCorners) || self.sOpacity > 0)  {
        // 圆角和边框的贝塞尔曲线
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[self drawRect]
                                                   byRoundingCorners:self.cCorner
                                                         cornerRadii:CGSizeMake(self.cRadius, self.cRadius)];
        // 圆角
        if (self.cRadius > 0) {
            CAShapeLayer *maskLayer = [CAShapeLayer layer];
            maskLayer.frame = view.bounds;
            maskLayer.path = path.CGPath;
            view.layer.mask = maskLayer;
        }
        // 边框
        if (self.bWidth > 0) {
            CAShapeLayer *layer = [[CAShapeLayer alloc]init];
            layer.frame = self.bounds;
            layer.path = path.CGPath;
            layer.lineWidth = self.bWidth;
            layer.strokeColor = self.bColor.CGColor;
            layer.fillColor = [UIColor clearColor].CGColor;
            [view.layer addSublayer:layer];
        }
    } else {
        // 没有圆角时，直接添加边框
        view.layer.masksToBounds = true;
        view.layer.cornerRadius = self.cRadius;
        view.layer.borderWidth = self.bWidth;
        view.layer.borderColor = self.bColor.CGColor;
    }
}

@end
