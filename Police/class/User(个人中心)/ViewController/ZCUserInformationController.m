//
//  ZCUserInformationController.m
//  Police
//
//  Created by MrSmallOrange on 16/7/27.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCUserInformationController.h"
#import "ZCCertificationBySwiftNumberController.h"
#import "ZCCertificationByIDCardController.h"

@interface ZCUserInformationController ()

@end

@implementation ZCUserInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.title = @"修改信息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(done)];

}

- (void)done{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 1) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"实名认证" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *alert1 = [UIAlertAction actionWithTitle:@"用公安流水号认证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            ZCCertificationBySwiftNumberController *swiftNumber = [[ZCCertificationBySwiftNumberController alloc] init];
            [self.navigationController pushViewController:swiftNumber animated:YES];
            
            
        }];
        UIAlertAction *alert2 = [UIAlertAction actionWithTitle:@"用证件认证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            ZCCertificationByIDCardController *IDCard = [[ZCCertificationByIDCardController alloc] init];
            [self.navigationController pushViewController:IDCard animated:YES];
        }];
                                
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertController addAction:alert1];
        [alertController addAction:alert2];
        [alertController addAction:cancel];
        [self presentViewController:alertController animated:YES completion:^{
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.selected = NO;
        }];
    }
}

@end
