//
//  childViewController.h
//  pageControllers
//
//  Created by Cyrilshanway on 11/13/14.
//  Copyright (c) 2014 Cyrilshanway. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildViewController : UIViewController

@property(nonatomic, assign)NSInteger pageIndex;
@property(nonatomic, strong)NSString *imageFile;
@property(nonatomic, strong)NSString *titleText;
@end
