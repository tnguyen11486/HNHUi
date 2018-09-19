//
//  HNHRoundedSecureTextFieldCell.m
//
//  Created by Michael Starke on 07.06.13.
//  Copyright (c) 2013 HicknHack Software GmbH. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "HNHUISecureTextFieldCell.h"
#import "HNHUITextFieldCellHelper.h"
#import "HNHUISecureTextField.h"
#import "HNHUISecureTextView.h"

#import <AppKit/AppKit.h>

#define BUTTON_WIDTH 25

@interface HNHUISecureTextFieldCell () {
  //NSButtonCell *_buttonCell;
}

@property (strong) HNHUISecureTextView *fieldEditor;
/* ButtonCell used for Rendering and handling actions */
//@property (nonatomic, strong) NSButtonCell *buttonCell;

//- (NSRect)_buttonCellForFrame:(NSRect)cellFrame;
//- (NSRect)_textCellForFrame:(NSRect)cellFrame;
//- (NSButtonCell *)_allocButtonCell;

@end

@implementation HNHUISecureTextFieldCell

- (instancetype)init {
  self = [super init];
  if(self) {
    _drawHighlight = NO;
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if(self) {
    _drawHighlight = NO;
  }
  return self;
}

//- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
//  [HNHUIRoundedTextFieldCellHelper drawWithFrame:cellFrame enabled:self.enabled withHighlight:_drawHighlight];
//  [self drawInteriorWithFrame:cellFrame inView:controlView];
//}



- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
  [super drawInteriorWithFrame:cellFrame inView:controlView];
  if([controlView isKindOfClass:HNHUISecureTextField.class]) {
    HNHUISecureTextField *textField = (HNHUISecureTextField *)controlView;
    if(![textField currentEditor] && textField.isMouseOver) {
      [HNHUITextFieldCellHelper drawCopyButtonWithFrame:cellFrame mouseDown:textField.isMouseDown controlView:controlView];
    }
  }
}

/* Set the focusRing to the bezel shape */
/*
- (void)drawFocusRingMaskWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
  [[HNHUITextFieldCellHelper bezelpathForRect:cellFrame withHightlight:_drawHighlight] fill];
}
*/

/* We need to pass NO otherwise the roundend corners get rendering artifacts */
/*
 - (BOOL)drawsBackground {
  return NO;
}
*/


- (NSTextView *)fieldEditorForView:(NSView *)controlView {
  if(nil == self.fieldEditor) {
    self.fieldEditor = [[HNHUISecureTextView alloc] init];
    self.fieldEditor.fieldEditor = YES;
  }
  return self.fieldEditor;
}


@end
