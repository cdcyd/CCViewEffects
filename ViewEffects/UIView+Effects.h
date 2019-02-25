//
//  UIView+Effects.h
//  CCViewEffects
//
//  Created by 佰道聚合 on 2017/9/8.
//  Copyright © 2017年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView *(^ConrnerCorner) (UIRectCorner corner );
typedef UIView *(^ConrnerBounds) (CGRect       bounds );
typedef UIView *(^ConrnerRadius) (CGFloat      radius );

typedef UIView *(^BorderColor  ) (UIColor      *color );
typedef UIView *(^BorderWidth  ) (CGFloat      width  );

typedef UIView *(^ShadowColor  ) (UIColor      *color );
typedef UIView *(^ShadowOffset ) (CGSize       size   );
typedef UIView *(^ShadowRadius ) (CGFloat      radius );
typedef UIView *(^ShadowOpacity) (CGFloat      opacity);

typedef UIView *(^ShowVisual) (void);
typedef UIView *(^ClerVisual) (void);

@interface UIView (Effects)

// 圆角
@property(nonatomic, strong, readonly)ConrnerCorner conrnerCorner;  // UIRectCorner 默认 UIRectCornerAllCorners
@property(nonatomic, strong, readonly)ConrnerBounds conrnerBounds;  // 在使用约束布局时必传 默认 CGSizeZero
@property(nonatomic, strong, readonly)ConrnerRadius conrnerRadius;  // 圆角半径 默认 0

// 边框
@property(nonatomic, strong, readonly)BorderColor   borderColor;    // 边框颜色 默认 black
@property(nonatomic, strong, readonly)BorderWidth   borderWidth;    // 边框宽度 默认 0

// 阴影
@property(nonatomic, strong, readonly)ShadowColor   shadowColor;    // 阴影颜色 默认 black
@property(nonatomic, strong, readonly)ShadowOffset  shadowOffset;   // 阴影偏移方向和距离 默认 {0，0}
@property(nonatomic, strong, readonly)ShadowRadius  shadowRadius;   // 阴影模糊度 默认 0
@property(nonatomic, strong, readonly)ShadowOpacity shadowOpacity;  // (0~1] 默认 0

@property(nonatomic, strong, readonly)ShowVisual showVisual; // 展示
@property(nonatomic, strong, readonly)ClerVisual clerVisual; // 隐藏

@end
