//
//  TableViewCell.m
//  bishi
//
//  Created by zhaoyuan on 16/4/11.
//  Copyright © 2016年 赵远. All rights reserved.
//

#import "TableViewCell.h"

#define fontGray [UIColor colorWithRed:0.349f green:0.341f blue:0.345f alpha:1.00f]
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height


@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        [self initView];
        
    }
    return self;
}

-(void)initView{
    
    _imgViewL=[[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 60, 60)];
    _imgViewL.backgroundColor=fontGray;
    [self.contentView addSubview:_imgViewL];
    
    CGFloat height=_imgViewL.frame.size.width+10;
    _label=[[UILabel alloc] init];
    _label.numberOfLines = 0;
    _label.textAlignment=0;
    [_label setFont:[UIFont systemFontOfSize:18]];
    _label.frame = CGRectMake(height+10, 10,screen_width-80, 30);
    [self.contentView  addSubview:_label];
    
    
    _slabel=[[UILabel alloc] init];
    _slabel.numberOfLines = 0;
    _slabel.textColor = fontGray;
    _slabel.textAlignment=0;
    [_slabel setFont:[UIFont systemFontOfSize:14]];
    _slabel.frame = CGRectMake(height+10, 40, screen_width-80, 20);
    [self.contentView  addSubview:_slabel];
    
}


-(void)setModel:(personModel *)model{
    self.label.text=[NSString stringWithFormat:@"%@(%@)",model.name,model.sex];
    self.slabel.text=[NSString stringWithFormat:@"%@",model.phone];
    self.imgViewL.image=[UIImage imageNamed:model.url];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        dispatch_group_t group = dispatch_group_create();
        
        __block UIImage *image1 = nil;
        
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            image1 = [self loadImage:model.url fileName:model.ID];
        });
        
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            self.imgViewL.image = image1;
            
        });
    });

    
}

-(UIImage *)loadImage:(NSString *)url  fileName:(NSString *)name{
    
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:imgData];
    if (image!=nil) {
        
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *createPath = [NSString stringWithFormat:@"%@/%@", pathDocuments,name];
        
        NSString *filePath = [createPath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@.png", name]];
        
        NSLog(@"%@",filePath);

        if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {

            [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
            BOOL result = [UIImagePNGRepresentation(image)  writeToFile:filePath    atomically:YES];            
            if (result) {
                NSLog(@"success.");
                
            }

        } else {
            NSLog(@"fileDir is exists.");
        }
        
        
        
        return image;
    }else{
        NSLog(@"there no image data");
        return image;
    }
    
}



@end
