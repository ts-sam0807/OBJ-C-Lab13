//
//  ViewController.m
//  OBJ-C-LAB13
//
//  Created by Ts SaM on 15/9/2023.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    self.textField.center = self.view.center;
    self.textField.placeholder = @"Enter the string.........";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *inputText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:inputText];
    [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, inputText.length)];

    NSDictionary *colorMappings = @{
        @"red": [UIColor redColor],
        @"blue": [UIColor blueColor],
        @"green": [UIColor greenColor],
        @"yellow": [UIColor yellowColor]
    };
    
    for (NSString *colorWord in colorMappings.allKeys) {
        NSRange wordRange = [inputText rangeOfString:colorWord options:NSCaseInsensitiveSearch];
        if (wordRange.location != NSNotFound) {
            UIColor *color = colorMappings[colorWord];
            [attributedText addAttribute:NSForegroundColorAttributeName value:color range:wordRange];
        }
    }

    textField.attributedText = attributedText;
    
    return YES;
}

@end
