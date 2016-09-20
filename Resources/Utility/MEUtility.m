//
//  MEUtility.m
//  MEDx
//
//  Created by Chetu on 15/01/14.
//  Copyright (c) 2014 Chetu. All rights reserved.
//

#import "MEUtility.h"
#import "TWMessageBarManager.h"
#import "Reachability.h"


//static int const BUTTON_MIN_HEIGHT = 30.0f;
//static int const PADDING = 10.0f;
//static int const kDefaultButtonAnimationTime = 0.25f;

// Strings
NSString * const kAppDelegateDemoStyleSheetImageIconError = @"icon-error.png";
NSString * const kAppDelegateDemoStyleSheetImageIconSuccess = @"icon-success.png";
NSString * const kAppDelegateDemoStyleSheetImageIconInfo = @"icon-info.png";


static NSString* const dateFormatLastseen = @"EEE, MMM d, yyyy h:mm a";
static NSString* const dateFormate = @"EEE, MMM d, yyyy";

@implementation MEUtility

#pragma mark - SHARED INSTANCE
//*******************************************
// SHARED INSTANCE
//*******************************************

+ (MEUtility*)sharedMEUtility{
    
    static MEUtility *mEUtility = nil;
    if (!mEUtility) {
        mEUtility = [[MEUtility alloc] init];
    }
    
    return mEUtility;
}

/***********************************************************************************************************
  <Name>getPendingFriendRequest</Name>
  <Input Type> N/A </Input Type>
  <Return> N/A </Return>
  <Purpose>Call web service api to get all pending friend request</Purpose>
  <History>
  <Header> Version 1.0 </Header>
  <Date> APR/02/2014 </Date>
  </History>
  <DeveloperName> Chetu INC </DeveloperName>
  ***********************************************************************************************************/
//+ (void)getPendingFriendRequest {
//    NSString* userId = [[MEDataModal sharedSharedDataModel] getLoggedInUserID];
//    if(userId){
//        NSDictionary* params = @{kUserId: userId};
//        
//        [[MEFriendManager sharedFriendManager] getPendingFriendRequest:params];
//    }
//}
//
//
//+ (UIImage *)captureView {
//    // Create a graphics context with the target size
//    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
//    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
//    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
//    if (NULL != &UIGraphicsBeginImageContextWithOptions)
//        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
//    else
//        UIGraphicsBeginImageContext(imageSize);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    // Iterate over every window from back to front
//    for (UIWindow *window in [[UIApplication sharedApplication] windows])
//    {
//        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen])
//        {
//            // -renderInContext: renders in the coordinate space of the layer,
//            // so we must first apply the layer's geometry to the graphics context
//            CGContextSaveGState(context);
//            // Center the context around the window's anchor point
//            CGContextTranslateCTM(context, [window center].x, [window center].y);
//            // Apply the window's transform about the anchor point
//            CGContextConcatCTM(context, [window transform]);
//            // Offset by the portion of the bounds left of and above the anchor point
//            CGContextTranslateCTM(context,
//                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
//                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
//            
//            // Render the layer hierarchy to the current context
//            [[window layer] renderInContext:context];
//            
//            // Restore the context
//            CGContextRestoreGState(context);
//        }
//    }
//    
//    // Retrieve the screenshot image
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return image;
//}

//+ (UIImage*)getIconImageForDocumentWithExtension :(MEDocumentExtensionType) ext {
//    
//    NSString* imageName = nil;
//    switch (ext) {
//        case MEDocumentExtensionTypeDoc:
//            imageName = @"word_icon";
//            break;
//        case MEDocumentExtensionTypeXlsx:
//            imageName = @"excel_icon";
//            break;
//        case MEDocumentExtensionTypePPt:
//            imageName = @"pawerpoint_icon";
//            break;
//        case MEDocumentExtensionTypeTxt:
//            imageName = @"text_icon";
//            break;
//        case MEDocumentExtensionTypePdf:
//            imageName = @"pdf_icon";
//            break;
//        case MEDocumentExtensionTypeUnknown :
//            imageName = @"default_doc";
//            break;
//        default:
//            imageName = @"default_doc";
//            break;
//    }
//    return [UIImage imageNamed:imageName];
//}
//
//
//+ (UIImage*)getImageForFileType:(NSInteger)fileType {
//    
//    NSString* imageName = nil;
//    switch (fileType) {
//        case 2:
//            imageName = @"image_placeholder";
//            break;
//        case 3:
//            imageName = @"video_icon";
//            break;
//        case 4:
//            imageName = @"word_icon";
//            break;
//        case 5:
//            imageName = @"excel_icon";
//            break;
//        case 6:
//            imageName = @"pawerpoint_icon";
//            break;
//        case 7:
//            imageName =@"text_icon";
//            break;
//        case 8:
//            imageName = @"pdf_icon";
//            break;
//        case 9:
//            imageName = @"default_medx";
//            break;
//        case 10:
//            imageName = @"default_doc";
//            break;
//        case 11:
//            imageName = @"audio_icon";
//            break;
//        default:
//            imageName = @"place_holder";
//            break;
//    }
//    
//    return [UIImage imageNamed:imageName];
//}
//
//#pragma mark - Encryption methods
//+ (NSString *)encryptText:(NSString *)strPlainText {
//    
//    //step 1: take string to be encrypted
//    NSString * _secret = strPlainText; // this is the text that you want to encrypt.
//    
//    //step 2: take key
//    NSString * _key = [[MEDataModal sharedSharedDataModel]getLoggedInUserID];
//    if (_key) {
//        //      _key = [[NSUserDefaults standardUserDefaults]safeObjectforKey:kSessionToken];
//        _key = @"anshikadharm";
//    }else {
//        _key = @"anshikadharm";
//    }//secret key for encryption. To make encryption stronger, we will not use this key directly. We'll first hash the key next step and then use it.
//    
//    //generate the
//    
//    //step 3: hash the key
//    _key = [[StringEncryption alloc] sha256:_key length:32]; //this is very important, 32 bytes = 256 bit
//    
//    //step 4: create the vector string
//    NSString * iv =   [[[[StringEncryption alloc] generateRandomIV:11]  base64EncodingWithLineLength:0] substringToIndex:16]; //Here we are generating random initialization vector (iv). Length of this vector = 16 bytes = 128 bits
//    
//    //step 5: create the encrypted data using key and iv string
//    // Now that we have input text, hashed key and random IV, we are all set for encryption:
//    NSData * encryptedData = [[StringEncryption alloc] encrypt:[_secret dataUsingEncoding:NSUTF8StringEncoding] key:_key iv:iv];
//    
//    //step 6: Create Encrypted Text
//    NSString * encryptedText = [encryptedData  base64EncodingWithLineLength:0];
//    
//    //Step 7: Append IV String at end of encryptedText
//    NSString *strEncryptedTextWithIVString = [NSString stringWithFormat:@"%@%@",iv,encryptedText];
//    
//    // Encryption = [plainText + secretKey + randomIV] = Cyphertext
//    
//    return strEncryptedTextWithIVString;
//}
//
//+ (NSString *)decryptText:(NSString *)strCipherText {
//        //step 1: create the vector string from cipher text
//    NSString * iv =   [strCipherText substringToIndex:16]; //Here we are generating random initialization vector (iv). Length of this vector = 16 bytes = 128 bits
//    
//    strCipherText =   [strCipherText substringFromIndex:16]; //Here we are generating ciphertext
//    
//    //step 2: convert encrypted text into encrypted data
//    NSData * encryptedData = [NSData dataWithBase64EncodedString:strCipherText];
//    
//    //step 3: take key
//    //step 2: take key
//    NSString * _key = [[MEDataModal sharedSharedDataModel]getLoggedInUserID];
//    if (_key) {
//        //      _key = [[NSUserDefaults standardUserDefaults]safeObjectforKey:kSessionToken];
//        _key = @"anshikadharm";
//    }else {
//        _key = @"anshikadharm";
//    }//secret key for encryption. To make encryption stronger, we will not use this key directly. We'll first hash the key next step and then use it.
//    
//    //step 4: hash the key
//    _key = [[StringEncryption alloc] sha256:_key length:32]; //this is very important, 32 bytes = 256 bit
//    
//    //step 5: decrypt the text using same key and iv string
//    NSData * decryptedData = [[StringEncryption alloc] decrypt:encryptedData  key:_key iv:iv];
//    
//    //step 6: convert the encrypteddata into string
//    NSString * decryptedText = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",decryptedText);
//    return decryptedText;
//}
//
//#pragma mark - Alert methods
//
+ (void) showFailedPopUpWithMessage :(NSString *) failedMessage{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:failedMessage description:nil type:TWMessageBarMessageTypeError statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
    });
}

+ (void)showSuccessPopUpWithMessage:(NSString *)message callback:(void (^)())callback {
    dispatch_async(dispatch_get_main_queue(), ^{
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:message description:nil type:TWMessageBarMessageTypeSuccess statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:callback];
     });
}
//
//+ (void)showChatMessagePopUp :(NSString *) friendName andMessage:(NSString *) message andImage :(UIImage *) image {
////    dispatch_async(dispatch_get_main_queue(), ^{
//    [UIView setAnimationsEnabled:YES];
//    [[TWMessageBarManager sharedInstance] showMessageWithTitle:friendName description:message type:TWMessageBarMessageTypeInfo statusBarStyle:[UIApplication sharedApplication].statusBarStyle withImage:image callback:nil];
//    [UIView setAnimationsEnabled:YES];
////         });
//}
//
//+(NSString *)messageForChatIncomingNotifierForType :(NSInteger) type isGroup:(BOOL) isGroup{
//    NSString *messageNotifier= @"";
//    switch (type) {
//        case 2:
//        case 3:
//        case 11:
//            messageNotifier = @"New Media";
//            break;
//        case 4:
//        case 5:
//        case 6:
//        case 7:
//        case 8:
//        case 10:
//            messageNotifier = @"New Document";
//            break;
//        case 9:
//            messageNotifier = @"New Study";
//            break;
//        default:
//            messageNotifier =isGroup ?@"New Group Message":@"New Message";
//            break;
//    }
//    return messageNotifier;
//}

//+ (void)addBorderInView:(UIView *) view withWidth :(float) width andCornerRadius :(float) cornerRadius andBorderColor :(UIColor *) color{
//    view.layer.borderColor = color.CGColor;
//    view.layer.cornerRadius = cornerRadius;
//    view.layer.borderWidth =  width;
//    
//}
//#pragma mark - Date methods
///***********************************************************************************************************
//  <Name>milliSecondsFromDate</Name>
//  <Input Type> date (NSDate) </Input Type>
//  <Return> return date in milliseconds </Return>
//  <Purpose> This function used to convert date time to milliseconds </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/20/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (double)milliSecondsFromDate:(NSDate*)date {
//    NSTimeInterval timeInMiliseconds = floor([date timeIntervalSince1970]*1000);
//    return timeInMiliseconds;
//}
//
///***********************************************************************************************************
//  <Name>dateFromMilliSeconds</Name>
//  <Input Type> date in millisconds (double) </Input Type>
//  <Return> return date from milliseconds </Return>
//  <Purpose> This function used to convert milliseconds to date </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/20/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (NSDate*)dateFromMilliSeconds:(double)milliSeconds {
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(milliSeconds / 1000)];
//    return date;
//}
//
///***********************************************************************************************************
//  <Name>dateFromString</Name>
//  <Input Type> date string (NSString) </Input Type>
//  <Return> return date from string </Return>
//  <Purpose> This function used to convert a date string into date </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/20/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (NSDate*)dateFromString:(NSString*)dateString {
//    
//    NSDateFormatter* df = [[NSDateFormatter alloc] init];
//    df.dateFormat = @"M/d/yy HH:mm a";
//    return [df dateFromString:dateString];
//}
//
//+ (NSDate*)dateFromStringFormat2:(NSString*)dateString {
//    
//    NSDateFormatter* df = [[NSDateFormatter alloc] init];
//    df.dateFormat = @"YYYY-MM-dd";
//    return [df dateFromString:dateString];
//}
//
///***********************************************************************************************************
//  <Name>stringFromDate</Name>
//  <Input Type> date (NSDate) </Input Type>
//  <Return> return formatted date string from a date </Return>
//  <Purpose> This function used to convert a date into a formatted date string </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (NSString *) stringFromDate:(NSDate *) dateStr {
//    NSDate* date =dateStr;//
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    df.dateFormat = @"M/d/yy";
//    NSString* strDate = [df stringFromDate:date];
//    df.dateFormat = @"h:mm a";
//    NSString* strTime = [df stringFromDate:date];
//    
//    NSString* dateString = [NSString stringWithFormat:@"%@ %@",strDate,strTime];
//    
//    return dateString;
//}
//
//+ (NSString *) stringFromDateinYY:(NSDate *) dateStr {
//    NSDate* date =dateStr;
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    df.dateFormat = @"M/d/yy";
//    NSString* strDate = [df stringFromDate:date];
//    
//    return strDate;
//}
//
//+ (NSString *) stringFromDateinYYYY:(NSDate *) dateStr {
//    NSDate* date =dateStr;
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    df.dateFormat = @"YYYY-MM-dd";
//    NSString* strDate = [df stringFromDate:date];
//    
//    return strDate;
//}
//
//
//+ (NSString *) datetimeLastOnline : (NSDate *) dateStr {
//    NSString* dateString = [NSString stringWithFormat:@"Last online %@ ",[MEUtility stringFromDate:dateStr]];
//    return dateString;
//}
///***********************************************************************************************************
//  <Name>getFormattedDateForSectionTitle</Name>
//  <Input Type> date string (NSString) </Input Type>
//  <Return> return formatted date string from a date string </Return>
//  <Purpose> This function used to change the date string fromate </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (NSString*)getFormattedDateForSectionTitle:(NSString*)dateString {
//    
//    NSDateFormatter* df = [[NSDateFormatter alloc] init];
//    df.dateFormat = dateFormate;
//    
//    NSString* today = [df stringFromDate:[NSDate date]];
//    NSString* yesterday = [df stringFromDate:[NSDate dateWithTimeIntervalSinceNow:-24*60*60]];
//    
//    NSString* date = dateString;
//    
//    dateString = [dateString uppercaseString];
//    today = [today uppercaseString];
//    yesterday = [yesterday uppercaseString];
//    
//    if ([dateString isEqualToString:today]) {
//        NSArray* array = [date componentsSeparatedByString:@","];
//        date = [NSString stringWithFormat:@"Today, %@, %@",[array safeObjectAtIndex:1],[array safeObjectAtIndex:2]];
//    }
//    else if ([dateString isEqualToString:yesterday]){
//        NSArray* array = [date componentsSeparatedByString:@","];
//        date = [NSString stringWithFormat:@"Yesterday, %@, %@",[array safeObjectAtIndex:1],[array safeObjectAtIndex:2]];
//    }
//    
//    return date;
//}
//
///***********************************************************************************************************
//  <Name>dateWiseKeyString</Name>
//  <Input Type> date string (NSString) </Input Type>
//  <Return> return formatted date string from a date string </Return>
//  <Purpose> This function used to change the date string fromate </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> MAR/12/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (NSString *) dateWiseKeyString:(NSDate *) dateStr {
//    NSDate* date =dateStr;
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    df.dateFormat = dateFormate;
//    NSString* dateString = [df stringFromDate:date];
//    return dateString;
//}
//
//
//+ (NSString*)getFormattedDate:(NSString*)dateString {
//    
//    NSString* formattedDateString;
//    
//    if ([dateString length]>0) {
//        
//        NSDateFormatter* df = [[NSDateFormatter alloc] init];
//        [df setDateFormat:@"yyyyMMdd"];
//        NSDate* date = [df dateFromString:dateString];
//        [df setDateFormat:@"M/d/yyyy"];
//        formattedDateString = [df stringFromDate:date];
//    }else {
//        
//        formattedDateString = @"";
//    }
//    return formattedDateString;
//}
//
//+ (NSString*)getFormattedDateInYY:(NSString*)dateString {
//    
//    NSString* formattedDateString;
//    
//    if ([dateString length]>0) {
//        
//        NSDateFormatter* df = [[NSDateFormatter alloc] init];
//        [df setDateFormat:@"yyyyMMdd"];
//        NSDate* date = [df dateFromString:dateString];
//        [df setDateFormat:@"M/d/yy"];
//        formattedDateString = [df stringFromDate:date];
//    }else {
//        formattedDateString = @"";
//    }
//    return formattedDateString;
//}
//
//+(NSString*)getWebserviceRequiredDateString:(NSString*)dateString {
//    
//    NSString* formattedDateString;
//    
//    if ([dateString length]>0) {
//        
//        NSDateFormatter* df = [[NSDateFormatter alloc] init];
//        [df setDateFormat:@"M/d/yyyy"];
//        NSDate* date = [df dateFromString:dateString];
//        [df setDateFormat:@"yyyyMMdd"];
//        formattedDateString = [df stringFromDate:date];
//    }else {
//        
//        formattedDateString = @"";
//    }
//    return formattedDateString;
//}
//
//+(NSString*)formattedDateString:(NSDate*)date {
//    
//    NSDateFormatter* df = [[NSDateFormatter alloc] init];
//    [df setDateFormat:@"M/d/yyyy"];
//    return [df stringFromDate:date];
//}
//
//+ (NSString*)getFormattedTime:(NSString*)dateString {
//    if (dateString) {
//        NSMutableString *formattedTime = [[NSMutableString alloc] initWithString:dateString];
//        [formattedTime insertString:@":" atIndex:2];
//        return formattedTime;
//    }
//    return nil;
//}
//
//+(NSString*)getFormattedDateStringWithDate:(NSDate*)date name:(NSString*)name {
//    NSDateFormatter* df = [[NSDateFormatter alloc] init];
//    df.dateFormat = @"M/d/yy hh:mm a";
//    NSString* dateString = [df stringFromDate:date];
//    return [dateString uppercaseString];
//}
//
///***********************************************************************************************************
//  <Name>formattedMessageTimeWithTimeInterval</Name>
//  <Input Type> N/A </Input Type>
//  <Return> web service request-response folder path </Return>
//  <Purpose> This function used to get web service api request-response text file path </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//NSString *formattedMessageTimeWithTimeInterval(NSTimeInterval messageTimeStamp){
//    
//    NSDateFormatter* df = [[NSDateFormatter alloc] init];
//    df.dateFormat = @"M/d/yy";
//    [df setTimeZone:[NSTimeZone localTimeZone]];
//    
//    NSDate *messageDate = [MEUtility dateFromMilliSeconds:messageTimeStamp];
//    if ([[df stringFromDate:messageDate] isEqualToString:[df stringFromDate:[NSDate date]]]) {
//        df.dateFormat = @"h:mm a";
//    }else {
//        df.dateFormat = @"M/d/yy";
//    }
//    NSString *messageToReturn = [df stringFromDate:messageDate];
//    return messageToReturn;
//}
//
//#pragma mark - String methods
//+ (NSArray *)getLinesArrayOfStringInLabel:(UILabel *)label
//{
//    NSString *text = [label text];
//    UIFont   *font = [label font];
//    CGRect    rect = [label frame];
//    
//    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
//    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
//    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
//    
//    
//    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
//    
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));
//    
//    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
//    
//    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
//    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
//    
//    for (id line in lines)
//    {
//        CTLineRef lineRef = (__bridge CTLineRef )line;
//        CFRange lineRange = CTLineGetStringRange(lineRef);
//        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
//        
//        NSString *lineString = [text substringWithRange:range];
//        [linesArray addObject:lineString];
//    }
//    
//    CGPathRelease(path);
//    CFRelease(frame);
//    CFRelease(frameSetter);
//    CFRelease(myFont);
//    return (NSArray *)linesArray;
//}
//
//+ (NSArray*)getSeparatedLinesFromLbl:(UILabel*)lbl{
//    if ( lbl.lineBreakMode != NSLineBreakByWordWrapping )
//    {
//        return nil;
//    }
//    
//    NSMutableArray* lines = [NSMutableArray arrayWithCapacity:10];
//    
//    NSCharacterSet* wordSeparators = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//    
//    NSString* currentLine = lbl.text;
//    NSInteger textLength = [lbl.text length];
//    
//    NSRange rCurrentLine = NSMakeRange(0, textLength);
//    NSRange rWhitespace = NSMakeRange(0,0);
//    NSRange rRemainingText = NSMakeRange(0, textLength);
//    BOOL done = NO;
//    while ( !done )
//    {
//        // determine the next whitespace word separator position
//        rWhitespace.location = rWhitespace.location + rWhitespace.length;
//        rWhitespace.length = textLength - rWhitespace.location;
//        rWhitespace = [lbl.text rangeOfCharacterFromSet: wordSeparators options: NSCaseInsensitiveSearch range: rWhitespace];
//        if ( rWhitespace.location == NSNotFound )
//        {
//            rWhitespace.location = textLength;
//            done = YES;
//        }
//        
//        NSRange rTest = NSMakeRange(rRemainingText.location, rWhitespace.location-rRemainingText.location);
//        
//        NSString* textTest = [lbl.text substringWithRange: rTest];
//        
//        CGSize sizeTest = [textTest sizeWithFont: lbl.font forWidth: 1024.0 lineBreakMode: NSLineBreakByWordWrapping];
//        if ( sizeTest.width > lbl.bounds.size.width )
//        {
//            [lines addObject: [currentLine stringByTrimmingCharactersInSet:wordSeparators]];
//            rRemainingText.location = rCurrentLine.location + rCurrentLine.length;
//            rRemainingText.length = textLength-rRemainingText.location;
//            continue;
//        }
//        
//        rCurrentLine = rTest;
//        currentLine = textTest;
//    }
//    
//    [lines addObject: [currentLine stringByTrimmingCharactersInSet:wordSeparators]];
//    
//    return lines;
//}
//
//NSString *removeLastWord(NSString *str) {
//    __block NSRange lastWordRange = NSMakeRange([str length], 0);
//    NSStringEnumerationOptions opts = NSStringEnumerationByWords | NSStringEnumerationReverse | NSStringEnumerationSubstringNotRequired;
//    [str enumerateSubstringsInRange:NSMakeRange(0, [str length]) options:opts usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
//        lastWordRange = substringRange;
//        *stop = YES;
//    }];
//    return [str substringToIndex:lastWordRange.location];
//}
//
//+ (CGFloat)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font
//{
//    CGFloat result = font.pointSize+4;
//    if (text) {
//        CGSize size;
//        CGRect frame = [text boundingRectWithSize:CGSizeMake(widthValue, CGFLOAT_MAX)
//                                          options:NSStringDrawingUsesLineFragmentOrigin
//                                       attributes:@{NSFontAttributeName:font}
//                                          context:nil];
//        size = CGSizeMake(frame.size.width, frame.size.height+1);
//        result = MAX(size.height, result); //At least one row
//    }
//    return result;
//}
//
//+ (CGFloat)widthOfString:(NSString *)string withFont:(UIFont *)font {
//    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
//    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size].width;
//}
//
//+ (CGSize)sizeOfString:(NSString *)string withFont:(UIFont *)font {
//    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
//    return [[NSAttributedString alloc] initWithString:string attributes:attributes].size;
//}
//
//
///***********************************************************************************************************
//  <Name>trim</Name>
//  <Input Type> string (NSString) </Input Type>
//  <Return> return string after removing space </Return>
//  <Purpose> This function used to remove start and end space from a string </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (NSString*)trim:(NSString*)string {
//    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//}
//
///***********************************************************************************************************
//  <Name>hasSpaces</Name>
//  <Input Type> string (NSString) </Input Type>
//  <Return> return true if fonud space </Return>
//  <Purpose> This function used to return boolean value if found a space or not </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (BOOL)hasSpaces:(NSString*)string {
//    return ([string rangeOfString:@" "].location !=NSNotFound);
//}
//
///***********************************************************************************************************
//  <Name>isValidEmailAddress</Name>
//  <Input Type> email address (NSString) </Input Type>
//  <Return> return true if email address is valide  </Return>
//  <Purpose> This function used to validate email address entered by the user </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (BOOL)isValidEmailAddress:(NSString *)emailAddress
//{
//    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
//    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$";
//    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
//    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
//    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
//    return [emailTest evaluateWithObject:emailAddress];
//}
//
///***********************************************************************************************************
//  <Name> isValidIPAddress </Name>
//  <Input Type> IP address string </Input Type>
//  <Return> Boolean  </Return>
//  <Purpose> This function used to validate IP address entered by the user </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JUNE/23/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (BOOL)isValidIPAddress:(NSString *)ipAddress
//{
//    NSString *ipValidStr = ipAddress;
//    NSString *ipRegEx =
//    @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
//    
//    NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", ipRegEx];
//    BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:ipValidStr];
//    
//    return myStringMatchesRegEx;
//}
//
//
///***********************************************************************************************************
//  <Name> isValidPortNumber </Name>
//  <Input Type> Port number string </Input Type>
//  <Return> Boolean  </Return>
//  <Purpose> This function used to validate Port number entered by the user </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JUNE/23/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (BOOL)isValidPortNumber:(NSString *)portNumber
//{
//    NSString *portNumberStr = portNumber;
//    NSString *portNumberRegEx =
//    @"^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$";
//    
//    NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", portNumberRegEx];
//    BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:portNumberStr];
//    
//    return myStringMatchesRegEx;
//}
//
//
//+ (BOOL)isValidHIPPAAPassword:(NSString *)password
//{
//    NSString *passwordValidStr = password;
//    NSString *passwordRegEx =
//    @"^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\\d\\W])|(?=.*\\W)(?=.*\\d))|(?=.*\\W)(?=.*[A-Z])(?=.*\\d)).{8,}$";
//    
//    NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegEx];
//    BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:passwordValidStr];
//    
//    return myStringMatchesRegEx;
//}
//#pragma mark - Encryption decryption methods
///***********************************************************************************************************
//  <Name>obfuscate</Name>
//  <Input Type> string (NSString) </Input Type>
//  <Return> return encrypted string  </Return>
//  <Purpose> This function used to encrypt/decrypt a string value with key </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> FEB/03/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (NSString *)obfuscate:(NSString *)string withKey:(NSString *)key
//{
//    // Create data object from the string
//    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
//    
//    // Get pointer to data to obfuscate
//    char *dataPtr = (char *) [data bytes];
//    
//    // Get pointer to key data
//    char *keyData = (char *) [[key dataUsingEncoding:NSUTF8StringEncoding] bytes];
//    
//    // Points to each char in sequence in the key
//    char *keyPtr = keyData;
//    int keyIndex = 0;
//    
//    // For each character in data, xor with current value in key
//    for (int x = 0; x < [data length]; x++)
//    {
//        // Replace current character in data with
//        // current character xor'd with current key value.
//        // Bump each pointer to the next character
//        *dataPtr = *dataPtr ^ *keyPtr;
//        dataPtr++;
//        keyPtr++;
//        
//        // If at end of key data, reset count and
//        // set key pointer back to start of key value
//        if (++keyIndex == [key length])
//            keyIndex = 0, keyPtr = keyData;
//    }
//    
//    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//}
//
///***********************************************************************************************************
//  <Name>enctrypt</Name>
//  <Input Type> string (NSString) </Input Type>
//  <Return> return encrypted string  </Return>
//  <Purpose> This function used to encrypt a string value with key </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> FEB/03/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (NSString*)enctrypt:(NSString*)string {
//    return [self obfuscate:string withKey:@"+@$"];
//}
//
///***********************************************************************************************************
//  <Name>decrypt</Name>
//  <Input Type> string (NSString) </Input Type>
//  <Return> return decrpt string  </Return>
//  <Purpose> This function used to decrypt a string value with key </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> FEB/03/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (NSString*)decrypt:(NSString*)encryptedString {
//    return [self obfuscate:encryptedString withKey:@"+@$"];
//}
//
///***********************************************************************************************************
//  <Name>stringFromImage</Name>
//  <Input Type> image (UIImage) </Input Type>
//  <Return> return image string  </Return>
//  <Purpose> This function used convert image data in base64 string </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (NSString *)stringFromImage:(UIImage *)image {
//    return [UIImageJPEGRepresentation(image, 1.0) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//}
//
///***********************************************************************************************************
//  <Name> emojiString </Name>
//  <Input Type> string </Input Type>
//  <Return> emoji string  </Return>
//  <Purpose> This function convert normal string to emoji string </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JUNE/11/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (NSString *)emojiString:(NSString *)string {
//    NSString *valueEmoj;
//    if ([string rangeOfString:@"\\n"].location == NSNotFound) {
//        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
//        valueEmoj = [[NSString alloc] initWithData:data encoding:NSNonLossyASCIIStringEncoding];
//    } else {
//        string = [string stringByReplacingOccurrencesOfString:@"\\n" withString:@"*"];
//        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
//        valueEmoj = [[NSString alloc] initWithData:data encoding:NSNonLossyASCIIStringEncoding];
//        valueEmoj = [valueEmoj stringByReplacingOccurrencesOfString:@"*" withString:@"\n"];
//    
//    }
//    
//    return valueEmoj;
//}
//
//+ (NSString*)emojiValue:(NSString*)string {
//    NSData *data = [[NSData alloc] initWithData:[string dataUsingEncoding:NSNonLossyASCIIStringEncoding]];
//    NSString* emojiValue = [[NSString alloc] initWithData:data encoding:NSNonLossyASCIIStringEncoding];
//    return emojiValue;
//}
//
//+ (NSString*)unicodeValue:(NSString*)emojiValue {
//    NSData *data = [emojiValue dataUsingEncoding:NSNonLossyASCIIStringEncoding];
//    NSString *unicodeValue = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    return unicodeValue;
//}
//
//+ (NSString*)blankFromNull:(NSString*)string {
//    
//    if (string && ![string isKindOfClass:[NSNull class]]) {
//        return string;
//    }
//    return @"";
//}
//
//#pragma mark - Image methods
///***********************************************************************************************************
//  <Name>getDefaultImageIfImageIsNil</Name>
//  <Input Type> image (UIImage) </Input Type>
//  <Return> return image string  </Return>
//  <Purpose> This function return default image for a nil image </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (UIImage*)getDefaultImageIfImageIsNil:(UIImage*)image {
//    if (image) {
//        return image;
//    }
//    return [UIImage imageNamed:@"image_placeholder"];
//}
///***********************************************************************************************************
//  <Name>getDefaultImageIfImageIsNil</Name>
//  <Input Type> image (UIImage) </Input Type>
//  <Return> image (UIImage)  </Return>
//  <Purpose> This function return default image for a nil image </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
////image_placeholder
//+ (UIImage*)getDefaultImageForProfileIfImageIsNil:(UIImage*)image {
//    if (image) {
//        return image;
//    }
//    return [UIImage imageNamed:@"profile"];
//}
//
//+ (UIImage*)getDefaultImageForLargeProfileIfImageIsNil:(UIImage*)image {
//    if (image) {
//        return image;
//    }
//    return [UIImage imageNamed:@"profile_large"];
//}
//+ (UIImage*)getDefaultImageForGroupProfileIfImageIsNil:(UIImage*)image {
//    if (image) {
//        return image;
//    }
//    return [UIImage imageNamed:@"profile_group"];
//}
///***********************************************************************************************************
//  <Name> getDefaultImageForVideoFileIfImageIsNil </Name>
//  <Input Type> image (UIImage) </Input Type>
//  <Return> image  </Return>
//  <Purpose> This function return default image for a nil image </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
////image_placeholder
//+ (UIImage*)getDefaultImageForVideoFileIfImageIsNil:(UIImage*)image {
//    if (image) {
//        return image;
//    }
//    return [UIImage imageNamed:@"video_icon"];
//}
//
//+ (UIImage*)getDefaultImageForAudioFileIfImageIsNil:(UIImage*)image {
//    if (image) {
//        return image;
//    }
//    return [UIImage imageNamed:@"audio_icon"];
//}
///***********************************************************************************************************
//  <Name> getDefaultImageForImageFileIfImageIsNil </Name>
//  <Input Type> image (UIImage) </Input Type>
//  <Return> image  </Return>
//  <Purpose> This function return default image for a nil image </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
////image_placeholder
//+ (UIImage*)getDefaultImageForImageFileIfImageIsNil:(UIImage*)image {
//    if (image) {
//        return image;
//    }
//    return [UIImage imageNamed:@"image_placeholder"];
//}
///***********************************************************************************************************
//  <Name>imageWithImage</Name>
//  <Input Type> image (UIImage) </Input Type>
//  <Return> return image string  </Return>
//  <Purpose> This function used scale an image </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
//{
//    UIGraphicsBeginImageContext( newSize );
//    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
//    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return newImage;
//}
///***********************************************************************************************************
//  <Name>imageFromString</Name>
//  <Input Type> image (UIImage) </Input Type>
//  <Return> return image string  </Return>
//  <Purpose> This function return image for image string </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (UIImage *)imageFromString:(NSString *)imageString {
//    NSData *data = [[NSData alloc]initWithBase64EncodedString:imageString options:NSDataBase64DecodingIgnoreUnknownCharacters];
//    return [UIImage imageWithData:data];
//}
//
///***********************************************************************************************************
//  <Name>resizeImage</Name>
//  <Input Type> Image </Input Type>
//  <Return> Resized image </Return>
//  <Purpose> This method resize an image and return the resized image </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> APR/16/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//const CGSize kSize = { 120.0f*3, 80.0f*3};
//
//+ (UIImage*)resizeImage:(UIImage*)image{
//    return [image resizedImageToFitInSize:kSize scaleIfSmaller:YES];
//}
//+ (UIImage*)resizeImage:(UIImage*)image toSize:(CGSize)size{
//    return [image resizedImageToFitInSize:size scaleIfSmaller:YES];
//}
//
//
//#pragma mark - Button methods
///***********************************************************************************************************
//  <Name>getHandShakeBarButtonItemWithTarget</Name>
//  <Input Type> N/A </Input Type>
//  <Return> UIBarButtonItem </Return>
//  <Purpose> This function return handshake bar button item </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (UIBarButtonItem*)getHandShakeBarButtonItemWithTarget:(id)target selector:(SEL)selector {
//    UIButton *handShakeButton = [[UIButton alloc] init];
//    handShakeButton.frame = CGRectMake(0, 0,40+9, 40);
//    [handShakeButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
//    [[handShakeButton imageView] setContentMode:UIViewContentModeScaleAspectFill];
//    [handShakeButton setImage:[UIImage imageNamed:@"hand_black"] forState:UIControlStateNormal];
//    [handShakeButton setImage:[UIImage imageNamed:@"hand_red"] forState:UIControlStateHighlighted];
//    return [[UIBarButtonItem alloc] initWithCustomView:handShakeButton];
//}
//
///***********************************************************************************************************
//  <Name>getGroupBarButtonItemWithTarget</Name>
//  <Input Type> N/A </Input Type>
//  <Return> UIBarButtonItem </Return>
//  <Purpose> This function return handshake bar button item </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (UIBarButtonItem*)getGroupBarButtonItemWithTarget:(id)target selector:(SEL)selector {
//    UIButton *handShakeButton = [[UIButton alloc] init];
//    handShakeButton.frame = CGRectMake(0, 0,40+15, 40);
//    [handShakeButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
//    [[handShakeButton imageView] setContentMode:UIViewContentModeScaleAspectFill];
//    [handShakeButton setImage:[UIImage imageNamed:@"group_black"] forState:UIControlStateNormal];
//    [handShakeButton setImage:[UIImage imageNamed:@"group_red"] forState:UIControlStateHighlighted];
//    return [[UIBarButtonItem alloc] initWithCustomView:handShakeButton];
//}
//
///***********************************************************************************************************
//  <Name>getProfileBarButtonItemWithTarget</Name>
//  <Input Type> N/A </Input Type>
//  <Return> UIBarButtonItem </Return>
//  <Purpose> This function return handshake bar button item </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (UIBarButtonItem*)getProfileBarButtonItemWithTarget:(id)target selector:(SEL)selector {
//    UIButton *profileButton = [[UIButton alloc] init];
//    profileButton.frame = CGRectMake(0,6, 50, 32);
//    [profileButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
//    [profileButton setBackgroundImage:[UIImage imageNamed:@"logo-new"] forState:UIControlStateNormal];    return [[UIBarButtonItem alloc] initWithCustomView:profileButton];
//}
//
//+ (void)updateButton:(UIButton *)button withAnimated:(BOOL)animated toString:(NSString*)tostring completed:(void (^)(void))completed isloading:(BOOL)isLoading{
//    // hide text, then start animation
//    [UIView animateWithDuration:kDefaultButtonAnimationTime animations:^{
//        
//        if (![button.titleLabel.text isEqualToString:tostring]) {
//            [button setTitle:@"" forState:UIControlStateNormal];
//        }
//        // calculate optimal new size
//        CGSize newSize = [tostring sizeWithAttributes:@{NSFontAttributeName: button.titleLabel.font}];
//        CGFloat newWidth = newSize.width + (PADDING * 2);
//        
//        CGFloat newHeight = BUTTON_MIN_HEIGHT > newSize.height ? BUTTON_MIN_HEIGHT : newSize.height ;
//        CGSize sizeThatFits = CGSizeMake(newWidth, newHeight);
//        
//        // set outer frame changes
//        button.titleEdgeInsets = UIEdgeInsetsMake(2.0, button.titleEdgeInsets.left, 0.0, 0.0);
//        CGRect cr = button.frame;
//        
//        cr.size.width = sizeThatFits.width;
//        cr.size.height=sizeThatFits.height;
//        if (cr.size.width>button.frame.size.width) {
//            cr.origin.x -= (cr.size.width -button.frame.size.width);
//        }else{
//            cr.origin.x += (-cr.size.width +button.frame.size.width);;
//            
//        }
//        
//        
//        if (isLoading) {
//            if (cr.size.width > cr.size.height) {
//                cr.origin.x +=(cr.size.width - cr.size.height);
//                
//            }
//            cr.size.width =cr.size.height;
//        }
//        button.frame = cr;
//        if (isLoading) {
//            button.layer.cornerRadius =button.frame.size.width/2;
//            
//        }
//    } completion:^(BOOL finished) {
//        [button setTitle:tostring forState:UIControlStateNormal];
//        if (completed) {
//            completed();
//            
//        }
//    }];
//    
//}
//#pragma mark - Textfield methods
///***********************************************************************************************************
//  <Name>paddingTextField</Name>
//  <Input Type> N/A </Input Type>
//  <Return> N/A </Return>
//  <Purpose> This function add padding to the input textfield </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (UITextField*)paddingTextField:(UITextField*)textField {
//    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
//    textField.leftView = paddingView;
//    textField.leftViewMode = UITextFieldViewModeAlways;
//    ////#warning iphone 4 issue
//    //    textField.attributedPlaceholder =
//    //    [[NSAttributedString alloc] initWithString:textField.placeholder
//    //                                    attributes:@{
//    //                                                 NSFontAttributeName : FONT_HELVETICA_ULTRALIGHT(textField.font.pointSize)
//    //                                                 }
//    //     ];
//    return textField;
//}
//
//#pragma mark - Tabbar methods
///***********************************************************************************************************
//  <Name>getTabBarController</Name>
//  <Input Type> N/A </Input Type>
//  <Return> UITabBarController  </Return>
//  <Purpose> This function return tabbar controller </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (UITabBarController*)getTabBarController {
//    UITabBarController* tabBarController = nil;
//    if (IS_OS_7_OR_LATER) {
//        tabBarController = (UITabBarController*)[[[UIApplication sharedApplication] keyWindow] rootViewController];
//    }else {
//        tabBarController = (UITabBarController*)[[[[UIApplication sharedApplication] windows] safeObjectAtIndex:0] rootViewController];
//    }
//    return tabBarController;
//}
//
//+ (void)selectTabBarItem:(NSInteger)index popToRoot :(BOOL) popToRoot {
//    UITabBarController* tabBarController = nil;
//    if (IS_OS_7_OR_LATER) {
//        tabBarController = (UITabBarController*)[[[UIApplication sharedApplication] keyWindow] rootViewController];
//    }else {
//        tabBarController = (UITabBarController*)[[[[UIApplication sharedApplication] windows] safeObjectAtIndex:0] rootViewController];
//    }
//    
//    if (tabBarController) {
//        
//        [tabBarController setSelectedIndex:index];
//        if (index == 0 ) {
//            UINavigationController *navigationController = [[tabBarController viewControllers] safeObjectAtIndex:0];
//            [navigationController popToRootViewControllerAnimated:YES];
//            
//            [navigationController.navigationBar setHidden:NO];
//            
//            if (tabBarController.tabBar) {
//                [tabBarController.tabBar setHidden:NO];
//            }
//            [MEUtility setBlackRedTheme];
//        }
//    }else {
//    }
//}
//
//+ (CGRect)screenSize {
//    return [[UIScreen mainScreen] bounds];
//}
//
//+ (void)convertVideoToQuailty:(MEVideoQualityType)videoQuality withInputURL:(NSURL*)inputURL
//                    outputURL:(NSURL*)outputURL
//                      handler:(void (^)(AVAssetExportSession*))handler
//{
//    NSString * quality = @"";
//    if (videoQuality == MELowQuality) {
//        quality = AVAssetExportPresetLowQuality;
//    }else if (videoQuality == MEMediumQuality){
//        quality =  AVAssetExportPresetMediumQuality;
//    }else if (videoQuality == MEHighQuality){
//        quality = AVAssetExportPresetHighestQuality;
//    }else{
//        quality = AVAssetExportPreset640x480;
//    }
//    
//    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:inputURL options:nil];
//    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:asset presetName:quality];
//    exportSession.outputURL = outputURL;
//    exportSession.outputFileType = AVFileTypeQuickTimeMovie;
//    [exportSession exportAsynchronouslyWithCompletionHandler:^(void)
//     {
//         handler(exportSession);
//     }];
//}
//
//
//
//#pragma mark - Image download methods
///***********************************************************************************************************
//  <Name>processImageDataWithBubbleObject</Name>
//  <Input Type> bubbleObj (MEBubbleData) </Input Type>
//  <Return> N/A  </Return>
//  <Purpose> This function download image for a bubble data with the image url </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> FEB/19/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (void)processImageDataWithBubbleObject:(MEBubbleData *)bubbleObj andBlock:(void (^)(NSData *imageData,MEBubbleData *bubbleObj))processImage{
//    
//    NSURL *url = [NSURL URLWithString:bubbleObj.imageUrl];
//    
//    dispatch_queue_t callerQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    dispatch_queue_t downloadQueue = dispatch_queue_create("com.medx.processsmagequeue", NULL);
//    dispatch_async(downloadQueue, ^{
//        NSData * imageData = [NSData dataWithContentsOfURL:url];
//        dispatch_async(callerQueue, ^{
//            processImage(imageData,bubbleObj);
//        });
//    });
//}
//
///***********************************************************************************************************
//  <Name>processImageDataWithGroupBubbleObject</Name>
//  <Input Type> bubbleObj (MEBubbleData) </Input Type>
//  <Return> N/A  </Return>
//  <Purpose> This function download image for a bubble data with the image url </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> FEB/19/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (void)processImageDataWithGroupBubbleObject:(MEGroupBubbleData *)groupBubbleObj andBlock:(void (^)(NSData *imageData,MEGroupBubbleData *groupBubbleObj))processImage{
//    NSURL *url = [NSURL URLWithString:groupBubbleObj.imageUrl];
//    
//    dispatch_queue_t callerQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    dispatch_queue_t downloadQueue = dispatch_queue_create("com.medx.processsmagequeue", NULL);
//    dispatch_async(downloadQueue, ^{
//        NSData * imageData = [NSData dataWithContentsOfURL:url];
//        dispatch_async(callerQueue, ^{
//            processImage(imageData,groupBubbleObj);
//        });
//    });
//}
//
///***********************************************************************************************************
//  <Name>processImageDataWithMediaObject</Name>
//  <Input Type> bubbleObj (MEBubbleData) </Input Type>
//  <Return> N/A  </Return>
//  <Purpose> This function download image for a bubble data with the image url </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> FEB/19/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (void)processImageDataWithMediaObject:(MEMedia *)mediaObj andBlock:(void (^)(NSData *imageData, MEMedia *mediaObj))processImage{
//    
//    NSURL *url = [NSURL URLWithString:((mediaObj.mediaImageType == MEMediaImageTypeThumbnail)? mediaObj.thumbnailImageUrl:mediaObj.actualImageUrl)];
//    
//    dispatch_queue_t callerQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    dispatch_queue_t downloadQueue = dispatch_queue_create("com.medx.processsmagequeue", NULL);
//    dispatch_async(downloadQueue, ^{
//        NSData * imageData = [NSData dataWithContentsOfURL:url];
//        dispatch_async(callerQueue, ^{
//            processImage(imageData, mediaObj);
//        });
//    });
//}
//
///***********************************************************************************************************
//  <Name> processImageDataWithPaperClipObj </Name>
//  <Input Type> bubbleObj (MEBubbleData) </Input Type>
//  <Return> N/A  </Return>
//  <Purpose> This function download image for a bubble data with the image url </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> MAY/22/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (void)processImageDataWithPaperClipObj:(MEPaperClip *)paperClipObj andBlock:(void (^)(NSData *imageData, MEPaperClip *paperClipObj))processImage{
//    
//    NSURL *url = [NSURL URLWithString:((paperClipObj.isProcessForThumbnailImage)? paperClipObj.thumbUrl:paperClipObj.actualUrl)];
//    
//    dispatch_queue_t callerQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    dispatch_queue_t downloadQueue = dispatch_queue_create("com.medx.processsmagequeue", NULL);
//    dispatch_async(downloadQueue, ^{
//        NSData * imageData = [NSData dataWithContentsOfURL:url];
//        dispatch_async(callerQueue, ^{
//            processImage(imageData, paperClipObj);
//        });
//    });
//}
///***********************************************************************************************************
//  <Name>processImageDataWithUserModal</Name>
//  <Input Type> user modal </Input Type>
//  <Return> N/A  </Return>
//  <Purpose> This function download image for a user modal data with the image url </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> MAY/05/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (void)processImageDataWithFriendModal:(id)object andBlock:(void (^)(UIImage *image ,  id friendObj))processImage{
//    NSString *urlString = nil;
//    NSString *name = nil;
//    BOOL isNewImage = YES;
//    if ([object isKindOfClass:[MEFriend class]]) {
//        urlString = ((MEFriend *) object).thumbnailImageUrl;
//       name = [((MEFriend *) object).actualImageUrl lastPathComponent];
//        isNewImage = ((MEFriend *) object).isNewImage;
//        
//    }else if ([object isKindOfClass:[MEContact class]]) {
//        urlString = ((MEContact *) object).thumbnailImageUrl;
//           name = [((MEContact *) object).actualImageUrl lastPathComponent];
//    }
//    
//    
//    
//    NSURL *URL = [NSURL URLWithString:urlString];
//    dispatch_queue_t callerQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    
//    if (![MEUtility isFileExistInThumbnailImageFolderWithName:name] || isNewImage){
//        dispatch_queue_t downloadQueue = dispatch_queue_create("com.medx.processsmagequeue", NULL);
//        dispatch_async(downloadQueue, ^{
//            
//            NSData * imageData = [NSData dataWithContentsOfURL:URL];
//            UIImage* image = [UIImage imageWithData:imageData];
//            
//            if (image) {
//                
//                [MEUtility saveImageToThumbnailImageFolder1:image withName:name];
//            }
//            
//            dispatch_async(callerQueue, ^{
//                processImage(image,object);
//            });
//            imageData =nil;
//            image =nil;
//            
//        });
//        
//    }else {
//        UIImage *image = [MEUtility getThumbnailImageFromThumbnailImageFolderWithName:name];
//        dispatch_async(callerQueue, ^{
//            processImage(image,object);
//        });
//        image =nil;
//    }
//    URL = nil;
//}
//
///**********************************************************************************************/
//
//+ (void)processImageWithUrl:(NSString *)url andBlock:(void (^)(UIImage *image ,NSString *url))processImage {
//    
//    NSURL *URL = [NSURL URLWithString:url];
//    
//    //    NSString* imageName = [url lastPathComponent];
//    
//    if (![MEUtility isFileExistInImageFolderWithUrl:url]){
//        
//        dispatch_queue_t callerQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//        dispatch_queue_t downloadQueue = dispatch_queue_create("com.medx.processsmagequeue", NULL);
//        dispatch_async(downloadQueue, ^{
//            
//            NSData * imageData = [NSData dataWithContentsOfURL:URL];
//            UIImage* image = [UIImage imageWithData:imageData];
//            
//            if (image) {
//                
//                [MEUtility saveImageToImageFolder1:image withUrl:url];
//            }
//            dispatch_async(callerQueue, ^{
//                processImage(image , url);
//            });
//            
//        });
//        
//    }else {
//        
//        UIImage *image = [MEUtility getImageFromImageFolderWithUrl:url];
//        
//        dispatch_queue_t callerQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//        dispatch_async(callerQueue, ^{
//            processImage(image , url);
//        });
//    }
//}
//+ (BOOL)isFileExistInVideoFolderWithUrl:(NSString*)url {
//    
//    NSString* videoName = [url lastPathComponent];
//    
//    NSString* filePath = [[MEUtility getVideoFolderPath] stringByAppendingPathComponent:videoName];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
//        return YES;
//    }
//    return NO;
//}
//+ (BOOL)isFileExistInImageFolderWithUrl:(NSString*)url {
//    
//    NSString* imageName = [url lastPathComponent];
//    
//    NSString* filePath = [[MEUtility getImageFolderPath] stringByAppendingPathComponent:imageName];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
//        return YES;
//    }
//    return NO;
//}
//
//+ (BOOL)isFileExistInDocumentsFolderWithName:(NSString*)docName {
//    NSString* filePath = [[MEUtility getDocumentFolderPath] stringByAppendingPathComponent:docName];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
//        return YES;
//    }
//    return NO;
//}
//
//
//+ (void)saveImageToImageFolder1:(UIImage*)image withUrl:(NSString*)url {
//    
//    NSString* imageName = [url lastPathComponent];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        NSString *mainImgPath = [[MEUtility getImageFolderPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", imageName]];
//        NSData* imageData = UIImageJPEGRepresentation(image, 1.0f);
//        [imageData writeToFile:mainImgPath options:NSAtomicWrite error:nil];
//    });
//}
//
//+ (UIImage*)getImageFromImageFolderWithUrl:(NSString*)url {
//    
//    NSString* imageName = [url lastPathComponent];
//    NSString* filePath = [[self getImageFolderPath] stringByAppendingPathComponent:imageName];
//    return [UIImage imageWithContentsOfFile:filePath];
//}
//
//+ (void)deleteImageFromImageFolderWithUrl:(NSString*)url {
//    
//    NSString* imageName = [url lastPathComponent];
//    
//    NSString *path = [MEUtility getImageFolderPath];
//    NSString* filePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",imageName]];
//    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
//}
//
//+ (void)processThumbnailImageWithUrl:(NSString *)url andBlock:(void (^)(UIImage *image))processImage{
//    NSURL *URL = [NSURL URLWithString:url];
//    dispatch_queue_t callerQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    
//    if (![MEUtility isFileExistInThumbnailImageFolderWithUrl:url]){
//        
//        dispatch_queue_t downloadQueue = dispatch_queue_create("com.medx.processsmagequeue", NULL);
//        dispatch_async(downloadQueue, ^{
//            
//            NSData * imageData = [NSData dataWithContentsOfURL:URL];
//            UIImage* image = [UIImage imageWithData:imageData];
//            
//            if (image) {
//                
//                [MEUtility saveImageToThumbnailImageFolder1:image withUrl:url];
//            }
//            
//            dispatch_async(callerQueue, ^{
//                processImage(image);
//            });
//            
//        });
//        
//    }else {
//        
//        UIImage *image = [MEUtility getThumbnailImageFromThumbnailImageFolderWithUrl:url];
//        dispatch_async(callerQueue, ^{
//            processImage(image);
//        });
//    }
//}
//
//+ (BOOL)isFileExistInThumbnailImageFolderWithUrl:(NSString*)url {
//    return [MEUtility isFileExistInThumbnailImageFolderWithName: [url lastPathComponent]];
//}
//
//+ (void)saveImageToThumbnailImageFolder1:(UIImage*)image withUrl:(NSString*)url {
//    [MEUtility saveImageToThumbnailImageFolder1:image withName:[url lastPathComponent]];
//}
//
//+ (UIImage*)getThumbnailImageFromThumbnailImageFolderWithUrl:(NSString*)url {
//    return [MEUtility getThumbnailImageFromThumbnailImageFolderWithName: [url lastPathComponent]];
//}
//
//+ (void)deleteThumbnailImageFromThumbnailImageFolderWithUrl:(NSString*)url {
//    
//    NSString* imageName = [url lastPathComponent];
//    
//    NSString *path = [MEUtility getThumbnailImageFolderPath];
//    NSString* filePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",imageName]];
//    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
//}
//
//
//+ (BOOL)isFileExistInThumbnailImageFolderWithName:(NSString*)imageName {
//    NSString* filePath = [[MEUtility getThumbnailImageFolderPath] stringByAppendingPathComponent:imageName];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
//        filePath = nil;
//        return YES;
//    }
//    filePath = nil;
//    return NO;
//}
//
//+ (UIImage*)getThumbnailImageFromThumbnailImageFolderWithName:(NSString*)imageName {
//    
//    NSString *path = [MEUtility getThumbnailImageFolderPath];
//    NSString* filePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",imageName]];
//    path = nil;
//    return [UIImage imageWithContentsOfFile:filePath];
//}
//
//+ (void)saveImageToThumbnailImageFolder1:(UIImage*)image withName:(NSString*)imageName {
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        
//        NSString *thumbnailImgPath = [[MEUtility getThumbnailImageFolderPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", imageName]];
//        NSData* thumbnailImageData = UIImageJPEGRepresentation(image, 0.5f);
//        [thumbnailImageData writeToFile:thumbnailImgPath options:NSAtomicWrite error:nil];
//        thumbnailImageData = nil;
//        thumbnailImgPath =nil;
//    });
//}
//
//+ (void)processThumbnailImageWithUrl:(NSString *)url withName :(NSString *) name andBlock:(void (^)(UIImage *image))processImage {
//    NSURL *URL = [NSURL URLWithString:url];
//    dispatch_queue_t callerQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    
//    if (![MEUtility isFileExistInThumbnailImageFolderWithName:name]){
//        
//        dispatch_queue_t downloadQueue = dispatch_queue_create("com.medx.processsmagequeue", NULL);
//        dispatch_async(downloadQueue, ^{
//            
//            NSData * imageData = [NSData dataWithContentsOfURL:URL];
//            UIImage* image = [UIImage imageWithData:imageData];
//            
//            if (image) {
//                
//                [MEUtility saveImageToThumbnailImageFolder1:image withName:name];
//            }
//            
//            dispatch_async(callerQueue, ^{
//                processImage(image);
//            });
//            imageData =nil;
//            image =nil;
//            
//        });
//        
//    }else {
//        
//        UIImage *image = [MEUtility getThumbnailImageFromThumbnailImageFolderWithName:name];
//        dispatch_async(callerQueue, ^{
//            processImage(image);
//        });
//        image =nil;
//    }
//    URL = nil;
//    
//}
//
//+ (void)printPDFFromFilepath:(NSString *)filePath :(UIButton *)button {
//    //    NSURL *fileURL = [NSURL URLWithString:filePath];
//    UIPrintInteractionController *printInteraction;
//    
//    Class printInteractionController = NSClassFromString(@"UIPrintInteractionController");
//    
//    if ((printInteractionController != nil) && [printInteractionController isPrintingAvailable])
//    {
//        //NSURL *fileURL = document.fileURL; // Document file URL
//        
//        printInteraction = [printInteractionController sharedPrintController];
//        NSData *printData = [NSData dataWithContentsOfFile:filePath];
//        if ([printInteractionController canPrintData:printData] == YES) // Check first
//        {
//            UIPrintInfo *printInfo = [NSClassFromString(@"UIPrintInfo") printInfo];
//            
//            printInfo.duplex = UIPrintInfoDuplexLongEdge;
//            printInfo.outputType = UIPrintInfoOutputGeneral;
//            printInfo.jobName = @"PrintFile";
//            
//            printInteraction.printInfo = printInfo;
//            printInteraction.printingItem = printData;
//            printInteraction.showsPageRange = YES;
//            printInteraction.printPageRenderer = nil;
//            [printInteraction presentAnimated:YES completionHandler:
//             ^(UIPrintInteractionController *pic, BOOL completed, NSError *error)
//             {
//                 if (completed) {
//                     [MEUtility showSuccessPopUpWithMessage:@"Print successful" callback:nil];
//                 }else{
////                      [MEUtility showSuccessPopUpWithMessage:@"Print failed" callback:nil];
//                 }
//             }
//             ];
//        }
//    }
//}
//
//
///***********************************************************************************************************/
//
//+ (NSString*)getDocumentFolderPath {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *documentsPath = [paths safeObjectAtIndex:0];
//    NSString *folderPath = [documentsPath stringByAppendingPathComponent:@"MEDX_Doc"];
//    // Check if the directory already exists
//    if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
//        // Directory does not exist so create it
//        [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    return folderPath;
//}
//
//#pragma mark - File manager methods
///***********************************************************************************************************
//  <Name>getImageFolderPath</Name>
//  <Input Type> N/A </Input Type>
//  <Return> N/A  </Return>
//  <Purpose> This function return image folder path </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> FEB/19/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (NSString*)getImageFolderPath {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *documentsPath = [paths safeObjectAtIndex:0];
//    NSString *folderPath = [documentsPath stringByAppendingPathComponent:@"MEDx_Image"];
//    folderPath = [folderPath stringByAppendingPathComponent:@"main"];
//    // Check if the directory already exists
//    if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
//        // Directory does not exist so create it
//        [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    return folderPath;
//}
//
//+ (NSString*)getThumbnailImageFolderPath {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *documentsPath = [paths safeObjectAtIndex:0];
//    NSString *folderPath = [documentsPath stringByAppendingPathComponent:@"MEDx_Image"];
//    folderPath = [folderPath stringByAppendingPathComponent:@"thumbnail"];
//    // Check if the directory already exists
//    if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
//        // Directory does not exist so create it
//        [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    return folderPath;
//}
//
//+ (NSString*)getVideoFolderPath {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *documentsPath = [paths safeObjectAtIndex:0];
//    NSString *folderPath = [documentsPath stringByAppendingPathComponent:@"MEDx_Video"];
//    // Check if the directory already exists
//    if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
//        // Directory does not exist so create it
//        [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    return folderPath;
//}
//
///***********************************************************************************************************
//  <Name> getTempFolderPath </Name>
//  <Input Type> N/A </Input Type>
//  <Return> N/A  </Return>
//  <Purpose> This function return image folder path </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> FEB/19/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (NSString*)getTempFolderPath {
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *documentsPath = [paths safeObjectAtIndex:0];
//    NSString *folderPath = [documentsPath stringByAppendingPathComponent:@"MEDx_Temp"];
//    // Check if the directory already exists
//    if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
//        // Directory does not exist so create it
//        [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    return folderPath;
//}
//
///***********************************************************************************************************
//  <Name> saveImageToThumbnailImageFolder </Name>
//  <Input Type> N/A </Input Type>
//  <Return> N/A  </Return>
//  <Purpose> This function check whethe image with specified name exit or not in the image folder </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (void)saveImageToThumbnailImageFolder:(NSData*)imageData withName:(NSString*)imageName {
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        
//        NSString *thumbnailImgPath = [[MEUtility getThumbnailImageFolderPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", imageName]];
//        UIImage* thumbnailImage = [MEUtility resizeImage:[UIImage imageWithData:imageData]];
//        NSData* thumbnailImageData = UIImageJPEGRepresentation(thumbnailImage, 1.0f);
//        thumbnailImage = nil;
//        [thumbnailImageData writeToFile:thumbnailImgPath options:NSAtomicWrite error:nil];
//    });
//}
//
//+ (void)saveImageToImageFolder:(NSData*)imageData withName:(NSString*)imageName {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        NSString *mainImgPath = [[self getImageFolderPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", imageName]];
//        [imageData writeToFile:mainImgPath options:NSAtomicWrite error:nil];
//    });
//}
//
///***********************************************************************************************************
//  <Name>saveImageToTempFolder</Name>
//  <Input Type> N/A </Input Type>
//  <Return> N/A  </Return>
//  <Purpose> This function check whethe image with specified name exit or not in the image folder </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (void)saveImageToTempFolder:(NSData*)imageData withName:(NSString*)imageName {
//    
//    NSString *mainImgPath = [[MEUtility getTempFolderPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", imageName]];
//    
//    BOOL isWrite = [imageData writeToFile:mainImgPath options:NSAtomicWrite error:nil];
//    if (!isWrite) {
//        DEBUGLog(@"%@", @"image can not be written");
//    }
//}
//
///***********************************************************************************************************
//  <Name> getTempFolderFilePathWithName </Name>
//  <Input Type> N/A </Input Type>
//  <Return> Return image  </Return>
//  <Purpose> This method return image with image name from the temp image folder </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (NSString*)getTempFolderFilePathWithName:(NSString*)imageName {
//    NSString* filePath = [[MEUtility getTempFolderPath] stringByAppendingPathComponent:imageName];
//    return filePath;
//}
//
//
///***********************************************************************************************************
//  <Name> deleteItemFromTempFolderWithName </Name>
//  <Input Type> N/A </Input Type>
//  <Return> N/A </Return>
//  <Purpose> This method delete item with its name from temp folder </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JUNE/05/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (void)deleteItemFromTempFolderWithName:(NSString*)imageName {
//    NSString* filePath = [[MEUtility getTempFolderPath] stringByAppendingPathComponent:imageName];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
//        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
//    }
//}
//
///***********************************************************************************************************
//  <Name> deleteTempFolder </Name>
//  <Input Type> N/A </Input Type>
//  <Return> N/A </Return>
//  <Purpose> This method delete temp folder from cache </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JUNE/05/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (void) deleteTempFolder {
//    NSString* filePath = [MEUtility getTempFolderPath];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
//        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
//    }
//}
//
//+ (NSString *) imagePACSSaveNameFromURL:(NSString *) url {
//    NSArray *arr = [url componentsSeparatedByString:@"/"];
//    NSString *Last = [arr safeObjectAtIndex:arr.count-1];
//    //    NSString *SecondLast = [arr safeObjectAtIndex:arr.count-2];
//    //    NSString *comp = [NSString stringWithFormat:@"%@_%@",SecondLast,Last];
//    return Last;
//}
///***********************************************************************************************************
//  <Name> getPACSFolderPath </Name>
//  <Input Type> N/A </Input Type>
//  <Return> Returns Image Folder Path  </Return>
//  <Purpose> This method return image folder path </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> MAY/26/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//NSString * getPACSFolderPath (){
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *documentsPath = [paths safeObjectAtIndex:0];
//    NSString *folderPath =  [documentsPath stringByAppendingPathComponent:@"pPACS"] ;
//    // Check if the directory already exists
//    if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
//        // Directory does not exist so create it
//        [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    return folderPath;
//}
//
///***********************************************************************************************************
//  <Name> getPACSStudyIDFolderPath </Name>
//  <Input Type> N/A </Input Type>
//  <Return> Returns Image Folder Path  </Return>
//  <Purpose> This method return image folder path </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> MAY/26/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//NSString * getPACSStudyIDFolderPath(NSString *studyID ) {
//    if (studyID) {
//        NSString *strPACSFolderPath = getPACSFolderPath();
//        NSString *folderPath = [strPACSFolderPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",(studyID)]];
//        // Check if the directory already exists
//        if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
//            // Directory does not exist so create it
//            [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
//        }
//        return folderPath;
//    }
//    return nil;
//}
//
///***********************************************************************************************************
//  <Name> getPACSSeriesIDFolderPath </Name>
//  <Input Type> N/A </Input Type>
//  <Return> Returns Image Folder Path  </Return>
//  <Purpose> This method return image folder path </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> MAY/26/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//NSString * getPACSSeriesIDFolderPath(NSString *studyID, NSString *seriesID, MEPresets type) {
//    if (studyID) {
//        NSString *strPACSStudyFolderPath = getPACSStudyIDFolderPath(studyID);
//        NSString*strPACS = @"";
//        if (seriesID) {
//            switch (type) {
//                case DEFAULT:
//                    strPACS = @"jpeg" ;
//                    break;
//                case BONE:
//                    strPACS = @"bone" ;
//                    break;
//                case BRAIN:
//                    strPACS = @"brain" ;
//                    break;
//                case LUNG:
//                    strPACS = @"lung" ;
//                    break;
//                case LIVER:
//                    strPACS = @"liver" ;
//                    break;
//                case TISSUE:
//                    strPACS = @"soft" ;
//                    break;
//                default:
//                    strPACS = @"jpeg" ;
//                    break;
//            }
//            NSString *folderPath = [strPACSStudyFolderPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@",(seriesID),strPACS]];
//            
//            // Check if the directory already exists
//            if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
//                // Directory does not exist so create it
//                [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
//            }
//            return folderPath;
//        }
//    }
//    return nil;
//}
//
//
//BOOL clearPACSCache() {
//    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error = nil;
//    NSString *sourceDirectory = getPACSFolderPath();
//    NSArray *contents = [fileManager contentsOfDirectoryAtPath:sourceDirectory error:&error];
//    for(NSString *sourceFileName in contents) {
//        NSDictionary* attrs = [fileManager attributesOfItemAtPath:[getPACSFolderPath() stringByAppendingPathComponent:sourceFileName] error:nil];
//        if (attrs != nil) {
//            NSDate *date = (NSDate*)[attrs safeObjectforKey: NSFileCreationDate];
//            NSTimeInterval timeInterval =[[NSDate date] timeIntervalSinceDate: date];
//            NSInteger timeDiff = (72 * 60 * 60);
//            //             NSInteger timeDiff = (1 * 60);
//            if((timeInterval) > timeDiff){
//                NSString *sourceFile = [sourceDirectory stringByAppendingPathComponent:sourceFileName];
//                NSString *recentPacspath = [getPACSFolderPath() stringByAppendingPathComponent:sourceFileName];
//                BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:recentPacspath];
//                if (fileExists) {
//                    if(![fileManager removeItemAtPath:recentPacspath error:&error]) {
//                    }
//                }
//                if(![fileManager moveItemAtPath:sourceFile toPath:recentPacspath error:&error]) {
//                    if (error) {
//                        if(![fileManager removeItemAtPath:sourceFile error:&error]) {
//                        }
//                    }
//                }
//            }
//        }
//        else {
//            DEBUGLog(@"Not found");
//        }
//        attrs = nil;
//    }
//    return YES;
//}
//
//BOOL clearPACSOnCancel(NSString *studyID) {
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error = nil;
//    NSString *sourceDirectory = getPACSStudyIDFolderPath(studyID);
//    if ([fileManager fileExistsAtPath:sourceDirectory]) {
//        BOOL isSuccess = [fileManager removeItemAtPath:sourceDirectory error:&error];
//        return isSuccess;
//    }
//    return NO;
//}
//
//BOOL clearDocumentDirectory (){
//    NSFileManager *fileMgr = [[NSFileManager alloc] init] ;
//    NSError *error = nil;
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    
//    NSString *documentsPath = [paths safeObjectAtIndex:0];
//    NSString *folderPath = [documentsPath stringByAppendingPathComponent:@"Inbox"];
//    if ([fileMgr fileExistsAtPath:folderPath]) {
//        BOOL isSuccess = [fileMgr removeItemAtPath:folderPath error:&error];
//        return isSuccess;
//    }
//    return NO;
//}
//
//BOOL clearAllDocsCache(){
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error = nil;
//    NSString *sourceDirectory = [MEUtility getDocumentFolderPath];
//    if ([fileManager fileExistsAtPath:sourceDirectory]) {
//        BOOL isSuccess = [fileManager removeItemAtPath:sourceDirectory error:&error];
//        return isSuccess;
//    }
//    
//    return NO;
//}
//
//BOOL clearAllVideosCache(){
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error = nil;
//    NSString *sourceDirectory = [MEUtility getVideoFolderPath];
//    if ([fileManager fileExistsAtPath:sourceDirectory]) {
//        BOOL isSuccess = [fileManager removeItemAtPath:sourceDirectory error:&error];
//        return isSuccess;
//    }
//    
//    return NO;
//}
//
//BOOL clearAllMEDXImageFolderCache(){
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error = nil;
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *documentsPath = [paths safeObjectAtIndex:0];
//    NSString *folderPath = [documentsPath stringByAppendingPathComponent:@"MEDx_Image"];
//    if ([fileManager fileExistsAtPath:folderPath]) {
//        BOOL isSuccess = [fileManager removeItemAtPath:folderPath error:&error];
//        return isSuccess;
//    }
//    
//    return NO;
//}
//
//BOOL clearAllMEDXTempCache() {
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error = nil;
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *documentsPath = [paths safeObjectAtIndex:0];
//    NSString *folderPath = [documentsPath stringByAppendingPathComponent:@"MEDx_Temp"];
//    if ([fileManager fileExistsAtPath:folderPath]) {
//        BOOL isSuccess = [fileManager removeItemAtPath:folderPath error:&error];
//        return isSuccess;
//    }
//    return NO;
//}
//
//BOOL clearAllThumbFolderCache() {
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error = nil;
//    NSString *sourceDirectory = [MEUtility getThumbnailImageFolderPath];
//    if ([fileManager fileExistsAtPath:sourceDirectory]) {
//        BOOL isSuccess = [fileManager removeItemAtPath:sourceDirectory error:&error];
//        return isSuccess;
//    }
//    
//    return NO;
//}
//
//
//+ (NSString*)getCompleteNameWithLastName:(NSString*)lastName firstName:(NSString*)firstName {
//    
//    NSString* patientName;
//    
//    if ([lastName length] > 0 && [firstName length] > 0) {
//        patientName = [NSString stringWithFormat:@"%@ %@",firstName,lastName];
//    }else if ([lastName length] > 0){
//        patientName = lastName;
//    }else if ([firstName length]>0){
//        patientName = firstName;
//    }else {
//        patientName = @"";
//    }
//    return patientName;
//}
//
//+(void) setBlackRedTheme {
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:APP_BLACK_COLOR,NSFontAttributeName:FONT_HELVETICANEUE(18.0f)}];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : APP_BLACK_COLOR ,NSFontAttributeName:FONT_HELVETICA_ULTRALIGHT(10.0f)}
//                                             forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : APP_RED_COLOR ,NSFontAttributeName:FONT_HELVETICA_ULTRALIGHT(10.0f)}
//                                             forState:UIControlStateSelected];
//}
//
//+(void) setYellowWhiteTheme {
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:APP_YELLOW_COLOUR,NSFontAttributeName:FONT_HELVETICANEUE(18.0f)}];
//    
//    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName :APP_WHITE_COLOR,NSFontAttributeName:FONT_HELVETICA_ULTRALIGHT(10.0f) }
//                                             forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : APP_YELLOW_COLOUR ,NSFontAttributeName:FONT_HELVETICA_ULTRALIGHT(10.0f)}
//                                             forState:UIControlStateSelected];
//}
//#pragma mark - Storyboard methods
///***********************************************************************************************************
//  <Name>instantiateViewControllerFromStoryboardWithIdentifier</Name>
//  <Input Type> identifier (NSString) </Input Type>
//  <Return> ViewController  </Return>
//  <Purpose> This function used return view controller with identifier from storyboard </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> JAN/15/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//+ (id)instantiateViewControllerFromStoryboardWithIdentifier:(NSString*)identifier {
//    return [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:identifier];
//}
//
//#pragma mark - Sound methods
//- (void)playSoundForSentMessage {
//    [[MEUtility sharedMEUtility] playSoundWithFileName:@"bamboo.caf" viberation:NO];
//}
//
//- (void)playSoundForRecieveMessage {
//   // /System/Library/Audio/UISounds/Modern/sms_alert_complete.caf
////    NSURL *directoryURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/New/Calypso.caf"];
//      NSURL *directoryURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/Modern/sms_alert_complete.caf"];
//    SystemSoundID soundID;
//    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)directoryURL,&soundID);
//    AudioServicesPlaySystemSound(soundID);
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    CFRelease((__bridge CFURLRef)(directoryURL));
//}
//
//- (void)playSoundForSentOrRecieveImportantMessage {
//    NSURL *directoryURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/New/Telegraph.caf"];
//    SystemSoundID soundID;
//    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)directoryURL,&soundID);
//    AudioServicesPlaySystemSound(soundID);
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    CFRelease((__bridge CFURLRef)(directoryURL));
//}
//
//- (void)playSoundForInvite {
//    [[MEUtility sharedMEUtility] playSoundWithFileName:@"chord.caf" viberation:YES];
//}
//
//- (void)playSoundForRemoteWipe {
//    NSURL *directoryURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds/Swish.caf"];
//    SystemSoundID soundID;
//    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)directoryURL,&soundID);
//    AudioServicesPlaySystemSound(soundID);
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    CFRelease((__bridge CFURLRef)(directoryURL));
//}
//
//- (void)playSoundForPasscodeButtonTapped {
//    AudioServicesPlaySystemSound(0x450);
//}
//
//- (void)viberateDevice {
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//}
//
///***********************************************************************************************************
//  <Name>playSoundWithFileName</Name>
//  <Input Type> fileName (NSString) </Input Type>
//  <Return> N/A  </Return>
//  <Purpose> This function used to play a sound with a file name </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> MAR/13/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//- (void)playSoundWithFileName:(NSString*)fileName viberation:(BOOL)viberation {
//    
//    NSArray* array = [fileName componentsSeparatedByString:@"."];
//    NSString* file_name = [array safeObjectAtIndex:0];
//    NSString* file_type = [array safeObjectAtIndex:1];
//    
//    NSString *soundPath = [[NSBundle mainBundle] pathForResource:file_name ofType:file_type];
//    SystemSoundID soundID;
//    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
//    AudioServicesPlaySystemSound (soundID);
//    
//    if (viberation) {
//        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    }
//}
//
//#pragma Internet Connection
//
+ (BOOL)isInternetConnected {
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    
    BOOL isNetworkAvailable =!(networkStatus == NotReachable);
    
    if(!isNetworkAvailable){
        [MEUtility showFailedPopUpWithMessage:@"SSL Internet Connection Unavailable"];
    }
    return isNetworkAvailable;
}
//
//+ (UILabel *)getNavigationLabelWithTitle :(NSString *) title{
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero] ;
//    label.backgroundColor = [UIColor clearColor];
//    label.font = FONT_HELVETICANEUE(18.0f);
//    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = APP_RED_COLOR;
//    label.text = title;
//    [label sizeToFit];
//    MESlideShadowAnimation *shadowAnimation = [MESlideShadowAnimation new];
//    shadowAnimation.animatedView = label;
//    shadowAnimation.shadowWidth = 25.;
//    [shadowAnimation start];
//    return label;
//}
//
//#pragma mark - ARRAY methods
///***********************************************************************************************************
//  <Name>reverseArray</Name>
//  <Input Type> array (NSArray) </Input Type>
//  <Return> return array in reverse order  </Return>
//  <Purpose> This function used reverse an array </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> FEB/07/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//
//+ (NSArray *)reverseArray:(NSArray*)array {
//    NSMutableArray *reverseArray = [NSMutableArray arrayWithCapacity:[array count]];
//    NSEnumerator *enumerator = [array reverseObjectEnumerator];
//    for (id element in enumerator) {
//        [reverseArray addObject:element];
//    }
//    return reverseArray;
//}
//
//NSString *intToString(NSInteger intValue) {
//    return  [NSString stringWithFormat:@"%ld",(long)intValue];
//}
//
//NSInteger stringToInt(NSString *stringValue) {
//    return [stringValue integerValue];
//}
//
//int GetPosition(char c)
//{
//    if (c >= 'a' && c <= 'z') {
//        return c - 'a';
//    }
//    else if (c >= 'A' && c <= 'Z') {
//        return c - 'A';
//    }
//    else  {
//        // Indicate that it isn't a letter.
//        return -1;
//    }
//}
//
//+ (NSString*)getActualImageUrl:(NSString*)url {
//    
//    if (url) {
//        return [NSString stringWithFormat:@"%@%@",[MEUtility getBaseUrlImageforservice],url];
//    }
//    return nil;
//}
//
//+ (NSString*)getThumbnailStudyImageUrl:(NSString*)url {
//    if (url) {
//        // return [[IMAGE_BASE_URL stringByAppendingPathComponent:url] stringByAppendingPathComponent:@"101thumb.jpeg"];
//        NSString *thumbnailImageUrl = [NSString stringWithFormat:@"%@%@101.jpeg_thumb.jpeg",[MEUtility getBaseUrlImageforservice],url];
//        
//        return thumbnailImageUrl;
//    }
//    return nil;
//}
//
//
//+ (NSString*)getThumbnailImageUrl:(NSString*)url {
//    if (url) {
//        NSString *thumbnailImageUrl = [NSString stringWithFormat:@"%@%@_thumb.jpeg",[MEUtility getBaseUrlImageforservice],url];
//        return thumbnailImageUrl;
//    }
//    return nil;
//}
//
//+ (NSInteger)getRandomNumber{
//    NSInteger randomValue = arc4random() % 50000;
//    return randomValue;
//}
//
//
//
//+ (void) getThumbnailImageFromVideoURLString:(NSString *) filePath isFileUrl:(BOOL) isFile Oncompletion:(OnSuccessImage)successBlock OnFailure:(OnFailureImage)failureBlock{
//    NSURL *videoURL = nil;
//    if (isFile) {
//        videoURL = [NSURL fileURLWithPath:filePath];
//    }else {
//        videoURL = [NSURL URLWithString:filePath];
//    }
//    
//    AVURLAsset *asset=[[AVURLAsset alloc] initWithURL:videoURL options:nil];
//    AVAssetImageGenerator *generator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
//    generator.appliesPreferredTrackTransform=TRUE;
//    
//    CMTime thumbTime = CMTimeMakeWithSeconds(1,1);
//    
//    AVAssetImageGeneratorCompletionHandler handler = ^(CMTime requestedTime, CGImageRef im, CMTime actualTime, AVAssetImageGeneratorResult result, NSError *error){
//        if (result != AVAssetImageGeneratorSucceeded) {
//            DEBUGLog(@"couldn't generate thumbnail, error:%@", error);
//            
//            failureBlock(error);
//        }
//        successBlock([[UIImage alloc] initWithCGImage:im]);
//    };
//    
//    CGSize maxSize = CGSizeMake(1024, 1024);
//    generator.maximumSize = maxSize;
//    [generator generateCGImagesAsynchronouslyForTimes:[NSArray arrayWithObject:[NSValue valueWithCMTime:thumbTime]] completionHandler:handler];
//}
//
//+ (UIImage *) getThumbnailImageFromVideoURLString:(NSString *) filePath isFileUrl:(BOOL) isFile {
//    NSURL *videoURL = nil;
//    if (isFile) {
//        videoURL = [NSURL fileURLWithPath:filePath];
//    }else {
//        videoURL = [NSURL URLWithString:filePath];
//    }
//    
//    
//    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
//    AVAssetImageGenerator *generate = [[AVAssetImageGenerator alloc] initWithAsset:asset];
//    generate.appliesPreferredTrackTransform = YES;
//    NSError *err = NULL;
//    CMTime time = CMTimeMake(1, 1);
//    CGImageRef imgRef = [generate copyCGImageAtTime:time actualTime:NULL error:&err];
//    UIImage *currentImg = [[UIImage alloc] initWithCGImage:imgRef];
//    return currentImg;
//}
//
//+ (NSInteger)getTypeWithPaperClipObject:(MEPaperClip*)paperClipObj {
//    
//    NSInteger type = 0;
//    switch (paperClipObj.contentType) {
//        case MEMedxPhoto: case MEiPhonePhoto:
//            type = 2;
//            break;
//        case MEMedxVideo: case MEiPhoneVideo:
//            type = 3;
//            break;
//        case MEMedxAudio:
//            type = 11;
//            break;
//        case MEMedxDocument:
//        {
//            switch (paperClipObj.documentExtensionType) {
//                case MEDocumentExtensionTypeDoc:
//                    type = 4;
//                    break;
//                case MEDocumentExtensionTypeXlsx:
//                    type = 5;
//                    break;
//                case MEDocumentExtensionTypePPt:
//                    type = 6;
//                    break;
//                case MEDocumentExtensionTypeTxt:
//                    type = 7;
//                    break;
//                case MEDocumentExtensionTypePdf:
//                    type = 8;
//                    break;
//                case MEDocumentExtensionTypeUnknown:
//                    type = 10;
//                    break;
//                default:
//                    type = 10;
//                    break;
//            }
//        }
//            break;
//        case MEMedxPACS :
//            type = 9;
//            break;
//        default:
//            break;
//    }
//    return type;
//}
//
//+ (UIImageView*)thumbnailImageViewWithFrame:(CGRect)frame {
//    UIImageView* imageView = [[UIImageView alloc] initWithFrame:frame];
//    imageView.clipsToBounds = YES;
//    imageView.contentMode =  UIViewContentModeScaleAspectFill;
//    return imageView;
//}
//
//+ (NSArray *) getContrastBrightnessValuesWithWidth:(CGFloat)width andLevel :(CGFloat)level {
//    //    float max = (level + (width / 2));
//    //    float min = (level - (width / 2));
//    //    NSNumber *contrast =[NSNumber numberWithFloat:(1 - (width / (max -  min))) ];
//    //    NSNumber *brightness =[NSNumber numberWithFloat:(1 - ((level - min)/ (max - min))) ];
//    NSNumber *contrast =[NSNumber numberWithFloat:1.0];
//    NSNumber *brightness =[NSNumber numberWithFloat:1.0];
//    NSArray * arr = [NSArray arrayWithObjects:contrast,brightness, nil];
//    return arr;
//}
//
//+ (CGRect) resetViewBounds :(NSString *) path withRect :(CGRect) rect {
//    UIImage * img = [UIImage imageWithContentsOfFile:path];
//    CGRect rectForView;
//    CGSize	dstSize = img.size; // no resize (we could directly return 'self' here, but we draw the image anyway to take image orientation into account)
//    //    if(dstSize.width < rect.size.width && dstSize.height < rect.size.height){
//    //        dstSize = CGSizeMake( rect.size.width , rect.size.height );
//    //    }else{
//    CGFloat wRatio = 0.0f;
//    CGFloat hRatio = 0.0f;
//    if (dstSize.width != 0.0f) {
//        wRatio = rect.size.width / dstSize.width;
//    }
//    if (dstSize.height != 0.0f) {
//        hRatio = rect.size.height / dstSize.height;
//        
//    }
//    if (wRatio < hRatio) {
//        dstSize = CGSizeMake( rect.size.width , floorf(dstSize.height * wRatio ));
//    } else {
//        dstSize = CGSizeMake( floorf(dstSize.width * hRatio) , rect.size.height );
//    }
//    rectForView = CGRectMake( (rect.size.width  - dstSize.width) / 2 , (rect.size.height  - dstSize.height) / 2 , dstSize.width , dstSize.height );
//    return  rectForView;
//}
//
//
//+ (NSDictionary *)calculateWindowLevelForBrightness :(float)brightness andContrast :(float)contrast withImageCenter :(float) c andImageWidth :(float) w andMinValue :(float) min andMaxValue :(float) max
//{
//    
//    /*
//     
//     minval = Min(image)
//     maxval = Max(image)
//     level = (1-brightness/100.)*(maxVal - minVal) + minVal
//     width = (1-contrast/100.)*(maxVal - minVal)
//     
//     */
//    
//    brightness = brightness * 100;
//    contrast =  contrast * 100;
//    float  minValue = (c - w ) / 2;
//    float maxValue =  (c + w) / 2;
//    //    float  minValue = min;
//    //    float maxValue =  max;
//    float diff =  (maxValue - minValue);
//    float level = (1 - brightness / 100) * (diff==0 ?1:diff) + minValue;
//    float width = (1 - contrast  / 100) * (diff==0 ?1:diff) ;
//    return  [NSDictionary dictionaryWithObjects:@[[NSString stringWithFormat:@"%.3f",width] ,  [NSString stringWithFormat:@"%.3f",level]] forKeys:@[@"width", @"level"]];
//}
//
//+ (NSArray *) getBrightnessContrastValuesForPacsStudyId :(NSString *) pacsStudyId {
//    float brightness = 0.0 ;
//    float contrast = 0.0;
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    NSString * strBri = [userDefault valueForKey:[NSString stringWithFormat:@"brightness_%@",pacsStudyId]];
//    if (strBri) {
//        brightness = [strBri floatValue];
//    }else {
//        brightness = 1.0;
//    }
//    
//    NSString * strContrast = [userDefault valueForKey:[NSString stringWithFormat:@"contrast_%@",pacsStudyId]];
//    if (strContrast) {
//        contrast = [strContrast floatValue];
//    }else {
//        contrast = 1.0;
//    }
//    return  [NSArray arrayWithObjects:[NSNumber numberWithFloat:brightness] , [NSNumber numberWithFloat:contrast], nil];
//}
//
//+ (void) setBrightnessContrastValuesForPacsStudyId :(NSString *) pacsStudyId withBrightness :(float) b withContrast : (float) c {
//    [USER_DEFAULT setFloat:b forKey:[NSString stringWithFormat:@"brightness_%@",pacsStudyId]];
//    [USER_DEFAULT setFloat:c forKey:[NSString stringWithFormat:@"contrast_%@",pacsStudyId]];
//}
//
//
////+(void) logout {
////    dispatch_async(dispatch_get_main_queue(), ^{
////        [APP_DELEGATE popAllViewControllersToRootviewController];
////        [USER_DEFAULT setBool:NO forKey:@"CameraBack"];
////
////    });
////    [[UIPasteboard generalPasteboard] setString:@""];
////    DEBUGLog(@"%@", APP_DELEGATE.window.rootViewController.childViewControllers);
////     DEBUGLog(@"%@", APP_DELEGATE.window.rootViewController);
////    clearAllMEDXData();
////    [[MEDataModal sharedSharedDataModel] clearLoggedInUserInfo];
////    [USER_DEFAULT removeObjectForKey:LAST_LOGGED_IN_PASSWORD];
////    [USER_DEFAULT removeObjectForKey:LAST_LOGGED_IN_ENCRYPT_PASSWORD];
////}
//
//+ (void) logout :(ControllerEntryMode ) entryMode shouldDeleteData :(BOOL)isDeleteData {
//    [USER_DEFAULT removeObjectForKey:kChatExpandCollapseState];
//    [USER_DEFAULT removeObjectForKey:kGroupExpandCollapseState];
//    UITabBarController* tabBarController = (UITabBarController*)APP_DELEGATE.window.rootViewController;
//    
//    UINavigationController *navContoller =  tabBarController.viewControllers[0];
//    [USER_DEFAULT setBool:YES forKey:kIsMessageFirstTimeLoad];
//    MELoginViewController* mELoginViewController = (MELoginViewController*)[MEUtility instantiateViewControllerFromStoryboardWithIdentifier:@"LOGIN"];
//    
//    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:mELoginViewController];
//    [navContoller presentViewController:navController animated:NO completion:nil];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        //        [APP_DELEGATE popAllViewControllersToRootviewController];
//        [USER_DEFAULT setBool:NO forKey:@"CameraBack"];
////        
//    });
//    [[UIPasteboard generalPasteboard] setString:@""];
//    
//    //    if (entryMode != FromSettingViewController) {
//    //        UITabBarController* tabBarController = (UITabBarController*)APP_DELEGATE.window.rootViewController;
//    //
//    
//    //
//    //        MELoginViewController* mELoginViewController = (MELoginViewController*)[MEUtility instantiateViewControllerFromStoryboardWithIdentifier:@"LOGIN"];
//    //        UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:mELoginViewController];
//    //        [navContoller presentViewController:navController animated:NO completion:nil];
//    //
//    //    }
//    
//    [MEUtility selectTabBarItem:0 popToRoot:YES];
//    if (isDeleteData) {
//        clearAllMEDXData();
//        clearDocumentDirectory();
//    }
//    [[MEDataModal sharedSharedDataModel] clearLoggedInUserInfo];
//    [USER_DEFAULT removeObjectForKey:LAST_LOGGED_IN_PASSWORD];
//    [USER_DEFAULT removeObjectForKey:LAST_LOGGED_IN_ENCRYPT_PASSWORD];
//}
//
//void clearAllMEDXData(){
//    clearAllMEDXImageFolderCache();
//    clearAllDocsCache();
//    clearAllVideosCache();
//}
//
//+ (void)animateView:(UIView *)viewToAnimate translationYPoint:(CGFloat)translationYPoint{
//    if (!viewToAnimate.hidden) {
//        
//        [UIView animateWithDuration:0.6
//                              delay:0
//                            options:(UIViewAnimationCurveEaseInOut|
//                                     UIViewAnimationCurveEaseOut)
//                         animations:^(void) {
//                             viewToAnimate.transform = (viewToAnimate.hidden)?CGAffineTransformMakeTranslation(0, translationYPoint): CGAffineTransformMakeTranslation(0, 0);
//                         }
//                         completion:^(BOOL finished) {
//                             viewToAnimate.hidden = !viewToAnimate.hidden ;
//                         }];
//    } else {
//        viewToAnimate.hidden = NO;
//        
//        [UIView animateWithDuration:0.6
//                              delay:0
//                            options:(UIViewAnimationCurveEaseInOut|
//                                     UIViewAnimationCurveEaseOut)
//                         animations:^(void) {
//                             viewToAnimate.transform = CGAffineTransformMakeTranslation(0, translationYPoint);
//                         }
//                         completion:^(BOOL finished) {
//                             viewToAnimate.hidden = NO;
//                         }];
//    }
//}
//
//
//+ (UIBarButtonItem *)getBackBarButtonItem:(UIViewController *)viewControllerObj {
//    UIImageView *imageviewBackArrow = [MEUtility getBackwardArrowAnimatedImageView];
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:viewControllerObj.navigationController action:@selector(popViewControllerAnimated:)];
//    [imageviewBackArrow addGestureRecognizer:tapGesture];
//    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:imageviewBackArrow];
//    return barButtonItem;
//}
//
//+ (void)createBackButtonWithImageView:(UIImageView *)backImageView {
//    NSArray *imageNames = @[@"backward-arrow1", @"backward-arrow2", @"backward-arrow3"];
//    
//    NSMutableArray *images = [[NSMutableArray alloc] init];
//    for (int i = 0; i < imageNames.count; i++) {
//        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
//    }
//    backImageView.animationImages = images;
//    backImageView.animationDuration = 0.9;
//    backImageView.contentMode = UIViewContentModeLeft;
//    backImageView.userInteractionEnabled = YES;
//    //    backImageView.frame = CGRectMake(5, 2, 30, 59);
//    [backImageView startAnimating];
//}
//
//+ (UIImageView *) getBackwardArrowAnimatedImageView{
//    // Load images
//    NSArray *imageNames = @[@"backward-arrow1", @"backward-arrow2", @"backward-arrow3"];
//    
//    NSMutableArray *images = [[NSMutableArray alloc] init];
//    for (int i = 0; i < imageNames.count; i++) {
//        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
//    }
//    
//    // Normal Animation
//    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
//    animationImageView.animationImages = images;
//    animationImageView.animationDuration = 0.9;
//    animationImageView.contentMode = UIViewContentModeLeft;
//    animationImageView.userInteractionEnabled = YES;
//    [animationImageView startAnimating];
//    return animationImageView;
//}
//+ (NSString *)getBaseUrlforservice{
//    NSString *baseUrl=[NSString new];
//    if(IS_MANUAL_SERVER==true){
//        baseUrl=BASE_URL_Manual;
//        
//    }else if(IS_CHANDAN_SERVER==true){
//         baseUrl=BASE_URL;
//    }
//    else{
//       baseUrl=BASE_URL;
//        
//    }
//    return baseUrl;
//}
//
//+ (NSString *)getBaseUrlImageforservice{
//    NSString *baseUrlImage=[NSString new];
//    if(IS_MANUAL_SERVER==true){
//        baseUrlImage=IMAGE_BASE_URL_Manual;
//        
//    }else{
//        baseUrlImage=IMAGE_BASE_URL;
//        
//    }
//    return baseUrlImage;
//}
//
//
//+ (UIImageView *) getForwardArrowAnimatedImageViewAtFrame :(CGRect )frame {
//    // Load images
//    NSArray *imageNames = @[@"forward-arrow1", @"forward-arrow2", @"forward-arrow3"];
//    
//    NSMutableArray *images = [[NSMutableArray alloc] init];
//    for (int i = 0; i < imageNames.count; i++) {
//        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
//    }
//    
//    // Normal Animation
//    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:frame];
//    animationImageView.animationImages = images;
//    animationImageView.animationDuration = 0.9;
//    animationImageView.contentMode = UIViewContentModeLeft;
//    animationImageView.userInteractionEnabled = YES;
//    [animationImageView startAnimating];
//    return animationImageView;
//}
//@end
//
//
//@implementation  NSArray (SAFEOBJECT)
//
///***********************************************************************************************************
//  <Name>safeObjectforKey</Name>
//  <Input Type> key (NSArray) </Input Type>
//  <Return> value for a key  </Return>
//  <Purpose> This function defined as a category function to get object at index path if exit in the array otherwise return nil value </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> APR/09/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//- (id) safeObjectAtIndex:(NSInteger) index {
//    if (self.count > index) {
//        return [self objectAtIndex:index];
//    }
//    return nil;
//}
//
//@end
//@implementation  NSUserDefaults (SAFEOBJECTKEY)
//
///***********************************************************************************************************
//  <Name>safeObjectforKey</Name>
//  <Input Type> key (NSArray) </Input Type>
//  <Return> value for a key  </Return>
//  <Purpose> This function defined as a category function to get value for a key if key exits in the dictionary </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> APR/09/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//- (id) safeObjectforKey:(NSString *) key {
//    if ([self objectForKey:key] && ![[self objectForKey:key] isKindOfClass:[NSNull class]]) {
//        return [self objectForKey:key];
//    }
//    return nil;
//}
//
//@end
//
//@implementation  NSDictionary (SAFEOBJECTKEY)
//
///***********************************************************************************************************
//  <Name>safeObjectforKey</Name>
//  <Input Type> key (NSArray) </Input Type>
//  <Return> value for a key  </Return>
//  <Purpose> This function defined as a category function to get value for a key if key exits in the dictionary </Purpose>
//  <History>
//  <Header> Version 1.0 </Header>
//  <Date> APR/09/2014 </Date>
//  </History>
//  <DeveloperName> Chetu INC </DeveloperName>
//  ***********************************************************************************************************/
//- (id) safeObjectforKey:(NSString *) key {
//    if ([self objectForKey:key] && ![[self objectForKey:key] isKindOfClass:[NSNull class]]) {
//        return [self objectForKey:key];
//    }
//    return nil;
//}
//
//@end
//
//@implementation myCustomUltralightFontLabel : UILabel
//
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super initWithCoder: decoder])
//    {
//        [self setFont: FONT_HELVETICA_ULTRALIGHT( self.font.pointSize)];
//        
//    }
//    return self;
//}
//
//
//@end
//
//@implementation myCustomFontLabel : UILabel
//
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super initWithCoder: decoder])
//    {
//        [self setFont: FONT_HELVETICANEUE( self.font.pointSize)];
//        
//    }
//    return self;
//}
//
//@end
//
//@implementation myCustomFontLabelWithInsets : UILabel
//
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super initWithCoder: decoder])
//    {
//        [self setFont: FONT_HELVETICANEUE( self.font.pointSize)];
//        
//    }
//    return self;
//}
//
//- (void)drawTextInRect:(CGRect)rect {
//    UIEdgeInsets insets = {5, 5, 5, 5};
//    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
//}
//
//@end
//
//@implementation myCustomFontCaptionLabel : UILabel
//
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super initWithCoder: decoder])
//    {
//        [self setFont: FONT_HELVETICANEUE( self.font.pointSize)];
//        
//    }
//    return self;
//}
//
//- (void)drawTextInRect:(CGRect)rect {
//    UIEdgeInsets insets = {1, 1, 1, 4};
//    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
//}
//
//@end
//
//
//@implementation myCustomUltralightFontButton : UIButton
//
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super initWithCoder: decoder])
//    {
//        [self.titleLabel setFont:FONT_HELVETICA_ULTRALIGHT(self.titleLabel.font.pointSize)];
//    }
//    return self;
//}
//
//-(void) setHighlighted:(BOOL)highlighted{
//    [super setHighlighted:highlighted];
//    
//    
//    CGColorRef color = [self.backgroundColor CGColor];
//    
//    long numComponents = CGColorGetNumberOfComponents(color);
//    
//    if (numComponents == 4)
//    {
//        const CGFloat *components = CGColorGetComponents(color);
//        CGFloat red = components[0];
//        CGFloat green = components[1];
//        CGFloat blue = components[2];
//        CGFloat alpha = components[3];
//        if (self.backgroundColor && red != 0 && blue != 0 && green != 0  && alpha != 0) {
//            [self setColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f] forState:UIControlStateHighlighted];
//            [self setColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f] forState:UIControlStateSelected];
//        }
//    }
//}
//
//- (void)setColor:(UIColor *)color forState:(UIControlState)state
//{
//    UIView *colorView = [[UIView alloc] initWithFrame:self.frame];
//    [MEUtility addBorderInView:colorView withWidth:self.layer.borderWidth andCornerRadius:self.layer.cornerRadius andBorderColor:[UIColor colorWithCGColor:self.layer.borderColor ]];
//    colorView.backgroundColor = color;
//    
//    UIGraphicsBeginImageContext(colorView.bounds.size);
//    [colorView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    [self setBackgroundImage:colorImage forState:state];
//}
//@end
//
//
//
//@implementation myCustomFontButton : UIButton
//
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super initWithCoder: decoder])
//    {
//        [self.titleLabel setFont:FONT_HELVETICANEUE(self.titleLabel.font.pointSize)];
//    }
//    return self;
//}
//
//-(void) setHighlighted:(BOOL)highlighted{
//    [super setHighlighted:highlighted];
//    
//    
//    CGColorRef color = [self.backgroundColor CGColor];
//    
//    long numComponents = CGColorGetNumberOfComponents(color);
//    
//    if (numComponents == 4)
//    {
//        const CGFloat *components = CGColorGetComponents(color);
//        CGFloat red = components[0];
//        CGFloat green = components[1];
//        CGFloat blue = components[2];
//        CGFloat alpha = components[3];
//        if (self.backgroundColor && red != 0 && blue != 0 && green != 0  && alpha != 0) {
//            [self setColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f] forState:UIControlStateHighlighted];
//            [self setColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f] forState:UIControlStateSelected];
//        }
//    }
//}
//
//- (void)setColor:(UIColor *)color forState:(UIControlState)state
//{
//    UIView *colorView = [[UIView alloc] initWithFrame:self.frame];
//    [MEUtility addBorderInView:colorView withWidth:self.layer.borderWidth andCornerRadius:self.layer.cornerRadius andBorderColor:[UIColor colorWithCGColor:self.layer.borderColor ]];
//    colorView.backgroundColor = color;
//    
//    UIGraphicsBeginImageContext(colorView.bounds.size);
//    [colorView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    [self setBackgroundImage:colorImage forState:state];
//}
//
//@end
//
//
//@implementation myCustomFontTextView : UITextView
//
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super initWithCoder: decoder])
//    {
//        [self setFont:FONT_HELVETICANEUE(self.font.pointSize)];
//    }
//    return self;
//}
////- (void)drawTextInRect:(CGRect)rect {
////    UIEdgeInsets insets = {5, 5, 5, 5};
////    [super drawRect:UIEdgeInsetsInsetRect(rect, insets)];
////}
//
//@end
//
//@implementation myCustomFontTextField : UITextField
//
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super initWithCoder: decoder])
//    {
//        [self setFont:FONT_HELVETICANEUE(self.font.pointSize)];
//    }
//    return self;
//}
//- (CGRect)placeholderRectForBounds:(CGRect)bounds {
//    return [self rectForBounds:bounds];
//}
//
////here 40 - is your x offset
//- (CGRect)rectForBounds:(CGRect)bounds {
//    return CGRectInset(bounds, 5, -3);
//}
//
//- (void)drawPlaceholderInRect:(CGRect)rect {
//    UIColor *colour = [UIColor lightGrayColor];
//    if ([self.placeholder respondsToSelector:@selector(drawInRect:withAttributes:)])
//    { // iOS7 and later
//        NSDictionary *attributes = @{NSForegroundColorAttributeName: colour, NSFontAttributeName: FONT_HELVETICA_ULTRALIGHT(self.font.pointSize)};
//        CGRect boundingRect = [self.placeholder boundingRectWithSize:rect.size options:0 attributes:attributes context:nil];
//        [self.placeholder drawAtPoint:CGPointMake(0, (rect.size.height/2)-boundingRect.size.height/2) withAttributes:attributes]; }
//    else { // iOS 6
//        [colour setFill];
//        [self.placeholder drawInRect:rect withFont:FONT_HELVETICA_ULTRALIGHT(self.font.pointSize) lineBreakMode:NSLineBreakByTruncatingTail alignment:self.textAlignment];
//    }
//}
//
//@end
//
//
//@implementation UIImage (fixOrientation)
//
//- (UIImage *)fixOrientation {
//    
//    // No-op if the orientation is already correct
//    if (self.imageOrientation == UIImageOrientationUp) return self;
//    
//    // We need to calculate the proper transformation to make the image upright.
//    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
//    CGAffineTransform transform = CGAffineTransformIdentity;
//    
//    switch (self.imageOrientation) {
//        case UIImageOrientationDown:
//        case UIImageOrientationDownMirrored:
//            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
//            transform = CGAffineTransformRotate(transform, M_PI);
//            break;
//            
//        case UIImageOrientationLeft:
//        case UIImageOrientationLeftMirrored:
//            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
//            transform = CGAffineTransformRotate(transform, M_PI_2);
//            break;
//            
//        case UIImageOrientationRight:
//        case UIImageOrientationRightMirrored:
//            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
//            transform = CGAffineTransformRotate(transform, -M_PI_2);
//            break;
//        case UIImageOrientationUp:
//        case UIImageOrientationUpMirrored:
//            break;
//    }
//    
//    switch (self.imageOrientation) {
//        case UIImageOrientationUpMirrored:
//        case UIImageOrientationDownMirrored:
//            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
//            transform = CGAffineTransformScale(transform, -1, 1);
//            break;
//            
//        case UIImageOrientationLeftMirrored:
//        case UIImageOrientationRightMirrored:
//            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
//            transform = CGAffineTransformScale(transform, -1, 1);
//            break;
//        case UIImageOrientationUp:
//        case UIImageOrientationDown:
//        case UIImageOrientationLeft:
//        case UIImageOrientationRight:
//            break;
//    }
//    
//    // Now we draw the underlying CGImage into a new context, applying the transform
//    // calculated above.
//    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
//                                             CGImageGetBitsPerComponent(self.CGImage), 0,
//                                             CGImageGetColorSpace(self.CGImage),
//                                             CGImageGetBitmapInfo(self.CGImage));
//    CGContextConcatCTM(ctx, transform);
//    switch (self.imageOrientation) {
//        case UIImageOrientationLeft:
//        case UIImageOrientationLeftMirrored:
//        case UIImageOrientationRight:
//        case UIImageOrientationRightMirrored:
//            // Grr...
//            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
//            break;
//            
//        default:
//            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
//            break;
//    }
//    
//    // And now we just create a new UIImage from the drawing context
//    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
//    UIImage *img = [UIImage imageWithCGImage:cgimg];
//    CGContextRelease(ctx);
//    CGImageRelease(cgimg);
//    return img;
//}
//
//@end
//
//@implementation UITabBarController (RotationAll)
//- (NSUInteger)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskAll;
//}
//@end
//
//@implementation UINavigationController (RotationAll)
//- (NSUInteger)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskAll;
//}
//@end
//
//@implementation UIViewController (TintColor)
//- (void) setNavigationBarTintColor :(UIColor *) color {
//    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
//        [self.navigationController.navigationBar setTintColor:color];
//    }
//    else{
//        [self.navigationController.navigationBar setBarTintColor:color];
//    }
//}
//@end
//
//@implementation TWAppDelegateDemoStyleSheet
//
//#pragma mark - Alloc/Init
//
//+ (TWAppDelegateDemoStyleSheet *)styleSheet
//{
//    return [[TWAppDelegateDemoStyleSheet alloc] init];
//}
//
//#pragma mark - TWMessageBarStyleSheet
//
//- (UIColor *)backgroundColorForMessageType:(TWMessageBarMessageType)type
//{
//    UIColor *backgroundColor = nil;
//    switch (type)
//    {
//        case TWMessageBarMessageTypeError:
//            backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.75];
//            break;
//        case TWMessageBarMessageTypeSuccess:
//            backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.75];
//            break;
//        case TWMessageBarMessageTypeInfo:
//            backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75];
//            break;
//        default:
//            break;
//    }
//    return backgroundColor;
//}
//
//- (UIColor *)strokeColorForMessageType:(TWMessageBarMessageType)type
//{
//    UIColor *strokeColor = nil;
//    switch (type)
//    {
//        case TWMessageBarMessageTypeError:
//            strokeColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
//            break;
//        case TWMessageBarMessageTypeSuccess:
//            strokeColor = [UIColor grayColor];
//            break;
//        case TWMessageBarMessageTypeInfo:
//            strokeColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
//            break;
//        default:
//            break;
//    }
//    return strokeColor;
//}
//
//- (UIImage *)iconImageForMessageType:(TWMessageBarMessageType)type
//{
//    UIImage *iconImage = nil;
//    switch (type)
//    {
//        case TWMessageBarMessageTypeError:
//            iconImage = [UIImage imageNamed:kAppDelegateDemoStyleSheetImageIconError];
//            break;
//        case TWMessageBarMessageTypeSuccess:
//            iconImage = [UIImage imageNamed:kAppDelegateDemoStyleSheetImageIconSuccess];
//            break;
//        case TWMessageBarMessageTypeInfo:
//            iconImage = [UIImage imageNamed:kAppDelegateDemoStyleSheetImageIconInfo];
//            break;
//        default:
//            break;
//    }
//    return iconImage;
//}
//
//- (UIFont *)messageFontForMessageType:(TWMessageBarMessageType)type
//{
//    return FONT_HELVETICANEUE(16.0);
//}
//
//- (UIColor *)messageColorForMessageType:(TWMessageBarMessageType)type
//{
//    return APP_BLACK_COLOR;
//}
//
//@end
//
//const float squareLength = 80.0f;
//@implementation CameraFocusSquare
//
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setBackgroundColor:[UIColor clearColor]];
//        [self.layer setBorderWidth:1.0];
//        [self.layer setBorderColor:APP_YELLOW_COLOUR.CGColor];
//        
//        for (int i=0 ; i< 4; i++) {
//            CALayer *pulseLayer_ = [CALayer layer] ;
//            pulseLayer_.backgroundColor = [APP_YELLOW_COLOUR CGColor];
//            pulseLayer_.bounds = CGRectMake(0., 0., 1., 8.);
//            if (i==0) {
//                pulseLayer_.position = CGPointMake(40, 5);
//            }else if(i ==1){
//                pulseLayer_.bounds = CGRectMake(0., 0., 8., 1.);
//                pulseLayer_.position = CGPointMake(75, 40);
//            }else if(i ==2){
//                pulseLayer_.bounds = CGRectMake(0., 0., 8, 1.);
//                pulseLayer_.position = CGPointMake(5, 40);
//            }else if(i ==3){
//                pulseLayer_.position = CGPointMake(40, 75);
//            }
//            [pulseLayer_ setBorderWidth:1.0];
//            [pulseLayer_ setBorderColor:APP_YELLOW_COLOUR.CGColor];
//            [self.layer addSublayer:pulseLayer_];
//        }
//        
//        CABasicAnimation* selectionAnimation = [CABasicAnimation
//                                                animationWithKeyPath:@"borderColor"];
//        selectionAnimation.toValue = (id)[UIColor orangeColor].CGColor;
//        selectionAnimation.repeatCount = 2;
//        [self.layer addAnimation:selectionAnimation
//                          forKey:@"selectionAnimation"];
//    }
//    return self;
//}
//@end
//
//@implementation UILabel (Extensions)
//
//- (NSArray*) lines
//{
//    if ( self.lineBreakMode != NSLineBreakByWordWrapping )
//    {
//        return nil;
//    }
//    
//    NSMutableArray* lines = [NSMutableArray arrayWithCapacity:10];
//    
//    NSCharacterSet* wordSeparators = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//    
//    NSString* currentLine = self.text;
//    NSInteger textLength = [self.text length];
//    
//    NSRange rCurrentLine = NSMakeRange(0, textLength);
//    NSRange rWhitespace = NSMakeRange(0,0);
//    NSRange rRemainingText = NSMakeRange(0, textLength);
//    BOOL done = NO;
//    while ( !done )
//    {
//        // determine the next whitespace word separator position
//        rWhitespace.location = rWhitespace.location + rWhitespace.length;
//        rWhitespace.length = textLength - rWhitespace.location;
//        rWhitespace = [self.text rangeOfCharacterFromSet: wordSeparators options: NSCaseInsensitiveSearch range: rWhitespace];
//        if ( rWhitespace.location == NSNotFound )
//        {
//            rWhitespace.location = textLength;
//            done = YES;
//        }
//        
//        NSRange rTest = NSMakeRange(rRemainingText.location, rWhitespace.location-rRemainingText.location);
//        
//        NSString* textTest = [self.text substringWithRange: rTest];
//        
//        CGSize sizeTest = [MEUtility sizeOfString:textTest withFont:self.font];
//        if ( sizeTest.width > self.bounds.size.width )
//        {
//            [lines addObject: [currentLine stringByTrimmingCharactersInSet:wordSeparators]];
//            rRemainingText.location = rCurrentLine.location + rCurrentLine.length;
//            rRemainingText.length = textLength-rRemainingText.location;
//            continue;
//        }
//        
//        rCurrentLine = rTest;
//        currentLine = textTest;
//    }
//    
//    [lines addObject: [currentLine stringByTrimmingCharactersInSet:wordSeparators]];
//    
//    return lines;
//}
//
//@end
//
//
//@implementation UIImage (additions)
//-(UIImage*)makeRoundCornersWithRadius:(const CGFloat)RADIUS {
//    UIImage *image = self;
//    
//    // Begin a new image that will be the new image with the rounded corners
//    // (here with the size of an UIImageView)
//    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
//    
//    const CGRect RECT = CGRectMake(0, 0, image.size.width, image.size.height);
//    // Add a clip before drawing anything, in the shape of an rounded rect
//    [[UIBezierPath bezierPathWithRoundedRect:RECT cornerRadius:image.size.width/2] addClip];
//    // Draw your image
//    [image drawInRect:RECT];
//    
//    // Get the image, here setting the UIImageView image
//    //imageView.image
//    UIImage* imageNew = UIGraphicsGetImageFromCurrentImageContext();
//    
//    // Lets forget about that we were drawing
//    UIGraphicsEndImageContext();
//    
//    return imageNew;
//}
//@end
//
//@implementation UILabel (FontAppearance)
//
//-(void)setAppearanceFont:(UIFont *)font {
//    if (font)
//        [self setFont:font];
//}
//
//-(UIFont *)appearanceFont {
//    return self.font;
//}
//
//@end
//
//@implementation myTableViewCell : UITableViewCell
//
//
//- (void)layoutSubviews {
//    [super layoutSubviews];  //The default implementation of the layoutSubviews
//    
//    CGRect textLabelFrame = self.textLabel.frame;
//    textLabelFrame.origin.y = 2;
//    self.textLabel.frame = textLabelFrame;
//}
@end