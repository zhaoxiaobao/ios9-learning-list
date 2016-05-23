//
//  ViewController.m
//  bishi
//
//  Created by zhaoyuan on 16/4/11.
//  Copyright © 2016年 赵远. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"





#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
#define navigationBarColor [UIColor colorWithRed:0.000 green:0.627 blue:0.914 alpha:1.00]


@interface ViewController ()

@end


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *_listDataP;
    NSArray *_listData;
    
    NSMutableArray *_sectionTitles;
    
}
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self initNav];
    [self initView];
    [self initData];
}

-(void)initNav{
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 64)];
    backView.backgroundColor=navigationBarColor;
    [self.view addSubview:backView];
    
    UILabel *navTitle=[[UILabel alloc] init];
    navTitle.frame=CGRectMake(screen_width/2-100, 30, 200, 25);
    
    navTitle.text=@"通讯簿";
    navTitle.textAlignment=1;
    navTitle.textColor=[UIColor whiteColor];
    navTitle.font = [UIFont boldSystemFontOfSize:17.0f];
    [backView addSubview:navTitle];
    
}


- (void)initView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self loadNewData];
    
    
}


- (void)loadNewData {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        [self getListData];
        dispatch_async(dispatch_get_main_queue(), ^{
            //update UI
        });
    });
    
}

-(void)getListData{
    
    
    //图像网络路径不稳定
    
    NSArray *dataDic=@[
                       @{
                           @"id": @"579335",
                           @"name": @"张三",
                           @"nameSX": @"Z",
                           @"sex": @"男",
                           @"age": @"25",
                           @"date": @"1988-3-6",
                           @"company": @"华远",
                           @"phone": @"1698658976",
                           @"url": @"http://www.easyicon.cn/download/png/579335/256/"
                           },
                       @{
                           @"id": @"579300",
                           @"name": @"李四",
                           @"nameSX": @"L",
                           @"sex": @"男",
                           @"age": @"35",
                           @"date": @"1978-3-6",
                           @"company": @"国贸",
                           @"phone": @"16956464564",
                           @"url": @"http://www.easyicon.cn/download/png/579300/256/"
                           },
                       @{
                           @"id": @"579320",
                           @"name": @"王五",
                           @"nameSX": @"W",
                           @"sex": @"男",
                           @"age": @"35",
                           @"date": @"1988-3-6",
                           @"company": @"电信",
                           @"phone": @"13678787878",
                           @"url": @"http://www.easyicon.cn/download/png/579320/256/"
                           },
                       @{
                           @"id": @"579305",
                           @"name": @"刘七",
                           @"nameSX": @"L",
                           @"sex": @"男",
                           @"age": @"35",
                           @"date": @"1988-3-6",
                           @"company": @"华远",
                           @"phone": @"13865895656",
                           @"url": @"http://www.easyicon.cn/download/png/579305/256/"
                           }
                       ];
    
    for (int i=0; i<dataDic.count; i++){
        personModel *model=[[personModel alloc] initWithDict:dataDic[i]];
        [_listDataP addObject:model];
        if (![_sectionTitles containsObject:model.nameSX]) {
            [_sectionTitles addObject:model.nameSX];

        }
    }
    
    
    //    for (int i=0; i<_sectionTitles.count; i++){
    //
    //        NSMutableArray *arr=[NSMutableArray new];
    //
    //        for (int i=0; i<dataDic.count; i++){
    //            personModel *model=[[personModel alloc] initWithDict:dataDic[i]];
    //            if ([model.nameSX isEqualToString:_sectionTitles[i]]) {
    //                [arr addObject:model];
    //            }
    //        }
    //
    //        [_listDataP addObject:arr];
    //
    //        NSLog(@"%@",_listDataP);
    //
    //    }
    //
    
    
    _listData=[[NSArray alloc] initWithObjects:
               @[_listDataP[0]],
               @[_listDataP[1],_listDataP[3]],
               @[_listDataP[2]]
               ,nil];
    
    [self.tableView reloadData];
    
    
    
}

- (void)initData{
    _listData=[[NSArray alloc] init];
    _listDataP=[[NSMutableArray alloc] init];
    _sectionTitles=[[NSMutableArray alloc] init];
}



#pragma mark - UITableViewDataSource
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_sectionTitles objectAtIndex:section];
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _sectionTitles;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sectionTitles.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [(NSArray *)_listData[section] count];    
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:index];
    [tableView scrollToRowAtIndexPath:selectIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    return index;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndentifier = @"cell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndentifier];
    }
    
    personModel *model=((NSArray *)_listData[indexPath.section])[indexPath.row];
    
    cell.model=model;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
