//
//  HightViewController.m
//  project1
//
//  Created by OKYO_bk on 8/14/14.
//  Copyright (c) 2014 Okyobk. All rights reserved.
//

#import "HightViewController.h"
#import "ViewController.h"

@interface HightViewController (){
    UISegmentedControl *_SegmenHight;
    UITableView *_tableViewHight;
    NSInteger numbercell;
    NSDictionary *DictionHight;
    NSArray *ArrayHight;
    ViewController *mainVC;
    UIImage *imagecell;
}

@end

@implementation HightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    imagecell = [UIImage imageNamed:@"cellbackground.png"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger theHighScore = [defaults integerForKey:@"HightScore"];
    NSInteger theHighScore1 = [defaults integerForKey:@"HightScore1"];
    NSInteger theHighScore2 = [defaults integerForKey:@"HightScore2"];
    
    UIImageView *viewBar = [[UIImageView alloc] initWithFrame:CGRectMake(10, 25, 300, 50)];
    UIImage *image = [UIImage imageNamed:@"cer2.png"];
    UIImage *imageback1 = [UIImage imageNamed:@"back1"];
    UIImage *imageback2 = [UIImage imageNamed:@"back2"];
    viewBar.image = image;
    
    UIButton *back1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back1.frame = CGRectMake(10, 30, imageback1.size.width, imageback1.size.height);
    [back1 setBackgroundImage:imageback1 forState:UIControlStateNormal];
    [back1 setBackgroundImage:imageback2 forState:UIControlStateHighlighted];
    [back1 addTarget:self action:@selector(buttonback ) forControlEvents:UIControlEventTouchUpInside];

    
    ArrayHight = [[NSArray alloc]initWithObjects:[NSString stringWithFormat:@"%d", theHighScore], [NSString stringWithFormat:@"%d", theHighScore1], [NSString stringWithFormat:@"%d", theHighScore2], nil];
    
    
    NSArray *ItemArray = [[NSArray alloc] initWithObjects:@"MY CICLES", @"PUBLIC", nil];
    _SegmenHight = [[UISegmentedControl alloc] initWithItems:ItemArray];
    _SegmenHight.tintColor = [UIColor colorWithRed:51/255.0 green:160/255.0 blue:192/255.0 alpha:1];
    
    
    _SegmenHight.frame = CGRectMake(45, 30, 230, 25);
    [_SegmenHight addTarget:self action:@selector(SelectSegment) forControlEvents:UIControlEventValueChanged];
    _SegmenHight.selectedSegmentIndex = 0;
    
    _tableViewHight =[[UITableView alloc] initWithFrame:CGRectMake(10, 60, 300, 500)];
    _tableViewHight.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableViewHight.delegate = self;
    _tableViewHight.dataSource = self;
    
    
    [self.view addSubview:back1];
    [self.view addSubview:_SegmenHight];
    [self.view addSubview:_tableViewHight];
}

-(void)buttonback
{
    mainVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:mainVC animated:YES];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self CreatetableView];
}

-(void) SelectSegment{
    if(_SegmenHight.selectedSegmentIndex == 0)
    {
        NSLog(@"index0");
        numbercell = 3;
    }
    if(_SegmenHight.selectedSegmentIndex == 1)
    {
        NSLog(@"index1");
    }
    
}
-(void) CreatetableView
{
//    _tableViewHight = [UItableView ]
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return imagecell.size.height+40;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ArrayHight count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == Nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"cellbackground.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    cell.selectedBackgroundView =  [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"cellbackground.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    cell.imageView.image = [UIImage imageNamed:@"picgold.png"];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    label.text = [NSString stringWithFormat:@"      %@",[ArrayHight objectAtIndex:indexPath.row]];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Ranked First";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"Ranked Second";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"Ranked Three";
    }
    
    cell.accessoryView = label;
    return cell;
    
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
