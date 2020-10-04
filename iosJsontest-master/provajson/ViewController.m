//
//  ViewController.m
//  provajson
//
//  Created by pierangelo on 11/04/15.
//  Copyright (c) 2015 pierangelo. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()
{
    NSMutableArray *myObject;
    // A dictionary object
    NSDictionary *dictionary;
    // Define keys
    NSString *title;
    NSString *thumbnail;
    NSString *author;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        title = @"title";
        thumbnail = @"thumbnail";
        author = @"author";
        
        myObject = [[NSMutableArray alloc] init];
    
        NSString *indirizzo_web = @"http://falegnameriapea.it/media/";

    
        NSData *jsonSource = [NSData dataWithContentsOfURL:
                              [NSURL URLWithString:@"http://falegnameriapea.it/json/index"]];
        
        id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                          jsonSource options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *dataDict in jsonObjects) {
            ///NSString *title_data = [dataDict objectForKey:@"fields.titolo"];
            NSString *title_data = [dataDict valueForKeyPath:@"fields.titolo"];
            ///NSString *thumbnail_data = [dataDict objectForKey:@"thumbnail"];
            NSString *thumbnail_data = [dataDict valueForKeyPath:@"fields.image"];
            NSString *thumbnail_url = [NSString stringWithFormat:@"%@%@", indirizzo_web, thumbnail_data];
            //NSString *risultato = [NSString stringWithFormat:@"%@ %@", nome, cognome];

            NSString *author_data = [dataDict objectForKey:@"author"];
            
            NSLog(@"TITLE: %@",title_data);
            NSLog(@"THUMBNAIL: %@",thumbnail_url);
            NSLog(@"AUTHOR: %@",author_data);
            
            dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                          title_data, title,
                          thumbnail_url, thumbnail,
                          author_data,author,
                          nil];
            [myObject addObject:dictionary];
        }
    }



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return myObject.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Item";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell=[[UITableViewCell alloc]initWithStyle:
              UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    NSDictionary *tmpDict = [myObject objectAtIndex:indexPath.row];
    
    NSMutableString *text;
    //text = [NSString stringWithFormat:@"%@",[tmpDict objectForKey:title]];
    text = [NSMutableString stringWithFormat:@"%@",
            [tmpDict objectForKeyedSubscript:title]];
    
    NSMutableString *detail;
    detail = [NSMutableString stringWithFormat:@"Author: %@ ",
              [tmpDict objectForKey:author]];
    
    NSMutableString *images;
    images = [NSMutableString stringWithFormat:@"%@ ",
              [tmpDict objectForKey:thumbnail]];
    
    NSURL *url = [NSURL URLWithString:[tmpDict objectForKey:thumbnail]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc]initWithData:data];
    
    
    cell.textLabel.text = text;
    cell.detailTextLabel.text= detail;
    cell.imageView.frame = CGRectMake(0, 0, 80, 70);
    cell.imageView.image =img;
    
    return cell;
}



/*
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     if ([segue.identifier isEqualToString:@"segueDettaglio"]) {
         NSIndexPath *indexPath = [self.tableData indexPathForSelectedRow];
         DetailViewController *dv = segue.destinationViewController;
         dv.setTitle = [myObject objectAtIndex:indexPath.row];
     }
 }
 */


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueDettaglio"]) {
        NSIndexPath *indexPath = [self.tableData indexPathForSelectedRow];
        DetailViewController *dv = segue.destinationViewController;
        dv.setTitle = [myObject objectAtIndex:indexPath.row];
    }
}



/*
-(void) prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueDettaglio"]) {
        NSIndexPath *indexpath = nil;
        NSString *titlestring = nil;
        
        indexpath = [_tableData indexPathForSelectedRow];
        titlestring = [myObject objectAtIndex:indexpath.row];
        
        [[segue destinationViewController] setTitle:titlestring];
        
    }
}
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
