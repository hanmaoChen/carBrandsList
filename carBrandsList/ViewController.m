//
//  ViewController.m
//  carBrandsList
//
//  Created by  chenhanmao on 9/6/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "ViewController.h"
#import "CHMCarGroup.h"
@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController{
    
//    保存添加的所有的信息
    NSArray *_carGroup;
}

//多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _carGroup.count;
}

//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    CHMCarGroup *carG =_carGroup[section];
    return carG.cars.count;
}
//什么类型的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    静态变量
    static NSString *ident = @"mycell";
//    利用重用识别码从缓存中读取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
//    如果缓存中不存在，重新创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
//    根据组索引取出组数据
    CHMCarGroup *cG = _carGroup[indexPath.section];
//    根据行索引取出该组中的某行数据
    CHMCars *car = cG.cars[indexPath.row];
    
//    赋值
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
//    NSLog(@"%@",car.icon);
    
    return cell;
}


#pragma mark - 添加组头文件

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    CHMCarGroup *cG = _carGroup[section];
    return cG.title;
}


- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self loadCarDate];

    [self setupUI];
}

#pragma mark - 加载汽车信息
-(void)loadCarDate{
//    读取plist中的文件
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"cars_total" withExtension:@"plist"];
    NSArray *dict = [NSArray arrayWithContentsOfURL:url];
//    将字典转为模型
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSDictionary *d in dict) {
        CHMCarGroup *cg = [CHMCarGroup carGroupWithDict:d];
        [arrM addObject:cg];
    }
//    让变量成员记录模型数组
    _carGroup = arrM;

}
#pragma mark - 搭建界面
-(void)setupUI{
//    创建tableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
//    行高
    tableView.rowHeight = 70;
    [self.view addSubview:tableView];
//    设置滚动范围
//    tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
