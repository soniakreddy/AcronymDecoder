//
//  LongFormVariantsViewController.m
//  AcronymDecoder
//
//  Created by Sonia Reddy Kolli.
//  Copyright (c) 2015 Sonia Reddy Kolli. All rights reserved.
//

#import "LongFormVariantsViewController.h"
#import "DataObjects.h"
#import "tableCellLongForm.h"


@interface LongFormVariantsViewController ()

@end

@implementation LongFormVariantsViewController

@synthesize longFormVariants;
@synthesize longFormView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //to remove empty cells
    longFormView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger rows = longFormVariants.count;
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"tableCellLongForm";
    
    tableCellLongForm *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [tableCellLongForm cell];
    }
    
    LFObject *lfObj = [longFormVariants objectAtIndex:indexPath.row];
    
    cell.year.text = [NSString stringWithFormat:@"%d",lfObj.establishedYear];
    cell.frequency.text = [NSString stringWithFormat:@"%d",lfObj.frequency];
    cell.lf.text = lfObj.longForm;
    
    return cell;
}

-( CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
}

@end
