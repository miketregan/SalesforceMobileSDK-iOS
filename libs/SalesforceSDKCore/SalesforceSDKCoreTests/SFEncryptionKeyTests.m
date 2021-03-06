/*
 Copyright (c) 2014-present, salesforce.com, inc. All rights reserved.
 
 Redistribution and use of this software in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions
 and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of
 conditions and the following disclaimer in the documentation and/or other materials provided
 with the distribution.
 * Neither the name of salesforce.com, inc. nor the names of its contributors may be used to
 endorse or promote products derived from this software without specific prior written
 permission of salesforce.com, inc.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
 WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import <XCTest/XCTest.h>
#import "SFEncryptionKey.h"


@interface SFEncryptionKeyTests : XCTestCase

@end

@implementation SFEncryptionKeyTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testKeyEquality
{
    SFEncryptionKey *key1 = [[SFEncryptionKey alloc] initWithData:[@"keyData" dataUsingEncoding:NSUTF8StringEncoding]
                                             initializationVector:[@"ivData" dataUsingEncoding:NSUTF8StringEncoding]];
    SFEncryptionKey *key2 = [[SFEncryptionKey alloc] initWithData:[@"keyData" dataUsingEncoding:NSUTF8StringEncoding]
                                             initializationVector:[@"ivData" dataUsingEncoding:NSUTF8StringEncoding]];
    SFEncryptionKey *key3 = [[SFEncryptionKey alloc] initWithData:[@"otherKeyData" dataUsingEncoding:NSUTF8StringEncoding]
                                             initializationVector:[@"otherIvData" dataUsingEncoding:NSUTF8StringEncoding]];
    XCTAssertEqualObjects(key1, key2, @"Objects should be equal, with identical keys and iv's.");
    XCTAssertNotEqualObjects(key1, key3, @"Object with different keys and iv's should not be equal.");
}


- (void)testKeyStringRepresentations
{
    SFEncryptionKey *key1 = [[SFEncryptionKey alloc] initWithData:[@"keyData" dataUsingEncoding:NSUTF8StringEncoding]
                                             initializationVector:[@"ivData" dataUsingEncoding:NSUTF8StringEncoding]];
    SFEncryptionKey *key2 = [[SFEncryptionKey alloc] initWithData:[@"keyData" dataUsingEncoding:NSUTF8StringEncoding]
                                             initializationVector:[@"ivData" dataUsingEncoding:NSUTF8StringEncoding]];
    XCTAssertEqualObjects(key1.keyAsString, key2.keyAsString, @"Key string representation should be the same.");
    XCTAssertEqualObjects(key1.initializationVectorAsString, key2.initializationVectorAsString, @"IV string representation should be the same.");
}

@end
