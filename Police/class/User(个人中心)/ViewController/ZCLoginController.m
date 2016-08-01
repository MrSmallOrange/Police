//
//  ZCLoginController.m
//  Police
//
//  Created by MrSmallOrange on 16/7/26.
//  Copyright © 2016年 MrSmallOrange. All rights reserved.
//

#import "ZCLoginController.h"
#import "AFNetworking.h"
#import "ZCUser.h"
#import "MJExtension.h"
#import "ZCUserTool.h"
#import "SVProgressHUD.h"

@interface ZCLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
/** <#注释#>*/
@property (nonatomic, strong) ZCUser *user;

@end

@implementation ZCLoginController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginButton.enabled = NO;
    self.idTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [self.idTextField addTarget:self action:@selector(textFieldEditingChange) forControlEvents:UIControlEventEditingChanged];
    [self.passwordTextField addTarget:self action:@selector(textFieldEditingChange) forControlEvents:UIControlEventEditingChanged];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
#pragma mark - 关闭
- (IBAction)close {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark - 监听键盘
- (void)keyboardWillChangeFrame:(NSNotification *)notification{
    
    CGRect frame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat loginButtonY = CGRectGetMaxY(self.loginButton.frame) + 20;
    
    
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        
        if (frame.origin.y <  ZCScreenHeight) {
            CGFloat y = ABS(loginButtonY - frame.origin.y);
            self.backgroundView.transform = CGAffineTransformMakeTranslation(0, -y);
            self.closeButton.hidden = YES;

        }else{
            self.backgroundView.transform = CGAffineTransformIdentity;
            self.closeButton.hidden = NO;
        }
        

    }];
    
    
}

#pragma mark - 登陆
- (IBAction)login {
    if (self.idTextField.hasText && self.passwordTextField.hasText) {
        
        [SVProgressHUD showWithStatus:@"正在登陆"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        parameters[@"userName"] = self.idTextField.text;
        parameters[@"passWord"] = self.passwordTextField.text;

        
        [manager POST:@"http://59.175.192.203:8060/policeService/user/login.do" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            ZCUser *user = [ZCUser mj_objectWithKeyValues:responseObject[@"respInfo"]];
            
            if (user != nil) {
                [SVProgressHUD showSuccessWithStatus:@"登陆成功"];
                [ZCUserTool saveUser:user];
                [self dismissViewControllerAnimated:YES completion:nil];

            }
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@ 失败", error);
            [SVProgressHUD showErrorWithStatus:@"登陆失败"];

        }];
        
    }
    
    
}

#pragma mark - 判断登陆按钮是否可用
- (void)textFieldEditingChange{
    if (self.idTextField.hasText && self.passwordTextField.hasText) {
        self.loginButton.enabled = YES;
    }else{
        self.loginButton.enabled = NO;
    }
}



@end
