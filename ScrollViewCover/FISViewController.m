//
//  FISViewController.m
//  ScrollViewCover
//
//  Created by Joe Burgess on 11/21/13.
//  Copyright (c) 2013 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import <MapKit/MapKit.h>
#import "FISTableView.h"

@interface FISViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
@property IBOutlet UITableView *tableView;
@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate=self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.contentInset = UIEdgeInsetsMake(self.mapview.frame.size.height-40, 0, 0, 0);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basic"];
    
    cell.textLabel.text=[NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y < self.mapview.frame.size.height*-1 ) {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, self.mapview.frame.size.height*-1)];

    }
}

@end
