//
//  SegementCollectionViewCell.m
//  aaaaa
//
//  Created by 方天添 on 15/11/6.
//  Copyright © 2015年 fangtiantian. All rights reserved.
//

#import "SegementCollectionViewCell.h"


@implementation SegmentCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        
        self.segmentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.segmentLabel.textAlignment = NSTextAlignmentCenter;
        self.segmentLabel.text = @"标题";
        self.segmentLabel.textColor = [UIColor blackColor];
        [self.segmentLabel setHighlightedTextColor:[UIColor redColor]];
        self.segmentLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.segmentLabel];
        
        
        
        NSAttributedString *attributedText =[[NSAttributedString alloc]initWithString:self.segmentLabel.text attributes:@{NSFontAttributeName: self.segmentLabel.font}];
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){CGFLOAT_MAX, CGFLOAT_MAX}
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        CGSize size = rect.size;

        
        //right line
        UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width-1, (frame.size.height-size.height)/2, 1, size.height)];
        rightLine.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:rightLine];
    }
    return self;
}
@end