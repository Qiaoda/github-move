//
//  PTYTab+Scripting.m
//  iTerm2
//
//  Created by George Nachman on 8/26/14.
//
//

#import "PTYTab+Scripting.h"
#import "PseudoTerminal.h"

@implementation PTYTab (Scripting)

- (NSScriptObjectSpecifier *)objectSpecifier {
  NSScriptObjectSpecifier *containerRef;

  containerRef = [PseudoTerminal objectSpecifier];
  id classDescription = [NSClassDescription classDescriptionForClass:[PseudoTerminal class]];
  NSInteger index = [[self realParentWindow] indexOfTab:self];
  return [[[NSIndexSpecifier alloc]
           initWithContainerClassDescription:classDescription
           containerSpecifier:containerRef
           key:@"tabs"
           index:index] autorelease];
}

- (id)valueInSessionsAtIndex:(unsigned)anIndex {
  return [self sessions][anIndex];
}

- (id)valueForKey:(NSString *)key {
  if ([key isEqualToString:@"currentSession"]) {
    return [self activeSession];
  } else if ([key isEqualToString:@"isProcessing"]) {
    return @([self isProcessing]);
  } else if ([key isEqualToString:@"icon"]) {
    return [self icon];
  } else if ([key isEqualToString:@"objectCount"]) {
    return @([self objectCount]);
  } else if ([key isEqualToString:@"sessions"]) {
    return [self sessions];
  } else if ([key isEqualToString:@"indexOfTab"]) {
    return [self indexOfTab];
  } else {
    return nil;
  }
}

- (NSUInteger)countOfSessions {
  return [[self sessions] count];
}

- (NSNumber *)indexOfTab {
  return @([self number]);
}

@end
