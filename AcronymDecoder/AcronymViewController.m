//
//  AcronymViewController.m
//  AcronymDecoder
//
//  Created by Sonia Reddy Kolli.
//  Copyright (c) 2015 Sonia Reddy Kolli. All rights reserved.
//

#import "AcronymViewController.h"
#import "headerView.h"
#import "tableCell.h"
#import "LongFormVariantsViewController.h"

@interface AcronymViewController ()
{
    UITapGestureRecognizer *tap1;
    UITapGestureRecognizer *tap2;
    
    BOOL isSection1Closed;
    BOOL isSection2Closed;
    
    NSArray *acronymsList;
    NSArray *acronymsDetailsListFreq;
    NSArray *acronymsDetailsListYear;
    
    NSMutableDictionary     *arrayForIsExpand;
    NSUInteger              selectedSection;
    NSUInteger              previousSection;
    NSDictionary            *tempSelectedVariables;
     NSMutableArray            *sectionTitleArray;
    NSMutableDictionary     *lfvariantsDict;
}

@end

@implementation AcronymViewController
@synthesize tblWithSections;
@synthesize resultObject;

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
    
    tblWithSections.delegate = self;
    tblWithSections.dataSource = self;
    
    self.title = resultObject.shortForm;
    
    //to remove empty cells
    tblWithSections.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark -
#pragma mark Table View Datasource & Delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger rows = resultObject.longForms.count;
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CellIdentifier = @"tableCell";

    tableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [tableCell cell];

    }

    LFObject *lfObj = [resultObject.longForms objectAtIndex:indexPath.row];
    

    cell.year.text = [NSString stringWithFormat:@"%d",lfObj.establishedYear];
    cell.lf.text = lfObj.longForm;
    cell.variantsCount.text = [NSString stringWithFormat:@"%lu",(unsigned long)lfObj.longFormVariants.count];
    
    return cell;
}

-( CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    LongFormVariantsViewController *lfvc = [self.storyboard instantiateViewControllerWithIdentifier:@"LongFormVariantsViewController"];
    
    LFObject *lfObj = [resultObject.longForms objectAtIndex:indexPath.row];
    NSArray *lfVariants = lfObj.longFormVariants;
    lfvc.longFormVariants = lfVariants;
    lfvc.title = resultObject.shortForm;
    [self.navigationController pushViewController:lfvc animated:YES];
}

@end
