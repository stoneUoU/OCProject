//
//  YLZPlaceHolderTextView.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZPlaceHolderTextView.h"

@interface YLZPlaceHolderTextView()

@property (nonatomic, strong) UILabel *placeHolder_label;

@end

@implementation YLZPlaceHolderTextView
CGFloat const UI_PLACEHOLDER_TEXT_CHANGED_ANIMATION_DURATION = 0.25;

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
#if __has_feature(objc_arc)
#else
    [_placeHolderLabel release];
    _placeHolderLabel = nil;
    [_placeholderColor release];
    _placeholderColor = nil;
    [_placeholder release];
    _placeholder = nil;
    [super dealloc];
#endif
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    if (!self.placeholder) {
        _placeholder = @"";
    }
    
    if (!self.placeholderColor) {
        [self setPlaceholderColor:[UIColor lightGrayColor]];//color_HexStr:@"#cccccc"
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (id)initWithFrame:(CGRect)frame
{
    if( (self = [super initWithFrame:frame]) )
    {
        _placeholder = @"";
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textChanged:(NSNotification *)notification
{
    
    
    [UIView animateWithDuration:UI_PLACEHOLDER_TEXT_CHANGED_ANIMATION_DURATION animations:^{
        if([self text].length == 0)
        {
            [self viewWithTag:999].alpha = 1;
        }
        else
        {
            [self viewWithTag:999].alpha = 0;
        }
        
    }];
}


- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}


- (void)setPlaceholder:(NSString *)placeholder{
    if (_placeholder != placeholder) {
        _placeholder = placeholder;
        if( _placeholder.length > 0 )
        {
            UIEdgeInsets insets = self.textContainerInset;
            CGFloat curinsertLeftValue=insets.left+10;
            if(self.isNoInsertLeft)
            {
                curinsertLeftValue=insets.left;
            }
            if (_placeHolder_label == nil )
            {
                _placeHolder_label = [[UILabel alloc] initWithFrame:CGRectMake(4,8,self.bounds.size.width - (insets.left +insets.right-20),self.bounds.size.height)];
                _placeHolder_label.lineBreakMode = NSLineBreakByWordWrapping;
                _placeHolder_label.numberOfLines = 0;
                _placeHolder_label.font = [YLZFont regular:14];
                _placeHolder_label.backgroundColor = [UIColor clearColor];
                _placeHolder_label.textColor = self.placeholderColor;
                _placeHolder_label.alpha = 0;
                _placeHolder_label.tag = 999;
                [self addSubview:_placeHolder_label];
            }
            _placeHolder_label.text = self.placeholder;
            _placeHolder_label.frame = CGRectMake(4,8,self.bounds.size.width - (insets.left +insets.right-20),self.bounds.size.height);
            [_placeHolder_label sizeToFit];
            [self addSubview:_placeHolder_label];
        }
        if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
        {
            [self viewWithTag:999].alpha = 1;
            
        }
        
    }
    
}

@end

