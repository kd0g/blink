//
//  MCPSessionParameters.m
//  Blink
//
//  Created by Yury Korolev on 1/2/18.
//  Copyright © 2018 Carlos Cabañero Projects SL. All rights reserved.
//

#import "MCPSessionParameters.h"
#import "MoshSessionParameters.h"
#import "SessionParameters.h"

NSString * const ChildSessionTypeKey = @"childSessionType";
NSString * const ChildSessionParametersKey = @"childSessionParameters";
NSString * const RowsKey = @"rows";
NSString * const ColsKey = @"cols";
NSString * const FontSizeKey = @"fontSize";
NSString * const FontNameKey = @"fontName";
NSString * const ThemeNameKey = @"themeName";

@implementation MCPSessionParameters

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  
  if (self) {
    NSSet *classes = [NSSet setWithObjects:[MoshParameters class], [SessionParameters class], nil];
    self.childSessionType = [aDecoder decodeObjectOfClass:[NSString class] forKey:ChildSessionTypeKey];
    self.childSessionParameters = [aDecoder decodeObjectOfClasses:classes forKey:ChildSessionParametersKey];
    self.rows = [aDecoder decodeIntegerForKey:RowsKey];
    self.cols = [aDecoder decodeIntegerForKey:ColsKey];
    self.fontSize = [aDecoder decodeIntegerForKey:FontSizeKey];
    self.fontName = [aDecoder decodeObjectOfClass:[NSString class] forKey:FontNameKey];
    self.themeName = [aDecoder decodeObjectOfClass:[NSString class] forKey:ThemeNameKey];
  }
  
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [super encodeWithCoder:coder];
  [coder encodeObject:_childSessionType forKey:ChildSessionTypeKey];
  [coder encodeObject:_childSessionParameters forKey:ChildSessionParametersKey];
  [coder encodeInteger:_rows forKey:RowsKey];
  [coder encodeInteger:_cols forKey:ColsKey];
  [coder encodeInteger:_fontSize forKey:FontSizeKey];
  [coder encodeObject:_fontName forKey:FontNameKey];
  [coder encodeObject:_themeName forKey:ThemeNameKey];
}

+ (BOOL)supportsSecureCoding
{
  return YES;
}

@end

