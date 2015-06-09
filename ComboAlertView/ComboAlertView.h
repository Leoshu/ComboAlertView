
#import <UIKit/UIKit.h>

@protocol ClickComboAlertViewProtocol <NSObject>

@optional
- (void)onClickComboAlertAtIndex:(NSInteger)index;
- (void)onClickComboAlertWithTitle:(NSString *)title message:(NSString *)message atIndex:(NSInteger)index;
@end

@interface ComboAlertView : NSObject <UIAlertViewDelegate>

@property BOOL isShowing;

- (void)showWithVC:(UIViewController *)VC delegate:(id<ClickComboAlertViewProtocol>)delegate title:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles;

@end
