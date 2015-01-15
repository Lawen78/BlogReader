//
//  TableViewController.m
//  BlogReader
//
//  Created by Lorenzo on 15/01/15.
//  Copyright (c) 2015 Lorenzo. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    NSLog(@"%@",jsonData);
    NSError *error;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0  error:&error];
    
    self.blogPost = [dataDictionary objectForKey:@"posts"];
//    NSDictionary *resultsDictionary = [NSDictionary dictionaryWithDictionary:[dataDictionary objectForKey:@"responseData"]];
//    self.blogPost = [resultsDictionary objectForKey:@"results"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    NSDictionary *blogPost1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Widget in Android",@"title",
//                               @"Ben Jakuben",@"author",nil];
//    
//    NSDictionary *blogPost2 = [NSDictionary dictionaryWithObjectsAndKeys:@"iOS Dev",@"title",
//                               @"Amit Bijlani",@"author",nil];
//                               
//    NSDictionary *blogPost3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Android Dev",@"title",
//                                                           @"Joe Villenueva",@"author",nil];
    
    //self.blogPost = [NSArray arrayWithObjects:blogPost1,blogPost2,blogPost3, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.blogPost.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
       // Configure the cell...
    NSDictionary *blogPost = [self.blogPost objectAtIndex:indexPath.row];
    cell.textLabel.text = [blogPost objectForKey:@"title"];
    cell.detailTextLabel.text = [blogPost objectForKey:@"author"];
    return cell;

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
