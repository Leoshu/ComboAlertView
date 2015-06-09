
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButton:(id)sender {
    ComboAlertView *alert = [[ComboAlertView alloc] init];
    [alert showWithVC:self delegate:self title:@"Hello" message:@"My ComboAlertView" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"aaa",@"bbb",@"ccc"]];
}

#pragma mark - ClickComboAlertViewProtocol

- (void)onClickComboAlertWithTitle:(NSString *)title message:(NSString *)message atIndex:(NSInteger)index {
    NSLog(@"Click atIndex %ld", (long)index);
}
@end
