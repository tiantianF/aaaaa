//
//  SegemgntView.h
//  aaaaa
//
//  Created by 方天添 on 15/11/6.
//  Copyright © 2015年 fangtiantian. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol SegemgntViewDelegate <NSObject>

@optional
- (void)selectType:(NSString *)selectedType;//返回选中的索引

@end

@interface SegmentView : UIView

@property (nonatomic,weak)id<SegemgntViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame
                     withData:(NSArray*)dataArray
               withMaxItemNum:(NSInteger)maxItemIncollection;
@end
