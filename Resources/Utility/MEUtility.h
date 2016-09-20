//
//  MEUtility.h
//  MEDx
//
//  Created by Chetu on 15/01/14.
//  Copyright (c) 2014 Chetu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>


@class MEBubbleData;
@class MEGroupBubbleData;
@class MEMedia;
@class MELiberary;
@class MEPaperClip;
@class CAAlertView;

typedef void (^OnSuccessImage) (UIImage *image);
typedef void (^OnFailureImage) (NSError *error);

typedef enum MEPacsScreen
{
    MERecentPacs = 1,
    MEQueryPacs = 2
} MEPacsScreen;

typedef enum : NSUInteger {
    MEShareMedia,
    MEShareDocument,
    MESharePACS
} MEShareContentType;

typedef enum : NSUInteger {
    MEMedxPhoto,
    MEMedxAudio,
    MEMedxVideo,
    MEMedxDocument,
    MEMedxPACS,
    MEiPhonePhoto,
    MEiPhoneVideo
} MEPaperClipContentType;

typedef enum {
    FromChatController ,
    FromChatCameraController,
    FromChatPaperClipController,
    FromGroupChatController,
    FromGroupCameraController,
    FromGroupCameraSend,
    FromGroupPaperClipController,
    FromMyCloudController,
    FromMyCloudpaperClipController,
    FromCameraController,
    FromStudyListController,
    FromRecentPACSController,
    FromLoginController,
    FromDocumentViewerController,
    FromDICOMViewerController,
    FromUpdateProfileMEDXPhotoController,
    FromUpdateProfileiPhonePhotoController,
    FromTermPolicyViewController,
    FromSettingViewController,
    FromCreatePasscodeViewController,
    FromMessageViewController,
    FromMessageListViewController,
    FromPasscodeViewController,
    FromEHRViewController
}ControllerEntryMode;

typedef enum _MEBubbleContentType
{
    MEBubbleContentTypeText = 1,
    MEBubbleContentTypeImage,
    MEBubbleContentTypeVideo,
    MEBubbleContentTypeEmail,
    MEBubbleContentTypeDocument,
    MEBubbleContentTypePACS
} MEBubbleContentType;

typedef enum _MEDocumentExtensionType{
    MEDocumentExtensionTypeDoc = 0,
    MEDocumentExtensionTypeXlsx,
    MEDocumentExtensionTypeTxt,
    MEDocumentExtensionTypePPt,
    MEDocumentExtensionTypePdf,
    MEDocumentExtensionTypeUnknown
}MEDocumentExtensionType;

typedef enum _MEPACSStatusOfDownload{
    MEPACSNotDownloaded = 0,
    MEPACSDownloaded,
    MEPACSTapToView,
    MEPACSPleaseWait,
    MEPACSDownloading
}MEPACSStatusOfDownload;

typedef enum {
    MEPopOverWindowLevel,
    MEPopOverSeries,
    MEPopOverDestinationExport
}MEPopOver;

typedef enum _MEPresets{
    DEFAULT= 0,
    BONE= 1,
    BRAIN = 2,
    LIVER = 3,
    LUNG = 4,
    TISSUE = 5
} MEPresets;

typedef enum _MEPACSType{
    MEPACSTypeCTScan = 0,
    MEPACSTypeMRI,
    MEPACSTypeXRay,
    MEPACSTypeUSG,
    MEPACSTypeNuclear
}MEPACSType;

typedef enum _MEMediaImageType{
    MEMediaImageTypeThumbnail = 0,
    MEMediaImageTypeMain
}MEMediaImageType;

typedef enum _MEMediaType{
    MEMediaTypeImage = 0,
    MEMediaTypeAudio,
    MEMediaTypeVideo
}MEMediaType;


typedef enum : NSUInteger {
    MELowQuality,
    MEMediumQuality,
    ME640x480Quality,
    MEHighQuality
} MEVideoQualityType;

typedef enum _MEExpandCollapseState
{
    MEFullExpandState = 0,
    MEHalfExpandState = 1,
    MECollapseState = 2
} MEExpandCollapseState;

@interface MEUtility : NSObject

//*******************************************
// SHARED INSTANCE
//*******************************************
+ (MEUtility*)sharedMEUtility;
+ (void)getPendingFriendRequest ;
+ (UIImage*)getIconImageForDocumentWithExtension :(MEDocumentExtensionType) ext ;
+ (UIImage*)getImageForFileType:(NSInteger)fileType;
+ (UIImage *)captureView;
+ (CGRect)screenSize;
//+ (void)printPDFFromFilepath:(NSString *)filePath :(UIButton *)button;
//*******************************************
// ALERT METHODS
//*******************************************
+ (void)showFailedPopUpWithMessage :(NSString *) failedMessage;
+ (void)showSuccessPopUpWithMessage:(NSString *)message callback:(void (^)())callback;
+ (void)showChatMessagePopUp :(NSString *) friendName andMessage:(NSString *) message andImage :(UIImage *) image;
+(NSString *)messageForChatIncomingNotifierForType :(NSInteger) type isGroup:(BOOL) isGroup;
//*******************************************
// LOADER METHODS
//*******************************************
//+ (void)addBorderInView:(UIView *) view withWidth :(float) width andCornerRadius :(float) cornerRadius andBorderColor :(UIColor *) color;
//*******************************************
// DATE METHODS
//*******************************************
+ (double)milliSecondsFromDate:(NSDate*)date;
+ (NSDate*)dateFromMilliSeconds:(double)milliSeconds;
+ (NSDate*)dateFromString:(NSString*)dateString;
+ (NSDate*)dateFromStringFormat2:(NSString*)dateString;
+ (NSString *) stringFromDate:(NSDate *) dateStr;
+ (NSString *) datetimeLastOnline : (NSDate *) dateStr ;
+ (NSString *) stringFromDateinYY:(NSDate *) dateStr;
+ (NSString *) stringFromDateinYYYY:(NSDate *) dateStr;
+ (NSString*)getFormattedDateForSectionTitle:(NSString*)dateString;
+ (NSString *)dateWiseKeyString:(NSDate *) dateStr;
+ (NSString*)getFormattedDateStringWithDate:(NSDate*)date name:(NSString*)name;
+ (NSString*)getFormattedDate:(NSString*)dateString;
+(NSString*)getWebserviceRequiredDateString:(NSString*)dateString;
+(NSString*)formattedDateString:(NSDate*)date;
+ (NSString*)getFormattedTime:(NSString*)dateString;
+ (NSString*)getFormattedDateInYY:(NSString*)dateString;

NSString *formattedMessageTimeWithTimeInterval(NSTimeInterval messageTimeStamp);

//*******************************************
// ENCRYPTION METHODS
//*******************************************
+ (NSString *)encryptText:(NSString *)strText;
+ (NSString *)decryptText:(NSString *)strCipherText;
//*******************************************
// STRING METHODS
//*******************************************
+ (NSString *)getBaseUrlforservice;
+ (NSString *)getBaseUrlImageforservice;
+ (NSString*)trim:(NSString*)string;
+ (BOOL)hasSpaces:(NSString*)string;
+ (BOOL)isValidEmailAddress:(NSString *)emailAddress;
+ (BOOL)isValidIPAddress:(NSString *)ipAddress;
+ (BOOL)isValidPortNumber:(NSString *)portNumber;
+ (BOOL)isValidHIPPAAPassword:(NSString *)password;
+ (NSString *)stringFromImage:(UIImage *)image;
+ (NSString *)emojiString:(NSString *)string ;
+ (NSString*)emojiValue:(NSString*)string;
+ (NSString*)unicodeValue:(NSString*)emojiValue;
+ (NSString*)blankFromNull:(NSString*)string;
//*******************************************
// ENCRYPTION DECRYPTION METHODS
//*******************************************
+ (NSString*)enctrypt:(NSString*)string;
+ (NSString*)decrypt:(NSString*)encryptedString;

//*******************************************
// IMAGE METHODS
//*******************************************
+ (UIImage*)getDefaultImageIfImageIsNil:(UIImage*)image;
+ (UIImage*)getDefaultImageForProfileIfImageIsNil:(UIImage*)image;
+ (UIImage*)getDefaultImageForLargeProfileIfImageIsNil:(UIImage*)image;
+ (UIImage*)getDefaultImageForGroupProfileIfImageIsNil:(UIImage*)image  ;
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (UIImage *)imageFromString:(NSString *)imageString;
+ (UIImage*)resizeImage:(UIImage*)image;
+ (UIImage*)resizeImage:(UIImage*)image toSize:(CGSize)size;
+ (UIImage*)getDefaultImageForVideoFileIfImageIsNil:(UIImage*)image;
+ (UIImage*)getDefaultImageForImageFileIfImageIsNil:(UIImage*)image;
+ (UIImage*)getDefaultImageForAudioFileIfImageIsNil:(UIImage*)image;

//*******************************************
// BUTTON METHODS
//*******************************************
//+ (UIBarButtonItem*)getHandShakeBarButtonItemWithTarget:(id)target selector:(SEL)selector;
//+ (UIBarButtonItem*)getProfileBarButtonItemWithTarget:(id)target selector:(SEL)selector;
//+ (UIBarButtonItem*)getGroupBarButtonItemWithTarget:(id)target selector:(SEL)selector;
//+ (void)updateButton:(UIButton *)button withAnimated:(BOOL)animated toString:(NSString*)tostring completed:(void (^)(void))completed isloading:(BOOL)isLoading;
////*******************************************
//// TEXTFIELD METHODS
////*******************************************
//+ (UITextField*)paddingTextField:(UITextField*)textField;
//


//*******************************************
// TABBAR METHODS
//*******************************************
//+ (UITabBarController*)getTabBarController;
+ (void)selectTabBarItem:(NSInteger)index popToRoot :(BOOL) popToRoot;

//*******************************************
// IMAGE DOWNLOAD METHODS
//*******************************************
+ (void)convertVideoToQuailty:(MEVideoQualityType)videoQuality withInputURL:(NSURL*)inputURL
                    outputURL:(NSURL*)outputURL
                      handler:(void (^)(AVAssetExportSession*))handler;
+ (void)processImageDataWithBubbleObject:(MEBubbleData *)bubbleObj andBlock:(void (^)(NSData *imageData,MEBubbleData *bubbleObj))processImage;
+ (void)processImageDataWithGroupBubbleObject:(MEGroupBubbleData *)groupBubbleObj andBlock:(void (^)(NSData *imageData,MEGroupBubbleData *groupBubbleObj))processImage;
+ (void)processImageDataWithMediaObject:(MEMedia *)mediaObj andBlock:(void (^)(NSData *imageData, MEMedia *mediaObj))processImage;
+ (void)processImageDataWithFriendModal:(id)object andBlock:(void (^)(UIImage *image,  id friendObj))processImage;
+ (void)processImageDataWithPaperClipObj:(MEPaperClip *)paperClipObj andBlock:(void (^)(NSData *imageData, MEPaperClip *paperClipObj))processImage;


+ (void)processImageWithUrl:(NSString *)url andBlock:(void (^)(UIImage *image ,NSString *url))processImage ;
+ (void)processThumbnailImageWithUrl:(NSString *)url andBlock:(void (^)(UIImage *image))processImage;
+ (void)processThumbnailImageWithUrl:(NSString *)url withName :(NSString *) name andBlock:(void (^)(UIImage *image))processImage ;
//*******************************************
// FILE MANAGER METHODS
//*******************************************
+ (BOOL)isFileExistInVideoFolderWithUrl:(NSString*)url;
+ (BOOL)isFileExistInImageFolderWithUrl:(NSString*)url ;
+ (BOOL)isFileExistInDocumentsFolderWithName:(NSString*)url;
+ (UIImage*)getImageFromImageFolderWithUrl:(NSString*)url;
+ (void)deleteImageFromImageFolderWithUrl:(NSString*)url;

+ (BOOL)isFileExistInThumbnailImageFolderWithUrl:(NSString*)url ;
+ (UIImage*)getThumbnailImageFromThumbnailImageFolderWithUrl:(NSString*)url;
+ (void)deleteThumbnailImageFromThumbnailImageFolderWithUrl:(NSString*)url;

+ (BOOL)isFileExistInThumbnailImageFolderWithName:(NSString*)imageName ;
+ (UIImage*)getThumbnailImageFromThumbnailImageFolderWithName:(NSString*)imageName;

+ (void)saveImageToThumbnailImageFolder1:(UIImage*)image withUrl:(NSString*)url;
+ (void)saveImageToImageFolder1:(UIImage*)image withUrl:(NSString*)url ;

+ (void)saveImageToThumbnailImageFolder:(NSData*)imageData withName:(NSString*)imageName;
+ (void)saveImageToImageFolder:(NSData*)imageData withName:(NSString*)imageName;
+ (void)saveImageToThumbnailImageFolder1:(UIImage*)image withName:(NSString*)imageName;
+ (void) getThumbnailImageFromVideoURLString:(NSString *) filePath isFileUrl:(BOOL) isFile Oncompletion:(OnSuccessImage)successBlock OnFailure:(OnFailureImage)failureBlock;
+ (UIImage *) getThumbnailImageFromVideoURLString:(NSString *) filePath isFileUrl:(BOOL) isFile;

NSString * getImageFolderPath(void);

//PACS FOLEDR PATH FUNCTIONS
NSString * getPACSFolderPath ();
NSString * getPACSStudyIDFolderPath(NSString *studyID ) ;
NSString * getPACSSeriesIDFolderPath(NSString *studyID, NSString *seriesID , MEPresets type);
BOOL clearPACSCache ();
BOOL clearPACSOnCancel(NSString *studyID);
BOOL clearDocumentDirectory ();
BOOL clearAllDocsCache();
BOOL clearAllVideosCache();
BOOL clearAllMEDXImageFolderCache();
void clearAllMEDXData();
BOOL clearAllMEDXTempCache();
NSString *removeLastWord(NSString *str);

//+ (NSArray *)getLinesArrayOfStringInLabel:(UILabel *)label;
//+ (NSArray*)getSeparatedLinesFromLbl:(UILabel*)lbl;
//+ (NSString*)getCompleteNameWithLastName:(NSString*)lastName firstName:(NSString*)firstName;
//+ (CGFloat)widthOfString:(NSString *)string withFont:(UIFont *)font;
+ (NSString*)getTempFolderPath;
+ (NSString*)getImageFolderPath;
+ (NSString*)getThumbnailImageFolderPath ;
+ (NSString*)getVideoFolderPath ;
+ (NSString*)getDocumentFolderPath;
+ (void)saveImageToTempFolder:(NSData*)imageData withName:(NSString*)imageName;
+ (NSString*)getTempFolderFilePathWithName:(NSString*)imageName ;
+ (void)deleteItemFromTempFolderWithName:(NSString*)imageName;
+ (void) deleteTempFolder;
+ (NSString *) imagePACSSaveNameFromURL:(NSString *) url;
+(void) setBlackRedTheme;
+(void) setYellowWhiteTheme;
//*******************************************
// STORYBOARD METHODS
//*******************************************
+ (id)instantiateViewControllerFromStoryboardWithIdentifier:(NSString*)identifier;

//*******************************************
// PLAY SOUND METHODS
//*******************************************
- (void)playSoundForSentMessage;
- (void)playSoundForRecieveMessage;
- (void)playSoundForSentOrRecieveImportantMessage;
- (void)playSoundForInvite;
- (void)playSoundForRemoteWipe;
- (void)playSoundForPasscodeButtonTapped;
- (void)viberateDevice;
- (void)playSoundWithFileName:(NSString*)fileName viberation:(BOOL)viberation;

+ (BOOL)isInternetConnected;
//+ (UILabel *)getNavigationLabelWithTitle :(NSString *) title;
//*******************************************
// ARRAY METHODS
//*******************************************
+ (NSArray *)reverseArray:(NSArray*)array;

NSString *intToString(NSInteger intValue);
NSInteger stringToInt(NSString *stringValue);


+ (NSString*)getActualImageUrl:(NSString*)url;
+ (NSString*)getThumbnailImageUrl:(NSString*)url;
+ (NSString*)getThumbnailStudyImageUrl:(NSString*)url;

+ (NSInteger)getRandomNumber;
+ (NSInteger)getTypeWithPaperClipObject:(MEPaperClip*)paperClipObj;

//+ (UIImageView*)thumbnailImageViewWithFrame:(CGRect)frame;
+ (NSArray *) getContrastBrightnessValuesWithWidth:(CGFloat)width andLevel :(CGFloat)level ;
+ (CGRect) resetViewBounds :(NSString *) path withRect :(CGRect) rect;
+ (NSDictionary *)calculateWindowLevelForBrightness :(float)brightness andContrast :(float)contrast withImageCenter :(float) c andImageWidth :(float) w andMinValue :(float) min andMaxValue :(float) max;
+ (NSArray *) getBrightnessContrastValuesForPacsStudyId :(NSString *) pacsStudyId ;
+ (void) setBrightnessContrastValuesForPacsStudyId :(NSString *) pacsStudyId withBrightness :(float) b withContrast : (float) c ;
+ (void) logout :(ControllerEntryMode ) entryMode shouldDeleteData :(BOOL)isDeleteData;

//*******************************************
// Animation METHODS
//*******************************************
//+ (void)animateView:(UIView *)viewToAnimate translationYPoint:(CGFloat)translationYPoint;
//+ (UIImageView *) getBackwardArrowAnimatedImageView;
//+ (UIBarButtonItem *)getBackBarButtonItem:(UIViewController *)viewControllerObj;
//+ (UIImageView *) getForwardArrowAnimatedImageViewAtFrame :(CGRect )frame ;
//+ (void)createBackButtonWithImageView:(UIImageView *)backImageView;

@end


@interface NSArray (SAFEOBJECT)

- (id) safeObjectAtIndex:(NSInteger) index;

@end

@interface  NSUserDefaults (SAFEOBJECTKEY)

- (id) safeObjectforKey:(NSString *) key;

@end

@interface  NSDictionary (SAFEOBJECTKEY)

- (id) safeObjectforKey:(NSString *) key;

@end
//
//@interface myCustomUltralightFontLabel : UILabel
//@end
//
//@interface myCustomFontLabel : UILabel
//@end
//
//@interface myCustomFontLabelWithInsets : UILabel
//@end
//
//@interface myCustomFontCaptionLabel : UILabel
//@end
//
//@interface myCustomUltralightFontButton : UIButton
//@end
//
//@interface myCustomFontButton : UIButton
//@end
//
//@interface myCustomFontTextView : UITextView
//@end
//
//@interface myCustomFontTextField : UITextField
//@end
//
//@interface UIImage (fixOrientation)
//- (UIImage *)fixOrientation;
//@end
//
//@interface UINavigationController (RotationAll)
//- (NSUInteger)supportedInterfaceOrientations;
//@end

//@interface UITabBarController (RotationAll)
//- (NSUInteger)supportedInterfaceOrientations;
//@end
//
//@interface UIViewController (TintColor)
//- (void) setNavigationBarTintColor :(UIColor *) color;
//@end
//
//@interface TWAppDelegateDemoStyleSheet : NSObject <TWMessageBarStyleSheet>
//+ (TWAppDelegateDemoStyleSheet *)styleSheet;
//@end
//
//@interface CameraFocusSquare : UIView
//@end
//
//
//@interface UILabel (Extensions)
//
//- (NSArray*) lines;
//
//@end
//
//@interface UIImage (additions)
//
//-(UIImage*)makeRoundCornersWithRadius:(const CGFloat)RADIUS ;
//
//@end
//
//@interface UILabel (FontAppearance)
//@property (nonatomic, copy) UIFont * appearanceFont UI_APPEARANCE_SELECTOR;
//@end
//
//@interface myTableViewCell : UITableViewCell
//@end
