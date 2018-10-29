//
//  TScaleView.h
//  TCALayerDemo
//
//  Created by allentang on 2018/10/29.
//  Copyright © 2018 allentang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,TScaleDirection){
    TScaleLeft,
    TScaleRight,
    TScaleUp,
    TScaleDown
};

@interface TScaleView : UIView
- (instancetype)initWithDirection:(TScaleDirection)direction;
@end

NS_ASSUME_NONNULL_END
