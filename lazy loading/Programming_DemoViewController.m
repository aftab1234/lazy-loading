//
//  Programming_DemoViewController.m
//  lazy loading
//
//  Created by Sam on 03/03/15.
//  Copyright (c) 2015 Bets. All rights reserved.
//

#import "Programming_DemoViewController.h"
#import "lazy cell.h"

@interface Programming_DemoViewController ()

@end

@implementation Programming_DemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   self.greekLetters = [[NSArray alloc] initWithObjects:
                    @"http://static2.dmcdn.net/static/video/656/177/44771656:jpeg_preview_small.jpg?20120509154705",
                    @"http://static2.dmcdn.net/static/video/629/228/44822926:jpeg_preview_small.jpg?20120509181018",
                    @"http://static2.dmcdn.net/static/video/116/367/44763611:jpeg_preview_small.jpg?20120509101749",
                        @"http://www.imgjunk.com/img/02/29022_thumbnail.jpg",
                    @"http://static2.dmcdn.net/static/video/666/645/43546666:jpeg_preview_small.jpg?20120412153140",
                    @"http://www.imgjunk.com/img/02/29022_thumbnail.jpg",
                    @"http://www.imgjunk.com/img/02/29020_thumbnail.jpg",
                    @"http://www.imgjunk.com/img/02/29020_thumbnail.jpg",
                    @"http://www.imgjunk.com/img/02/29022_thumbnail.jpg",
                    @"http://www.imgjunk.com/img/02/29020_thumbnail.jpg",
                    @"http://www.imgjunk.com/img/02/29020_thumbnail.jpg",
                        @" ",nil];
    //int i=0;
    
    //- See more at: http://www.theappguruz.com/ios/ios-lazy-loading-images/#sthash.gJKjTJEE.dpuf
    
//for (i=0; i<[self.greekLetters count]; i++)
//{
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self.greekLetters objectAtIndex:i]]];
//  
//    NSURLConnection *con =[NSURLConnection connectionWithRequest:request delegate:self];
//    if (con)
//    {
//     NSLog(@"connection establish");
//    }
//     NSData *imageData1 = [NSData dataWithData:_responseData];
//}
    //[self simpleJsonParsingPostMetod];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"%d",[self.greekLetters count]);
    return [self.greekLetters count];
    //NSLog(@"%d",[self.greekLetters count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
   lazy_cell *cell = (lazy_cell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[lazy_cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.thumbnailImageView.frame=CGRectMake(0,0,100,80);
    
    cell.nameLabel.text = [NSString stringWithFormat:@"Image #%d", indexPath.row+1];
    //cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    //[cell.imageView setImageWithURL:[NSURL URLWithString:[self.greekLetters objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    
    
   
    UIImage *placehoder= [UIImage imageNamed:@"placeholder.jpg"];
//   NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[self.greekLetters objectAtIndex:indexPath.row]]];
//    
//    
        NSData *imageData1 = [NSData dataWithData:_responseData];
//    for (i=0; i<[self.greekLetters count]; i++)
//    {
//        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self.greekLetters objectAtIndex:indexPath.row]]];
//        
//        NSURLConnection *con =[NSURLConnection connectionWithRequest:request delegate:self];
//        if (con)
//        {
//            NSLog(@"connection establish");
//        }
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[self.greekLetters objectAtIndex:indexPath.row]]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                
                                    UIImage *image = [[UIImage alloc] initWithData:data];
                                   if (data==nil) {
                                       cell.thumbnailImageView.image=placehoder;
                                   }
                                   else{
                                       cell.thumbnailImageView.image = image;
                                   }

                                  
                               }
                           }];
   
    
       //imageData1 = [NSData dataWithData:_responseData];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSData *imageData1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:[self.greekLetters objectAtIndex:indexPath.row]]];
//        UIImage *image = [UIImage imageWithData:imageData1];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (imageData1==nil) {
//                 cell.thumbnailImageView.image=placehoder;
//            }
//            else{
//            cell.thumbnailImageView.image = image;
//            }
//        });
//    });
    
    
  
//    if (imageData1==nil) {
//        cell.thumbnailImageView.image=placehoder;
//    }
//   // cell.thumbnailImageView.image=placehoder;
//    else{
//    cell.thumbnailImageView.image = [UIImage imageWithData:imageData1];
//    }
    
//    for (int i=0; i<[self.greekLetters count]; i++) {
        NSArray * documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[documentsDirectoryPath objectAtIndex:0];
        NSLog(@"%@",path);
        [self saveImage:[UIImage imageWithData:imageData1] withFileName:[NSString stringWithFormat:@"Image #%d", indexPath.row+1] ofType:@"png" inDirectory:documentsDirectoryPath];
////
//   UIImage  *imageFromWeb = [self loadImage:[NSString stringWithFormat:@"Image #%d", indexPath.row+1] ofType:@"png" inDirectory:documentsDirectoryPath];
////    //cell.thumbnailImageView.image=imageFromWeb;
//    if (imageData==nil) {
//        cell.thumbnailImageView.image=placehoder;
//    }
//    // cell.thumbnailImageView.image=placehoder;
//    else{
//        cell.thumbnailImageView.image = imageFromWeb;
//    }
    //}
//    }
    
   //_responseData=nil;
    //imageData1=nil;

    
    return cell;
}

-(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSArray *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"])
    {
        [UIImagePNGRepresentation(image) writeToFile:[[directoryPath objectAtIndex:0]  stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
       
    }
    else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"])
    {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[[directoryPath objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    }
    else
    {
        NSLog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
    }
}

-(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSArray *)directoryPath
{
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", [directoryPath objectAtIndex:0], fileName, extension]];
    
    return result;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
}
- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //imageData1 = [NSData dataWithData:_responseData];
//    image= [UIImage imageWithData:imageData1];
//    cell.thumbnailImageView.image=image;
    
    
}


//- (void)simpleJsonParsingPostMetod
//{
//    UIImage *image=[UIImage imageNamed:@"placeholder.jpg"];
//    NSData *imageData = UIImageJPEGRepresentation(image,90);
//    // setting up the URL to post to
//    NSString *urlString = @"http://iphone.zcentric.com/test-upload.php";
//    
//    // setting up the request object now
//    NSMutableURLRequest *request1 = [[NSMutableURLRequest alloc] init];
//    [request1 setURL:[NSURL URLWithString:urlString]];
//    [request1 setHTTPMethod:@"POST"];
//    
//    NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
//    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
//    [request1 addValue:contentType forHTTPHeaderField: @"Content-Type"];
//    
//    /*
//     now lets create the body of the post
//     */
//    NSMutableData *body = [NSMutableData data];
//    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"placeholder.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[NSData dataWithData:imageData]];
//    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    // setting the body of the post to the reqeust
//    [request1 setHTTPBody:body];
//    
//    // now lets make the connection to the web
//    NSData *returnData = [NSURLConnection sendSynchronousRequest:request1 returningResponse:nil error:nil];
//    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
//    
//    NSLog(@"%@",returnString);
//    
//    //-- Getting response form server
////    NSData *responseData = [NSURLConnection sendSynchronousRequest:request1 returningResponse:nil error:nil];
////    
////    //-- JSON Parsing with response data
////    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
////    NSLog(@"Result = %@",result);
//    
//}

//- See more at: http://www.theappguruz.com/ios/ios-lazy-loading-images/#sthash.gJKjTJEE.dpuf

    
@end
