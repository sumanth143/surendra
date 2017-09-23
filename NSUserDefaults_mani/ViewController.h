//
//  ViewController.h
//  NSUserDefaults_mani
//
//  Created by student on 8/3/17.
//  Copyright © 2017 brnInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;

@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;
@property (weak, nonatomic) IBOutlet UIImageView *profileIMG;
- (IBAction)onTapChooseIMG:(id)sender;
- (IBAction)onTapSaveBTN:(id)sender;

@end

