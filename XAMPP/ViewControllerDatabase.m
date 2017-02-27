//
//  ViewControllerDatabase.m
//  XAMPP
//
//  Created by chaitanya on 12/10/16.
//  Copyright © 2016 chaitanya. All rights reserved.
//

#import "ViewControllerDatabase.h"

@interface ViewControllerDatabase ()
{
    NSDictionary *json;
}

@end

@implementation ViewControllerDatabase

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.getjson = [[NSMutableArray alloc]init];
    
    self.userId = [[NSMutableArray alloc]init];
    self.userName = [[NSMutableArray alloc]init];
    self.userMsg = [[NSMutableArray alloc]init];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:kGETUrl]completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSLog(@"json is : %@",json);
        self.getjson = [json valueForKey:@"members"];
        
        self.userId = [[json valueForKey:@"members"] valueForKey:@"id"];
        self.userName = [[json valueForKey:@"members"] valueForKey:@"name"];
        self.userMsg = [[json valueForKey:@"members"]valueForKey:@"message"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myTableView reloadData];
        });
    }];
    
    [dataTask resume];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.userName.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.idLabel.text = [self.userId objectAtIndex:indexPath.row];
    cell.nameLabel.text = [self.userName objectAtIndex:indexPath.row];
    cell.messageView.text = [self.userMsg objectAtIndex:indexPath.row];
    return cell;
}

@end
