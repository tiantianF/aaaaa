//
//  SegemgntView.m
//  aaaaa
//
//  Created by 方天添 on 15/11/6.
//  Copyright © 2015年 fangtiantian. All rights reserved.
//

#import "SegemgntView.h"
#import "SegementCollectionViewCell.h"

#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

// View 坐标(x,y)和宽高(width,height)
#define X(v)                    (v).frame.origin.x
#define Y(v)                    (v).frame.origin.y
#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height
#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)



@interface SegmentView ()  <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)UICollectionViewFlowLayout *layout;

@property (nonatomic,strong)UIView *selectedLine;              //下划线
@property (nonatomic,assign)NSInteger selectItem;

@property (nonatomic,assign)CGFloat lastScrollDistance;
@property (nonatomic,assign)NSInteger  maxItemIncollection;

@property (nonatomic,strong)NSMutableArray *showTypeList;

@end

@implementation SegmentView

- (instancetype)initWithFrame:(CGRect)frame
                     withData:(NSArray*)dataArray
               withMaxItemNum:(NSInteger)maxItemIncollection{
    self = [super initWithFrame:frame];
    if(self){
        //背景白色
        self.backgroundColor = [UIColor whiteColor];
        
     
        self.maxItemIncollection = maxItemIncollection;
        self.showTypeList = [NSMutableArray arrayWithArray:dataArray];
        
        //layout
        self.layout = [[UICollectionViewFlowLayout alloc]init];
        self.layout.minimumInteritemSpacing = 0;
        self.layout.minimumLineSpacing = 0;
        self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        //collectionview
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, frame.size.height) collectionViewLayout:self.layout];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.collectionView registerClass:[SegmentCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        [self addSubview:self.collectionView];
        
        self.selectedLine = [[UIView alloc]initWithFrame:CGRectMake(0, MaxY(self.collectionView)-2,(Main_Screen_Width/4)*4.0/5, 0)];
        
        self.selectedLine.backgroundColor = [UIColor redColor];
        [self addSubview:self.selectedLine];
        
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-1, Main_Screen_Width, 1)];
        line.backgroundColor = [UIColor grayColor];
        [self addSubview:line];
        
        self.selectItem = 0;
        [self redLineFrame:5];
        
        self.lastScrollDistance = 0;
        
    }
    return self;
}


#pragma mark- datasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.showTypeList.count;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([self getSingleWidth:self.showTypeList.count], HEIGHT(self));
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SegmentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    return cell;
}

#pragma mark- delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat distance = ([indexPath row] - self.selectItem)*([self getSingleWidth:self.showTypeList.count]);
    
    [UIView animateWithDuration:0.3 animations:^{
        self.selectedLine.frame = CGRectMake(distance+X(self.selectedLine),  MaxY(self.collectionView)-2, WIDTH(self.selectedLine), HEIGHT(self.selectedLine));
    }];
    
    self.selectItem = [indexPath row];
    
  
    NSString *index = [NSString stringWithFormat:@"%ld",(long)[indexPath row]+1];
    [self.delegate selectType:index];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat det = scrollView.contentOffset.x - self.lastScrollDistance;
    self.selectedLine.frame = CGRectMake(-det+X(self.selectedLine), MaxY(self.collectionView)-2, WIDTH(self.selectedLine), HEIGHT(self.selectedLine));
    self.lastScrollDistance = scrollView.contentOffset.x;
    
}

#pragma  mark- methods
- (CGFloat)getSingleWidth:(NSInteger )num{
    
    if( num != 0){
        if(num >= self.maxItemIncollection){
            if(self.maxItemIncollection == 0){
                return 0;
            }else{
                return Main_Screen_Width/self.maxItemIncollection;
            }
        }else{
            return Main_Screen_Width/num;
        }
    }else{
        return 0;
    }
}
- (void)redLineFrame:(NSInteger)num{
    if(num != 0){
        self.selectedLine.frame = CGRectMake(10, MaxY(self.collectionView)-2,[self getSingleWidth:num]-20, 1);
    }
}
@end
