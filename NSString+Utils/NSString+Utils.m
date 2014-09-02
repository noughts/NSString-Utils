//
//  NSString+Utils.m
//  NSString+UtilsDemo
//
//  Created by noughts on 2014/09/02.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

/// よみがなを取得
-(NSString*)yomigana{
	NSString* inputText = self;
    NSMutableString *outputText = [[NSMutableString alloc] init];
    
    CFRange range = CFRangeMake(0, [inputText length]);
    CFLocaleRef locale = CFLocaleCopyCurrent();
    
    /* トークナイザーを作成 */
    CFStringTokenizerRef    tokenizer = CFStringTokenizerCreate(kCFAllocatorDefault,
                                                                (CFStringRef)inputText,
                                                                range,
                                                                kCFStringTokenizerUnitWordBoundary,
                                                                locale);
    
    /* 最初の位置に */
    CFStringTokenizerTokenType  tokenType = CFStringTokenizerGoToTokenAtIndex(tokenizer, 0);
    
    /* 形態素解析 */
    while (tokenType != kCFStringTokenizerTokenNone) {
        range = CFStringTokenizerGetCurrentTokenRange(tokenizer);
        
        /* ローマ字を得る */
        CFTypeRef   latin = CFStringTokenizerCopyCurrentTokenAttribute(tokenizer, kCFStringTokenizerAttributeLatinTranscription);
        NSString    *romaji = (__bridge NSString *)latin;
        
//        NSString    *token = [inputText substringWithRange:NSMakeRange(range.location, range.length)];
        
        /* 平仮名に変換 */
        NSMutableString *furigana = [romaji mutableCopy];
        CFStringTransform((CFMutableStringRef)furigana, NULL, kCFStringTransformLatinHiragana, false);
        
        [outputText appendString:furigana];
        
        CFRelease(latin);
        tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer);
    }
    CFRelease(tokenizer);
    
    CFRelease(locale);
    
    return outputText;
}

@end
