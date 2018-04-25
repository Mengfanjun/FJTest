//
//  ViewController.m
//  测试一
//
//  Created by 孟凡君 on 2018/3/26.
//  Copyright © 2018年 孟凡君. All rights reserved.
//

#import "ViewController.h"
#import "HomeCell.h"
#import "MailTableCell.h"

//屏幕尺寸
#define kScreen_Width [UIScreen  mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate , UITableViewDataSource,MGSwipeTableCellDelegate>
@property(nonatomic , strong)UITableView * ceshiTaBleV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"测试一";
    [self setupUI];
}


- (void)setupUI{
    
    self.ceshiTaBleV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) style:UITableViewStylePlain];
    self.ceshiTaBleV.delegate   = self;
    self.ceshiTaBleV.dataSource = self;
    self.ceshiTaBleV.backgroundColor  =  [UIColor yellowColor];
    
    [self.view addSubview:self.ceshiTaBleV];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCell * cell = [HomeCell cellWithTableView:tableView indePath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    
    
    [cell refreshContentView];
    
    cell.delegate = self;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

#pragma mark - 使cell的分割线延长
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
     NSLog(@"你点击了cell");
}

- (BOOL)swipeTableCell:(MGSwipeTableCell*)cell canSwipe:(MGSwipeDirection)direction{
    
    return YES;
}
//- (void)swipeTableCell:(MGSwipeTableCell*)cell
//   didChangeSwipeState:(MGSwipeState)state
//       gestureIsActive:(BOOL) gestureIsActive{
//
//     CGFloat padding = 15;
//    MGSwipeButton * trash = [MGSwipeButton buttonWithTitle:@"Trash" backgroundColor:[UIColor colorWithRed:1.0 green:59/255.0 blue:50/255.0 alpha:1.0] padding:padding callback:^BOOL(MGSwipeTableCell *sender) {
//
//
//        NSLog(@"点击了删除");
//        return YES; //don't autohide to improve delete animation
//    }];
//
//}
-(NSArray*) swipeTableCell:(MGSwipeTableCell*) cell swipeButtonsForDirection:(MGSwipeDirection)direction
             swipeSettings:(MGSwipeSettings*) swipeSettings expansionSettings:(MGSwipeExpansionSettings*) expansionSettings
{
    
    if (direction == MGSwipeDirectionRightToLeft) {
        CGFloat padding = 15;
        
        MGSwipeButton * trash = [MGSwipeButton buttonWithTitle:@"Trash" backgroundColor:[UIColor colorWithRed:1.0 green:59/255.0 blue:50/255.0 alpha:1.0] padding:padding callback:^BOOL(MGSwipeTableCell *sender) {
            
            NSLog(@"点击了删除");
            //        NSIndexPath * indexPath = [me.tableView indexPathForCell:sender];
            //        [me deleteMail:indexPath];
            return NO; //don't autohide to improve delete animation
        }];
        return @[trash];
    }
    return nil;
}


@end
