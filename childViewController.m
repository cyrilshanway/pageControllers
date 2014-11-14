//
//  childViewController.m
//  pageControllers
//
//  Created by Cyrilshanway on 11/13/14.
//  Copyright (c) 2014 Cyrilshanway. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labetText;
@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.labetText.text = [NSString stringWithFormat:@"Index :%li", self.pageIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
