------------------------------- Using Delayed Actions -------------------------------

Main Storyboard: 3 Labels and a button

ViewController.h:

	@interface ViewController : UIViewController {

	    IBOutlet UILabel *Label1;
	 
	    IBOutlet UILabel *Label2;
	    
	    IBOutlet UILabel *Label3;
	}

	- (IBAction)Delay;
	- (void)Delay1;
	- (void)Delay2;
	- (void)Delay3;

ViewController.m:

	- (IBAction)Delay {
	    
	    // Delay action for 5 seconds and then trigger Delay1
	    [self performSelector:@selector(Delay1) withObject:nil afterDelay:5.0];
	    // Delay action for 10 seconds and then trigger Delay2
	    [self performSelector:@selector(Delay2) withObject:nil afterDelay:10.0];
	    // Delay action for 15 seconds and then trigger Delay3
	    [self performSelector:@selector(Delay3) withObject:nil afterDelay:15.0];
	    
	}

	// Have to be declared in ViewController.h
	- (void)Delay1 {
	    Label1.text = @"Hello";
	    
	}
	- (void)Delay2 {
	    Label2.text = @"Whats Up";
	    
	}
	- (void)Delay3 {
	    Label3.text = @"Watch this";
	    Label1.textColor = [UIColor redColor];
	    Label2.textColor = [UIColor blueColor];
	    Label3.textColor = [UIColor greenColor];
	}

------------------------------- UIView -------------------------------

Main Storyboard: 2 buttons, 1 view

Change background color of view to something other than white

ViewController.h:

	@interface ViewController : UIViewController {

	    IBOutlet UIView *TheView;
	}
	- (IBAction)RevealView;
	- (IBAction)HideView;

ViewController.m:

	// View is not hidden
	- (IBAction)RevealView {
	    TheView.hidden = NO;
	}

	// View is hidden
	- (IBAction)HideView {
	    TheView.hidden = YES;
	}

------------------------------- Controlling UIScrollViews -------------------------------

Main Storyboard: 1 scrollview size 320px width x 568px height and a Label

// You don't have to place an object inside the scroll view
// You can place it underneath and it will scroll down to it
// (as long as the CGSizeMake height is bigger than the scroll
// view height)


ViewController.h: 

	@interface ViewController : UIViewController {

	    IBOutlet UIScrollView *ScrollView;
	    
	}


ViewController.m: 

	- (void)viewDidLoad {
	    [super viewDidLoad];
	    // Do any additional setup after loading the view, typically from a nib.
	    
	    // We want the scrollview to be enabled when the view loads up
	    [ScrollView setScrollEnabled:YES];
	    // 320 pixels is the width of the scroll view, we set the
	    // CGSizeMake width to 320 so we don't scroll horizontally
	    
	    // 568 pixels is the hieght of the scroll view, we set the
	    // CGSizeMake hieght to 1200 (more than what the scroll
	    // view size actually is) so the scrollview will display
	    // and scroll 1200 pixels on the screen
	    [ScrollView setContentSize:CGSizeMake(320, 1200)];
	}

	// We need to set the layout of our subview since we
	// are using a subview (so we can scroll on all different
	// devices
	- (void)viewDidLayoutSubviews {
	    [super viewDidLayoutSubviews];
	    [ScrollView setContentSize:CGSizeMake(320, 1200)];
	}

	- (void)didReceiveMemoryWarning {
	    [super didReceiveMemoryWarning];
	    // Dispose of any resources that can be recreated.
	}


------------------------------- Displaying UIAlertViews -------------------------------

Main Storyboard: 1 button

ViewController.h:
	@interface ViewController : UIViewController {

	}
	- (IBAction)AlertView;


ViewController.m:
	- (IBAction)AlertView {
	    UIAlertView *Alert = [[UIAlertView alloc] initWithTitle:@"Title"
	                                              message: @"This is the message"
	                                              delegate:nil
	                                              cancelButtonTitle:@"Dismiss"
	                                              // Option to add other buttons
	                                              otherButtonTitles:@"Okay", nil];
	    
	    [Alert show];
	} 



------------------------------- Using UIPickerViews -------------------------------

Main Storyboard: 1 Label and 1 Picker View

// MAKE SURE TO SELECTE dataSource AND delegate FOR PICKER VIEW
// Do this by dragging Picker View to ViewController Icon

ViewController.h:
	@interface ViewController : UIViewController {

	    IBOutlet UILabel *Label;
	    IBOutlet UIPickerView *Picker;
	    
	    // Create this array to load up and display the data of
	    // objects we want to display in our pickerview
	    NSArray *PickerData;
	    
	}

	// Need to retain the data so we don't have memory leaks
	@property (retain, nonatomic) IBOutlet UIPickerView *Picker;
	@property (retain, nonatomic) NSArray *PickerData;

ViewController.m:
	@synthesize Picker, PickerData;

	- (void)viewDidLoad {
	    [super viewDidLoad];
	    // Do any additional setup after loading the view, typically from a nib.


	    // Need to create NSArray to populate Picker View
	    NSArray *array = [[NSArray alloc] initWithObjects:@"One", @"Two", @"Three", @"Four", nil];
	    // Need our Picker View to equal NSArray
	    self.PickerData = array;
	    
	}


	- (void)didReceiveMemoryWarning {
	    [super didReceiveMemoryWarning];
	    // Dispose of any resources that can be recreated.
	}


	// Individual text in each line (number of columns)
	- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	    
	    return 1;
	}

	// Number of rows in Picker View
	- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	    
	    return [PickerData count];
	    
	}

	// Titles for each row
	- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	    
	    return [self.PickerData objectAtIndex:row];
	}

	// What happens when we pick one of the rows
	- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	    
	    NSInteger select = row;
	    
	    if (select == 0) {
	        Label.text = @"One";
	    }
	    if (select == 1) {
	        Label.text = @"Two";
	    }
	    if (select == 2) {
	        Label.text = @"Three";
	    }
	    if (select == 3) {
	        Label.text = @"Four";
	    }
	}

------------------------------- Using UIWebViews -------------------------------

// USEFUL FOR LOADING WEB PAGES INSIDE THE APPLICATION

Main Storyboard: 1 Web View

ViewController.h:

	@interface ViewController : UIViewController {
	    
	    IBOutlet UIWebView *WebView;
	    
	}


ViewController.m:

	- (void)viewDidLoad {
	    [super viewDidLoad];
	    // Do any additional setup after loading the view, typically from a nib.
	    
	    // Load URL request that is a string
	    [WebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com"]]];
	    
	}

------------------------------- Controlling UIWebViews -------------------------------

Main Storyboard: 1 Web View and 1 Toolbar

1. Duplicate item in Toolbar 3 times 
2. Select icons for going back, going forward, refreshing, stop loading web page.
3. Right-click and drag each icon to webview to set what it should do

------------------------------- Activity Indictor -------------------------------

Main Storyboard: 1 Web View, 1 Toolbar, and 1 Activity Indicator

// MAKE SURE TO CHANGE ACTIVITY INDICATOR TO "HIDES WHEN STOPPED"
// CHANGE WEB VIEW TO "SCALE TO FIT"

ViewController.h:

	@interface ViewController : UIViewController {
	    
	    IBOutlet UIWebView *WebView;
	    
	    IBOutlet UIActivityIndicatorView *ActivityIndicator;
	    
	    // For ActivityIndicator animation
	    NSTimer *timer;
	}


ViewController.m:

	- (void)viewDidLoad {
	    [super viewDidLoad];
	    // Do any additional setup after loading the view, typically from a nib.
	    
	    [WebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com"]]];
	    
	    [WebView addSubview:ActivityIndicator];
	    
	    // Configure timer to animate Activity Indicator
	    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(loading) userInfo:nil repeats:YES];
	    
	}

	- (void)loading {
	    if (!WebView.loading) {
	        [ActivityIndicator stopAnimating];
	    }
	    else {
	        [ActivityIndicator startAnimating];
	    }
	}

------------------------------- Using UIMapViews -------------------------------

1. Import framework for MapKit
	a. Click on your project at top of the project navigator
	b. Go to Build Phases
	c. Go to Link Binary with Libraries
	d. Add the MapKit framework

Main Storyboard: 1 MapKit View

// LINK MAPKIT VIEW WITH MAPVIEW IN VIEWCONTROLLER

ViewController.h:

	#import <UIKit/UIKit.h>
	#import <MapKit/MapKit.h>

	@interface ViewController : UIViewController {
	    
	    MKMapView *mapview;
	}

	@property (nonatomic, retain) IBOutlet MKMapView *mapview;


	@end


ViewController.m:

	@interface ViewController ()

	@end

	@implementation ViewController

	@synthesize mapview;

------------------------------- Controlling UIMapViews -------------------------------

Main Storybord: 1 MapKit View and 1 Segmented Control with 3 options

ViewController.h:

	- (IBAction)SegmentControl:(id)sender;


ViewController.m:

	- (IBAction)SegmentControl:(id)sender {
	    
	    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
	        case 0:
	            mapview.mapType = MKMapTypeStandard;
	            break;
	        case 1:
	            mapview.mapType = MKMapTypeSatellite;
	            break;
	        case 2:
	            mapview.mapType = MKMapTypeHybrid;
	            break;
	        default:
	            break;
	    }
	}
------------------------------- Switching Views in Storyboards -------------------------------

Main Storyboard: 2 ViewControllers, 1 button

// DON'T HAVE TO CREATE AN ACTION FOR THE BUTTON IF 
// SWITCHING TO A DIFFERENT VIEW
// JUST (RIGHT-CLICK) DRAG BUTTON TO OTHER VIEW CONTROLLER
// AND SELECTED "PRESENT MODALLY"
// Can also change around transition

// We CAN'T add a button to the second ViewController and
// make that button redirect to the first ViewController
// It will stack the views on top of each other

// Do redirect back to the first ViewController,
// we need to make classes for the second ViewController
// Create new Cocoa Touch File (NON XIB)

ViewController.h:
	// NOTHING

ViewController.m:
    // NOTHING

SecondViewController.h:

	#import <UIKit/UIKit.h>

	@interface SecondViewController : UIViewController {
	    
	}
	- (IBAction)ExitView:(id)sender;

SecondViewController.m: 

	- (IBAction)ExitView:(id)sender {
	    [self dismissViewControllerAnimated:YES completion:NULL];
	}

------------------------------- Switching to XIB View -------------------------------

// Create classes by creating new classes (XIB file)
// Import SecondViewController.h in ViewController.m

Main Storyboard: 1 button

SecondViewController.XIB: Label and Button

ViewController.h:

	@interface ViewController : UIViewController {
	    
	}
	- (IBAction)SwitchView:(id)sender;


ViewController.m:

	#import "SecondViewController.h"

    - (IBAction)SwitchView:(id)sender {
    
    // TRANSITION TO SECOND VIEW CONTROLLER
    
    // initWithNibName is for universal applications
    SecondViewController *second = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    
    // Create transition
    second.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:second animated:YES completion:NULL];
    
}

SecondViewController.h:

	@interface SecondViewController : UIViewController {
    
	}
	- (IBAction)ExitView:(id)sender;

SecondViewController.m: 

	- (IBAction)ExitView:(id)sender {
    
    	[self dismissViewControllerAnimated:YES completion:NULL];
	}


------------------------------- Removing The Status Bar -------------------------------

1. In Main Storyboard, click on ViewController icon and go over to 
"Simulated Metrics" and selected Status Bar to "None"
2. Go to Info.plist and create a new line with "Status Bar Initially Hidden"
and set it to "YES"
3. Create another line with "View controller-based status bar application"
and set it to "NO"

------------------------------- Important Files -------------------------------

1. Drag file into Supporting Files
2. Make sure to select "Copy items if Needed" option

------------------------------- Displaying Images -------------------------------

****Displaying preloaded image****

Add a ImageView to Main Storyboard and add the image

****Displaying image using action****

Main Storyboard: 1 button and 1 image view

ViewController.h:

	@interface ViewController : UIViewController {
	    
	    IBOutlet UIImageView *ImageView;
	    
	}
	- (IBAction)ShowImage;

ViewController.m:

	- (IBAction)ShowImage {
	    
	    UIImage *Img = [UIImage imageNamed:@"NETFLIXLOGO.jpeg"];

	    // Image to display
	    [ImageView setImage:Img];
	}

------------------------------- Displaying Retina Images -------------------------------

http://www.kylejlarson.com/blog/wp-content/uploads/2015/02/iphone-6-screen-size.jpg

xCode will recognie the correct image size need for the certain generation
and model of the device

You have to import images at 2 times, 3 times the size with the extension
@2x, @3x. xCode will look for the appropriate image size, and it if doesn't 
find it, then it will look one below.

------------------------------- Changing Images -------------------------------

Main Storyboard: 1 Image View and 3 buttons

ViewController.h:

	@interface ViewController : UIViewController {
	    
	    IBOutlet UIImageView *ImageView;
	    
	}
	- (IBAction)NetflixLogo;
	- (IBAction)HBONOWLogo;
	- (IBAction)AmazonIVLogo;



ViewController.m:

	- (IBAction)NetflixLogo {
	    UIImage *Img = [UIImage imageNamed:@"NETFLIXLOGO.jpeg"];
	    [ImageView setImage:Img];
	}

	- (IBAction)HBONOWLogo {
	    UIImage *Img = [UIImage imageNamed:@"HBONOW.jpg"];
	    [ImageView setImage:Img];
	}

	- (IBAction)AmazonIVLogo {
	    UIImage *Img = [UIImage imageNamed:@"AMAZONIV.png"];
	    [ImageView setImage:Img];
	}

------------------------------- Adding Images to Button -------------------------------

Can set an image as an button or image as the background of image.
Can change around how button interacts when clicked.

------------------------------- Displaying Images From URL's -------------------------------

Main Storyboard: 1 Image View

ViewController.h:
	@interface ViewController : UIViewController {
	    
	    IBOutlet UIImageView *ImageView;
	}


ViewController.m:
	- (void)viewDidLoad {
	    [super viewDidLoad];
	    // Do any additional setup after loading the view, typically from a nib.
	    
	    ImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.geekylemon.com/profile/lemonnew.png"]]];
	}


------------------------------- Displaying PDF's -------------------------------

Main Storyboard: 1 Web View

ViewController.h:

	@interface ViewController : UIViewController {
	    IBOutlet UIWebView *WebView;
	}

ViewController.m:

	- (void)viewDidLoad {
	    [super viewDidLoad];
	    // Do any additional setup after loading the view, typically from a nib.
	    
	    // example.pdf is name of pdf
	    NSString *path = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"pdf"];
	    NSURL *url = [NSURL fileURLWithPath:path];
	    NSURLRequest *request = [NSURLRequest requestWithURL:url];
	    [WebView loadRequest:request];
	}

------------------------------- Changing the Background Colour -------------------------------

Main Storyboard: 6 buttons

ViewController.h:
	@interface ViewController : UIViewController {
	    
	}

	- (IBAction)Red;
	- (IBAction)Yellow;
	- (IBAction)Blue;
	- (IBAction)Green;
	- (IBAction)Black;
	- (IBAction)White;

ViewController.m:

	- (IBAction)Red {
	    self.view.backgroundColor = [UIColor redColor];
	}

	- (IBAction)Yellow {
	    self.view.backgroundColor = [UIColor yellowColor];
	}

	- (IBAction)Blue {
	    self.view.backgroundColor = [UIColor blueColor];
	}

	- (IBAction)Green {
	    self.view.backgroundColor = [UIColor greenColor];
	}

	- (IBAction)Black {
	    self.view.backgroundColor = [UIColor blackColor];
	}

	- (IBAction)White {
	    self.view.backgroundColor = [UIColor whiteColor];
	}


------------------------------- Creating Animations -------------------------------

xCode doesn't register an animation. You have to take a series of images
and play them on top of each other.

Main Storyboard: 1 image view and 1 button


ViewController.h:

	@interface ViewController : UIViewController {

	    IBOutlet UIImageView *ImageView;
	    
	}

	- (IBAction)PlayAnimation:(id)sender;

ViewController.m:

	- (IBAction)PlayAnimation:(id)sender {
	    
	    // Store animation images in array
	    ImageView.animationImages = [NSArray arrayWithObjects: [UIImage imageNamed:@"1.tiff"],
	        [UIImage imageNamed:@"2.tiff"],
	        [UIImage imageNamed:@"3.tiff"],
	        [UIImage imageNamed:@"4.tiff"],
	        [UIImage imageNamed:@"5.tiff"],
	        [UIImage imageNamed:@"6.tiff"],
	        [UIImage imageNamed:@"7.tiff"],
	        [UIImage imageNamed:@"8.tiff"],nil];
	    
	    // Configure animation
	    [ImageView setAnimationRepeatCount:0];
	    ImageView.animationDuration = 2;
	    [ImageView startAnimating];
	    
	}

------------------------------- Adding Loading Screens/Launch Images -------------------------------

1. Go to Images.xcassets and you will see an icon for launch screen image
2. Select options for device
3. Drag and drop images

------------------------------- Universal Loading Screen -------------------------------

1. Under Images.xcassets, there is a LaunchScreen.xib file for universal launch screens
2. Change LaunchScreen image settings to "Do not use asset catalog"
3. We can customize however we like
4. When adding Labels, make sure to fit constraints by selecting the 
label and going down to the same |-Triangle-| on the bottom-right and 
selecting "Add Missing Constraints". 
5. If the label is too large for the screen, you can adjust it by going
to AutoShrink -> Minimum Font Size


------------------------------- Adding App Icons -------------------------------

1. Adding App Icons are located under Images.xcassets
2. Remember to look at scale when choosing App Icons
3. If size is 29 pixels and scale 2x, you need a image 58 x 58 pixels


------------------------------- Taking Screenshots Programatically -------------------------------

***There are two ways we are going to display a screen shot***

1. Take the screen shot and save to the Photo Library

2. Take a screen shot and display it in the image view

*** We need to import framework that allows us to take a screenshot **
- The framework is called QuartzCore 

Main Storyboard: 2 buttons and a ImageView

ViewController.h:

	#import "QuartzCore/QuartzCore.h"

	@interface ViewController : UIViewController {

	    IBOutlet UIImageView *ImageView;
	}

	- (IBAction)ScreenShotLibrary:(id)sender;
	- (IBAction)ScreenShotImageView:(id)sender;



ViewController.m:

	- (IBAction)ScreenShotLibrary:(id)sender {
	    
	    // Set size of the screen shot
	    UIGraphicsBeginImageContext(self.view.bounds.size);
	    // Render image
	    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	    UIImage *screenshotimage = UIGraphicsGetImageFromCurrentImageContext();
	    UIGraphicsEndImageContext();
	    
	    // Write image gotten from Graphics Context to Photos Library
	    UIImageWriteToSavedPhotosAlbum(screenshotimage, nil, nil, nil);
	}

	- (IBAction)ScreenShotImageView:(id)sender {
	    
	    // Set size of the screen shot
	    UIGraphicsBeginImageContext(self.view.bounds.size);
	    // Render image
	    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	    UIImage *screenshotimage = UIGraphicsGetImageFromCurrentImageContext();
	    UIGraphicsEndImageContext();
	    
	    // Write image gotten from Graphics Context to ImageView
	    ImageView.image = screenshotimage;
	    
	}


------------------------------- Taking Photos from Camera -------------------------------

Main Storyboard: 1 button and 1 image view

ViewController.h:
	
	// Allows us to use camera and take pictures 
	@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {

	    IBOutlet UIImageView *ImageView;
	    
	    UIImagePickerController *picker;
	    UIImage *image;
	}

	- (IBAction)TakePhoto:(id)sender;

ViewController.m:

	- (IBAction)TakePhoto:(id)sender {
	    
	    // Camera load up
	    picker = [[UIImagePickerController alloc] init];
	    picker.delegate = self;
	    
	    // Select type of picker or source we are loading up
	    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
	    
	    // Animate camera view into view
	    [self presentViewController:picker animated:YES completion:NULL];
	}

	// Place camera image into our image view
	- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	    
	    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	    [ImageView setImage:image];
	    
	    // Dismiss camera
	    [self dismissViewControllerAnimated:YES completion:NULL];
	}

	// When loading up camera, we have the ability to press cancel button
	// Cancel button dismisses camera
	- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	    
	    [self dismissViewControllerAnimated:YES completion:NULL];
	    
	}

------------------------------- Loading Images from Library -------------------------------

ViewController.h:
	@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {

	    IBOutlet UIImageView *ImageView;
	    
	    UIImagePickerController *picker;
	    UIImage *image;
	}

	- (IBAction)PhotoLibrary:(id)sender;

ViewController.m:

	- (IBAction)PhotoLibrary:(id)sender {
	    
	    // Photo library load up
	    picker = [[UIImagePickerController alloc] init];
	    picker.delegate = self;
	    
	    // Select type of picker or source we are loading up
	    // ONLY THIS LINE IS DIFFERENT FROM CAMERA FUNCTION
	    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
	    
	    // Animate photo library view into view
	    [self presentViewController:picker animated:YES completion:NULL];
	    
	}

	// Place camera/photo library image into our image view
	- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	    
	    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	    [ImageView setImage:image];
	    
	    // Dismiss view
	    [self dismissViewControllerAnimated:YES completion:NULL];
	}

	// When loading up picker, we have the ability to press cancel button
	// Cancel button dismisses camera/photo library
	- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	    
	    [self dismissViewControllerAnimated:YES completion:NULL];
	    
	}


------------------------------- Playing Audio Files -------------------------------

Playing audio files requires the framework AudioToolbox

Sound file name is "Sound.wav"

Main Storyboard: 1 button

ViewController.h:
	#import <AudioToolbox/AudioToolbox.h>


	@interface ViewController : UIViewController {

	    // Reference to sound we want to play
	    SystemSoundID SoundID;
	}

	- (IBAction)SoundFile;

ViewController.m:

	- (void)viewDidLoad {
	    [super viewDidLoad];
	    // Do any additional setup after loading the view, typically from a nib.
	    
	    // pathForResource is soundfile name
	    // ofType is the type of soundfile
	    NSURL *buttonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Sound" ofType:@"wav"]];
	    // Sound is loaded up
	    AudioServicesCreateSystemSoundID((__bridge CFURLRef)buttonURL, &SoundID);
	}


	- (void)didReceiveMemoryWarning {
	    [super didReceiveMemoryWarning];
	    // Dispose of any resources that can be recreated.
	}


	// We don't want the button loading the audio file
	// This happens in the viewDidLoad
	// The button just plays the loaded sound
	- (IBAction)SoundFile {
	    
	    AudioServicesPlaySystemSound(SoundID);
	    
	}


------------------------------- Playing Video Files -------------------------------

Playing video files requires the framework MediaPlayer

Video file name is "Video1.mp4"

Main Storyboard: 1 button 

ViewController.h:

	#import <MediaPlayer/MediaPlayer.h>


	@interface ViewController : UIViewController {

	}

	- (IBAction)PlayVideo;


ViewController.m:

	- (IBAction)PlayVideo {
	    
	    // Locate and bring the video into our button
	    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Video1" ofType:@"mp4"]];
	    // Locate video player view controller and load up and link it with video
	    MPMoviePlayerViewController *PlayerController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
	    // Animate and load up video on screen
	    [self presentMoviePlayerViewControllerAnimated:PlayerController];
	    // Equal our movie source type
	    PlayerController.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
	    // Play video
	    [PlayerController.moviePlayer play];
	    PlayerController = nil;
	    
	}

------------------------------- Playing YouTube Videos -------------------------------

Main Storyboard: 1 WebView 280 px width and 165 px height

ViewController.h:

	@interface ViewController : UIViewController {

	}

	@property (weak, nonatomic) IBOutlet UIWebView *WebView;

ViewController.m:

	- (void)viewDidLoad {
	    [super viewDidLoad];
	    // Do any additional setup after loading the view, typically from a nib.
	    
	    // Get string of URL and display in Web View
	    // THERE IS WILL BE A 15 pixel border around the video, so make
	    // sure to display the video 15 pixels smaller from width and height
	    // MAKE SURE TO PUT BACKSLASH "\" before each "" in the @""
	    NSString *EmbedCode = @"<iframe width=\"265\" height=\"140\" src=\"http://www.youtube.com/embed/ZsxQxS0AdBY\" frameborder=\"0\" allowfullscreen></iframe>";
	    [[self WebView] loadHTMLString:EmbedCode baseURL:nil];
	    
	    
	}

------------------------------- Streaming Live Radio -------------------------------

Main Storyboard: 1 button and 1 Web View

ViewController.h: 

	@interface ViewController : UIViewController {

	    IBOutlet UIWebView *WebView;
	}

	- (IBAction)PlayRadio:(id)sender;

ViewController.m:

	- (IBAction)PlayRadio:(id)sender {
	    
	    // Make sure stream is in .pls format - user friendly for WebView
	    NSString *stream = @"http://www.bbc.co.uk/radio/listen/live/r1.pls";
	    NSURL *url = [NSURL URLWithString:stream];
	    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
	    [WebView loadRequest:urlRequest];
	}

------------------------------- Streaming MP3 Files -------------------------------

Main Storyboard: Button and Webview

ViewController.h:

	@interface ViewController : UIViewController {

	    IBOutlet UIWebView *WebView;
	}

	- (IBAction)StreamMP3:(id)sender;

ViewController.m:

	- (IBAction)StreamMP3:(id)sender {
	    
	    NSString *stream = @"http://www.geekylemon.com/JungleBed.mp3";
	    NSURL *url = [NSURL URLWithString:stream];
	    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
	    [WebView loadRequest:urlRequest];
	    
	}


------------------------------- Vibrating the Device -------------------------------

// You need to add and import the AudioToolbox framework 
// in order to vibrate the device

Main Storyboard: 1 button

ViewController.h:

	@interface ViewController : UIViewController {

	}
	- (IBAction)VibrateDevice:(id)sender;


ViewController.m:

	#import "AudioToolbox/AudioToolbox.h"

	- (IBAction)VibrateDevice:(id)sender {
	    
	    // Play system sound vibrate
	    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	    
	}


------------------------------- Creating A Tab Bar Application -------------------------------

Table Bar Controller acts as a basis to the Tab Bar Application

To add a new view:
1. Add a new view controller
2. Link it with the Tab Bar Controller by right-click dragging
3. Select "Relationship Segue: View Controller"
4. Tab Bar Controller will add a new tab, you can customize it
5. You have to create New Cocoa Touch Class for the new view
6. Go to Identity tab on view controller and set Custom Class to new class files

------------------------------- Customizing A Tab Bar Application -------------------------------

Change use an image for our tabs

Can rearrange tabs

------------------------------- Creating A Table View Application -------------------------------

------------------------------- Pushing Table View to A Detail View -------------------------------

------------------------------- Populating A Detail View -------------------------------

------------------------------- Customising A Table View -------------------------------

------------------------------- Adding Table View Headers -------------------------------



------------------------------- Saving and Loading Text -------------------------------

------------------------------- Saving and Loading Data -------------------------------



------------------------------- Posting Text To Facebook -------------------------------

------------------------------- Posting Images To Facebook -------------------------------

------------------------------- Sending Twitter Tweets -------------------------------

------------------------------- Sending an SMS Message -------------------------------

------------------------------- Sending Image Via SMS -------------------------------

------------------------------- Sending An Email -------------------------------

------------------------------- Sending An Images Via Email -------------------------------

------------------------------- Making A Phone Call -------------------------------

------------------------------- Displaying Local Notifications -------------------------------

-------------------------------  -------------------------------

-------------------------------  -------------------------------




























