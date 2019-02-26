//
//  UIView+Effects.m
//  CCViewEffects
//
//  Created by 佰道聚合 on 2017/9/8.
//  Copyright © 2017年 cyd. All rights reserved.
//

#import "UIView+Effects.h"
#import <objc/runtime.h>

#define kConrnerCorner  "UIView.privateConrnerCorner"
#define kConrnerBounds  "UIView.privateConrnerBounds"
#define kConrnerRadius  "UIView.privateConrnerRadius"

#define kBorderColor    "UIView.privateBorderColor"
#define kBorderWidth    "UIView.privateBorderWidth"

#define kShadowOpacity  "UIView.privateShadowOpacity"
#define kShadowRadius   "UIView.privateShadowRadius"
#define kShadowOffset   "UIView.privateShadowOffset"
#define kShadowColor    "UIView.privateShadowColor"

#define kBezierPath     "UIView.privateBezierPath"

#define kBackgroundView "UIView.BackgroundView"

@implementation UIView (Effects)
@dynamic conrnerCorner,
         conrnerRadius,
         borderColor,
         borderWidth,
         shadowColor,
         shadowOffset,
         shadowRadius,
         shadowOpacity,
         showVisual,
         clerVisual,
         bezierPath;

#pragma mark - 添加私有属性
// mark - 圆角 矩形 默认 AllCorners
- (void)setPrivateConrnerCorner:(UIRectCorner)corner {
    objc_setAssociatedObject(self, kConrnerCorner, [NSNumber numberWithInteger:corner], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIRectCorner)privateConrnerCorner {
    id corner = objc_getAssociatedObject(self, kConrnerCorner);
    return corner ? [corner integerValue] : UIRectCornerAllCorners;
}

// mark - 圆角 半径 默认 0.0
- (void)setPrivateConrnerRadius:(CGFloat)radius {
    objc_setAssociatedObject(self, kConrnerRadius, [NSNumber numberWithFloat:radius], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)privateConrnerRadius {
    id radius = objc_getAssociatedObject(self, kConrnerRadius);
    return radius ? [radius floatValue] : 0.0;
}

// mark - 边框 宽度 默认 0.0
- (void)setPrivateBorderWidth:(CGFloat)width {
    objc_setAssociatedObject(self, kBorderWidth, [NSNumber numberWithFloat:width], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)privateBorderWidth {
    id width = objc_getAssociatedObject(self, kBorderWidth);
    return width ? [width floatValue] : 0.0;
}

// mark - 边框 颜色 默认 黑色
- (void)setPrivateBorderColor:(UIColor *)color {
    objc_setAssociatedObject(self, kBorderColor, color, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)privateBorderColor {
    id color = objc_getAssociatedObject(self, kBorderColor);
    return color ? color : [UIColor blackColor];
}

// mark - 阴影 半径 默认 0.0
- (void)setPrivateShadowRadius:(CGFloat)opacity {
    objc_setAssociatedObject(self, kShadowOpacity, [NSNumber numberWithFloat:opacity], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)privateShadowRadius {
    id radius = objc_getAssociatedObject(self, kShadowOpacity);
    return radius ? [radius floatValue] : 0.0;
}

// mark - 阴影 模糊度 默认 0.0
- (void)setPrivateShadowOpacity:(CGFloat)radius {
    objc_setAssociatedObject(self, kShadowRadius, [NSNumber numberWithFloat:radius], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)privateShadowOpacity {
    id opacity = objc_getAssociatedObject(self, kShadowRadius);
    return opacity ? [opacity floatValue] : 0.0;
}

// mark - 阴影 偏移方向和距离 默认 {0.0，0.0}
- (void)setPrivateShadowOffset:(CGSize)offset {
    objc_setAssociatedObject(self, kShadowOffset, NSStringFromCGSize(offset), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGSize)privateShadowOffset {
    id offset = objc_getAssociatedObject(self, kShadowOffset);
    return offset ? CGSizeFromString(offset) : CGSizeZero;
}

// mark - 阴影 颜色 默认 black
- (void)setPrivateShadowColor:(UIColor *)color {
    objc_setAssociatedObject(self, kShadowColor, color, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)privateShadowColor {
    id color = objc_getAssociatedObject(self, kShadowColor);
    return color ? color : [UIColor blackColor];
}

// mark - 路径 默认 nil
- (void)setPrivateBezierPath:(UIBezierPath *)path {
    objc_setAssociatedObject(self, kBezierPath, path, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIBezierPath *)privateBezierPath {
    id path = objc_getAssociatedObject(self, kBezierPath);
    return path ? path : nil;
}

// 阴影空视图，只在有圆角的时候使用
- (UIView *)shadowBackgroundView {
    return objc_getAssociatedObject(self, kBackgroundView);
}

- (void)setShadowBackgroundView:(UIView *)backgroundView {
    objc_setAssociatedObject(self, kBackgroundView, backgroundView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - 链式属性实现
- (ConrnerCorner)conrnerCorner {
    return ^(UIRectCorner corner) {
        self.privateConrnerCorner = corner;
        return self;
    };
}

- (ConrnerRadius)conrnerRadius {
    return ^(CGFloat radius) {
        self.privateConrnerRadius = radius;
        return self;
    };
}

- (BorderColor)borderColor {
    return ^(UIColor *color) {
        self.privateBorderColor = color;
        return self;
    };
}

- (BorderWidth)borderWidth {
    return ^(CGFloat width) {
        self.privateBorderWidth = width;
        return self;
    };
}

- (ShadowOpacity)shadowOpacity {
    return ^(CGFloat opacity) {
        self.privateShadowOpacity = opacity;
        return self;
    };
}

- (ShadowRadius)shadowRadius {
    return ^(CGFloat radius) {
        self.privateShadowRadius = radius;
        return self;
    };
}

- (ShadowOffset)shadowOffset {
    return ^(CGSize size) {
        self.privateShadowOffset = size;
        return self;
    };
}

- (ShadowColor)shadowColor {
    return ^(UIColor *color) {
        self.privateShadowColor = color;
        return self;
    };
}

- (BezierPath)bezierPath {
    return ^(UIBezierPath *path) {
        self.privateBezierPath = path;
        return self;
    };
}

#pragma mark - 方法实现
- (ClerVisual)clerVisual {
    return ^{
        // 阴影背景图
        if (self.shadowBackgroundView) {
            [self.shadowBackgroundView removeFromSuperview];
            self.shadowBackgroundView = nil;
        }
        
        // 圆角和边框
        for (CALayer *layer in self.layer.sublayers) {
            if ([layer.name isEqualToString:@"CCViewEffects"]) {
                [layer removeFromSuperlayer];
            }
        }
        
        // 这里全部清零，默认值在getter方法中设置
        self.privateConrnerCorner = 0;
        self.privateConrnerRadius = 0;
        self.privateBorderColor   = nil;
        self.privateBorderWidth   = 0;
        self.privateShadowOpacity = 0;
        self.privateShadowRadius  = 0;
        self.privateShadowOffset  = CGSizeZero;
        self.privateShadowColor   = nil;
        self.shadowBackgroundView = nil;
        
        self.layer.masksToBounds  = NO;
        self.layer.cornerRadius   = 0;
        self.layer.borderWidth    = 0;
        self.layer.borderColor    = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity  = 0;
        self.layer.shadowPath     = nil;
        self.layer.shadowRadius   = 0;
        self.layer.shadowColor    = nil;
        self.layer.shadowOffset   = CGSizeZero;
        self.layer.mask           = nil;
        return self;
    };
}

- (ShowVisual)showVisual {
    return ^{
        // 阴影
        [self addShadow];
        // 边框和圆角
        [self addBorderAndRadius];
        return self;
    };
}

#pragma mark - Private methods
-(CGRect)drawRect {
    NSAssert(self.superview, @"添加圆角时，请先将view加到父视图上");
    [self.superview layoutIfNeeded];
    return self.bounds;
}

// 添加阴影
-(void)addShadow {
    UIView *shadowView = self;
    // 同时存在阴影和圆角
    if ((self.privateShadowOpacity > 0 && self.privateConrnerRadius > 0) || self.privateBezierPath) {
        NSAssert(self.superview, @"添加阴影和圆角时，请先将view加到父视图上");
        shadowView = [[UIView alloc] initWithFrame:self.frame];
        shadowView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.superview insertSubview:shadowView belowSubview:self];
        [self.superview addConstraints:@[[NSLayoutConstraint constraintWithItem:shadowView
                                                                      attribute:NSLayoutAttributeTop
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeTop
                                                                     multiplier:1.0
                                                                       constant:0],
                                         [NSLayoutConstraint constraintWithItem:shadowView
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:0],
                                         [NSLayoutConstraint constraintWithItem:shadowView
                                                                      attribute:NSLayoutAttributeRight
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeRight
                                                                     multiplier:1.0
                                                                       constant:0],
                                         [NSLayoutConstraint constraintWithItem:shadowView
                                                                      attribute:NSLayoutAttributeBottom
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeBottom
                                                                     multiplier:1.0
                                                                       constant:0]]];
        self.shadowBackgroundView = shadowView;
    }
    // 圆角
    if (self.privateConrnerRadius > 0 || self.privateBezierPath) {
        UIBezierPath *shadowPath = self.privateBezierPath;
        if (shadowPath == nil) {
            shadowPath = [UIBezierPath bezierPathWithRoundedRect:[self drawRect]
                                               byRoundingCorners:self.privateConrnerCorner
                                                     cornerRadii:CGSizeMake(self.privateConrnerRadius, self.privateConrnerRadius)];
        }
        shadowView.layer.shadowPath = shadowPath.CGPath;
    }
    // 设置阴影
    shadowView.layer.masksToBounds = NO;
    shadowView.layer.shadowOpacity = self.privateShadowOpacity;
    shadowView.layer.shadowRadius  = self.privateShadowRadius;
    shadowView.layer.shadowOffset  = self.privateShadowOffset;
    shadowView.layer.shadowColor   = self.privateShadowColor.CGColor;
}

// 添加圆角和边框
-(void)addBorderAndRadius {
    // 有圆角或者有阴影
    if (self.privateConrnerRadius > 0 || self.privateShadowOpacity > 0 || self.privateBezierPath) {
        // 圆角和边框的贝塞尔曲线
        UIBezierPath *path = self.privateBezierPath;
        if (path == nil) {
            path = [UIBezierPath bezierPathWithRoundedRect:[self drawRect]
                                         byRoundingCorners:self.privateConrnerCorner
                                               cornerRadii:CGSizeMake(self.privateConrnerRadius, self.privateConrnerRadius)];
        }
        // 圆角
        if (self.privateConrnerRadius > 0 || self.privateBezierPath) {
            CAShapeLayer *maskLayer = [CAShapeLayer layer];
            maskLayer.frame = self.bounds;
            maskLayer.path  = path.CGPath;
            self.layer.mask = maskLayer;
        }
        // 边框
        if (self.privateBorderWidth > 0 || self.privateBezierPath) {
            CAShapeLayer *layer = [[CAShapeLayer alloc]init];
            layer.name  = @"CCViewEffects";
            layer.frame = self.bounds;
            layer.path  = path.CGPath;
            layer.lineWidth   = self.privateBorderWidth;
            layer.strokeColor = self.privateBorderColor.CGColor;
            layer.fillColor   = [UIColor clearColor].CGColor;
            [self.layer addSublayer:layer];
        }
    } else {
        // 没有圆角和阴影
        self.layer.masksToBounds = true;
        self.layer.borderWidth   = self.privateBorderWidth;
        self.layer.borderColor   = self.privateBorderColor.CGColor;
    }
}

@end
