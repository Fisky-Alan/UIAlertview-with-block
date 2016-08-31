//
//  ViewController.m
//  AlanAlertView+Block
//
//  Created by fisky on 31/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+Blocks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnShowMe:(UIButton *)sender {

    
    [UIAlertView showWithTitle:@"How many relationship have u had untill now ?" message:@"mew- Tell me u! Playboy" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"1",@"2",@"3"] completion:^(UIAlertView *alertView, NSInteger buttonIndex) {
        
        
        
        [[[UIAlertView alloc] initWithTitle:@"Lie" message:[NSString stringWithFormat:@"Dont lie!!! you would have had more than %ld",(long)buttonIndex+1] delegate:nil cancelButtonTitle:@"Okiee" otherButtonTitles:nil, nil] show];
        
        
        
        
    }];

}


@end
