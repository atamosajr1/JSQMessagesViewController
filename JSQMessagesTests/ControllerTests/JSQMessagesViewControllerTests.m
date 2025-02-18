//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  MIT License
//  Copyright (c) 2014 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import <XCTest/XCTest.h>

#import "JSQMessagesViewController.h"
#import "DemoMessagesViewController.h"


@interface JSQMessagesViewController ()

- (void)jsq_configureMessagesViewController;

@end




@interface JSQMessagesViewControllerTests : XCTestCase
@end



@implementation JSQMessagesViewControllerTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testJSQMessagesViewControllerInit
{
    JSQMessagesViewController *vc = [JSQMessagesViewController messagesViewController];

    [vc beginAppearanceTransition:YES animated:NO];
    [vc endAppearanceTransition];

    XCTAssertNotNil(vc, @"View controller should not be nil");
    XCTAssertNotNil(vc.view, @"View should not be nil");
    XCTAssertNotNil(vc.collectionView, @"Collection view should not be nil");
    XCTAssertNotNil(vc.inputToolbar, @"Input toolbar should not be nil");
    
    XCTAssertEqual(vc.automaticallyAdjustsScrollViewInsets, YES, @"Property should be equal to default value");

    XCTAssertEqualObjects(vc.incomingCellIdentifier, [JSQMessagesCollectionViewCellIncoming cellReuseIdentifier], @"Property should be equal to default value");
    XCTAssertEqualObjects(vc.outgoingCellIdentifier, [JSQMessagesCollectionViewCellOutgoing cellReuseIdentifier], @"Property should be equal to default value");

    XCTAssertEqual(vc.showTypingIndicator, NO, @"Property should be equal to default value");
    XCTAssertEqual(vc.showLoadEarlierMessagesHeader, NO, @"Property should be equal to default value");
}

- (void)testJSQMessagesViewControllerSubclassInitProgramatically
{
    DemoMessagesViewController *demoVC = [DemoMessagesViewController messagesViewController];

    [demoVC beginAppearanceTransition:YES animated:NO];
    [demoVC endAppearanceTransition];

    XCTAssertNotNil(demoVC, @"View controller should not be nil");
    XCTAssertTrue([demoVC isKindOfClass:[DemoMessagesViewController class]], @"View controller should be kind of class: %@", [DemoMessagesViewController class]);
    XCTAssertNotNil(demoVC.view, @"View should not be nil");
    XCTAssertNotNil(demoVC.collectionView, @"Collection view should not be nil");
    XCTAssertNotNil(demoVC.inputToolbar, @"Input toolbar should not be nil");
}

- (void)testJSQMessagesViewControllerSubclassInitStoryboards
{
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    XCTAssertNotNil(mainSB, @"Storyboard should not be nil");
    
    DemoMessagesViewController *demoVC = [mainSB instantiateViewControllerWithIdentifier:@"DemoVC"];

    [demoVC beginAppearanceTransition:YES animated:NO];
    [demoVC endAppearanceTransition];

    XCTAssertNotNil(demoVC, @"View controller should not be nil");
    XCTAssertTrue([demoVC isKindOfClass:[DemoMessagesViewController class]], @"View controller should be kind of class: %@", [DemoMessagesViewController class]);
    XCTAssertNotNil(demoVC.view, @"View should not be nil");
    XCTAssertNotNil(demoVC.collectionView, @"Collection view should not be nil");
    XCTAssertNotNil(demoVC.inputToolbar, @"Input toolbar should not be nil");
}

@end
