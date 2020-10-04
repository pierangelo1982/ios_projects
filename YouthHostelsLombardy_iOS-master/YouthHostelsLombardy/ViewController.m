//
//  ViewController.m
//  YouthHostelsLombardy
//
//  Created by pierangelo on 16/05/15.
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
    NSString *denominazione;
    NSString *comune;
    NSString *indirizzo;
    NSString *telefono;
    NSString *latitudine;
    NSString *longitudine;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    denominazione = @"denominazione";
    comune = @"comune";
    indirizzo = @"indirizzo";
    telefono = @"telefono";
    latitudine = @"latitudine";
    longitudine = @"longitudine";
    
    myObject = [[NSMutableArray alloc] init];
    
    ///NSString *indirizzo_web = @"http://falegnameriapea.it/media/";

    
    NSData *jsonSource = [NSData dataWithContentsOfURL:
                          [NSURL URLWithString:@"https://www.dati.lombardia.it/resource/r9fb-4fm4.json"]];
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsonSource options:NSJSONReadingMutableContainers error:nil];
    
    for (NSDictionary *dataDict in jsonObjects) {
        NSString *denominazione_data = [dataDict valueForKeyPath:@"denominazione"];
        NSString *comune_data = [dataDict valueForKeyPath:@"comune_provincia"];
        NSString *indirizzo_data = [dataDict valueForKeyPath:@"indirizzo"];
        NSString *telefono_data = [dataDict valueForKeyPath:@"telefono"];
        NSString *latitudine_data = [dataDict valueForKeyPath:@"lat"];
        NSString *longitudine_data = [dataDict valueForKeyPath:@"lng"];
        
        NSLog(@"DENOMINAZIONE: %@",denominazione_data);
        NSLog(@"CITTA: %@", comune_data);
        NSLog(@"INDIRIZZO: @", indirizzo_data);
        NSLog(@"TELEFONO: %@",telefono_data);
        NSLog(@"LATITUDINE %@",latitudine_data);
        NSLog(@"LONGITUDINE %@",longitudine_data);
        
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                      denominazione_data, denominazione,
                      comune_data, comune,
                      indirizzo_data, indirizzo,
                      telefono_data, telefono,
                      latitudine_data,latitudine,
                      longitudine_data,longitudine,
                      nil];
        [myObject addObject:dictionary];
    }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueDettaglio"]) {
        NSIndexPath *indexPath = [self.tableData indexPathForSelectedRow];
        DetailViewController *dv = segue.destinationViewController;
        dv.myObject = [myObject objectAtIndex:indexPath.row];
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
    
    NSMutableString *denominazio;
    denominazio = [NSMutableString stringWithFormat:@"%@",
            [tmpDict objectForKeyedSubscript:denominazione]];
    
    NSMutableString *citta;
    citta = [NSMutableString stringWithFormat:@"Citta: %@ ",
              [tmpDict objectForKey:comune]];
    
    /*NSMutableString *indi;
    indi = [NSMutableString stringWithFormat:@"%@",
            [tmpDict objectForKey:indirizzo]]; */
    
    /*NSMutableString *images;
    images = [NSMutableString stringWithFormat:@"%@ ",
              [tmpDict objectForKey:thumbnail]]; */
    
    //NSURL *url = [NSURL URLWithString:[tmpDict objectForKey:thumbnail]];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    //UIImage *img = [[UIImage alloc]initWithData:data];
    UIImage *img = [UIImage imageNamed:@"location.png"];
    
    
    cell.textLabel.text = denominazio;
    cell.detailTextLabel.text= citta;
    cell.imageView.frame = CGRectMake(0, 0, 80, 70);
    cell.imageView.image =img;
    //cell.imageView.image = [UIImage imageNamed:@"location.png"];
    
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



/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueDettaglio"]) {
        NSIndexPath *indexPath = [self.tableData indexPathForSelectedRow];
        DetailViewController *dv = segue.destinationViewController;
        dv.myObject = [myObject objectAtIndex:indexPath.row];
    }
}
*/

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
