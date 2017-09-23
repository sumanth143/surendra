//
//  ViewController.m
//  NSUserDefaults_mani
//
//  Created by student on 8/3/17.
//  Copyright © 2017 brnInfotech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [self getSavedData];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTapChooseIMG:(id)sender
{
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    picker.delegate=self;
    picker.allowsEditing=YES;
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0)
{
    self.profileIMG.image=image;
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];

}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)onTapSaveBTN:(id)sender
{
    //Hide the keyboard
    [self.firstNameTF resignFirstResponder];
    [self.lastNameTF resignFirstResponder];
    [self.ageTF resignFirstResponder];
   
    // Create strings to store the text info
    NSString *firstName=self.firstNameTF.text;
    NSString *lastName=self.lastNameTF.text;
    NSString *age=self.ageTF.text;
    
    // Create instances of NSData
    UIImage *profileImage=self.profileIMG.image;
    NSData *imageData=UIImageJPEGRepresentation(profileImage, 100);
    
    // Store the data
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    [defaults setObject:firstName forKey:@"firstname"];
    [defaults setObject:lastName forKey:@"lastname"];
    [defaults setObject:age forKey:@"age"];
    [defaults setObject:imageData forKey:@"profileIMG"];
    [defaults synchronize];
    
    NSLog(@"data saved");
}
-(void)getSavedData
{
    //getting the saved data
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    NSString *firstName=[defaults objectForKey:@"firstname"];
    NSString *lastName=[defaults objectForKey:@"lastname"];
    NSString *age=[defaults objectForKey:@"age"];
    
    NSData *imageData=[defaults objectForKey:@"profileIMG"];
    UIImage *profileImage=[UIImage imageWithData:imageData];
    
    //update the uiElements with the saved data

    self.firstNameTF.text=firstName;
    self.lastNameTF.text=lastName;
    self.ageTF.text=age;
    self.profileIMG.image=profileImage;

}
@end
