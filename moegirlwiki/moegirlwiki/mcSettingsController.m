//
//  mcSettingsController.m
//  moegirlwiki
//
//  Created by master on 14-10-23.
//  Copyright (c) 2014年 masterchan.me. All rights reserved.
//

#import "mcSettingsController.h"

@interface mcSettingsController ()

@end

@implementation mcSettingsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [_SettingsTable setScrollsToTop:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark TableView


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 2;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //无图模式
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:CellIdentifier];
            cell.textLabel.text = @"无图模式";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UISwitch *SwitchItem = [[UISwitch alloc] initWithFrame:CGRectZero];
            [SwitchItem addTarget:self action:@selector(NoImageMode_Switch:) forControlEvents:UIControlEventValueChanged];
            NSUserDefaults *defaultdata = [NSUserDefaults standardUserDefaults];
            [SwitchItem setOn:[defaultdata boolForKey:@"NoImage"]];
            cell.accessoryView = SwitchItem;
        } else if (indexPath.row == 1) {
            //更新排版数据
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:CellIdentifier];
            cell.textLabel.text = @"更新排版数据";
            cell.detailTextLabel.text = @"最后检查日期：2014-10-24";
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //清除缓存
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:CellIdentifier];
            cell.textLabel.text = @"清除本地缓存";
            cell.detailTextLabel.text = @"已缓存了 xxx 个页面";
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
    } else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            //登录
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:CellIdentifier];
            cell.textLabel.text = @"登录";
            cell.detailTextLabel.text = @"当前你是以 游客 身份浏览萌娘百科";
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }else if (indexPath.row == 1) {
            //登录
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:CellIdentifier];
            cell.textLabel.text = @"编辑器参数设置";
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
    }else {
        if (indexPath.row == 0) {
            //意见反馈
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:CellIdentifier];
            cell.textLabel.text = @"反馈问题或建议";
            cell.detailTextLabel.text = @"帮助我们改进程序";
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            
        }else{
            //给我评分
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:CellIdentifier];
            cell.textLabel.text = @"给我评分";
            cell.detailTextLabel.text = @"据说给5星评价可以恢复程序猿的SAN值";
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        }
        
    }
        return cell;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"浏览设置";
    }else if (section == 1){
        return @"缓存";
    }else if (section == 2){
        return @"账户";
    }else{
        return @"其它";
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return @"升级排版数据至最新版可以提升浏览体验\n\n\n";
    }else if (section == 1){
        return @"使用右侧菜单中的刷新可以查看最新更新\n\n\n";
    }else if (section == 2){
        return @"手机端暂时无法提供注册功能，编辑器正在试验中\n\n\n";
    }else {
        return @"\n\n\n© 2014 Moegirlsaikou Foundation.\nAll rights reserved.";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 0:
            
            if (indexPath.row == 1) {
                //更新排版数据
                NSLog(@"更新排版数据");
                
            }
            
            break;
        case 1:
            
            if (indexPath.row == 0) {
                //清除本地缓存
                NSLog(@"清除本地缓存");
                
            }
        
            break;
        case 2:

            
            if (indexPath.row == 0) {
                //账户
                NSLog(@"账户");
                
            }else{
                //参数设置
                NSLog(@"参数设置");
                
            }
            
            break;
        case 3:
            
            if (indexPath.row == 0) {
                //反馈问题建议
                NSString * subject = [NSString stringWithFormat:@"萌娘百科反馈v2.0－%@%@-%dx%d",
                                            [[UIDevice currentDevice] systemVersion],
                                            [[UIDevice currentDevice] model],
                                            (int)self.view.frame.size.height,
                                            (int)self.view.frame.size.width
                                      ];
                NSString * body = @"请在这里输入您要反馈的问题或者建议，\n感谢您对本客户端的支持！";
                
                NSString * emaillink = [NSString stringWithFormat:@"mailto:contact@masterchan.me?subject=%@&body=%@",[subject stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[body stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:emaillink]];
                
            }else{
                //评分
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id892053828"]];
            }
            
            
            break;
        default:
            break;
    }
}

#pragma mark goBackButton

- (IBAction)goBackButtonClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark ActionsForMenu

-(void)NoImageMode_Switch:(id)sender
{
    UISwitch *switchView = (UISwitch *)sender;
    NSUserDefaults *defaultdata = [NSUserDefaults standardUserDefaults];
    [defaultdata setBool:[switchView isOn] forKey:@"NoImage"];
    [defaultdata synchronize];
}
@end
