"
A P3GExtensionTest is a test class for testing the behavior of extensions method of this package.
"
Class {
	#name : #JSGExtensionsTest,
	#superclass : #TestCase,
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #'tests-translating' }
JSGExtensionsTest >> testByteArrayWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | #[1 2 3 4] writeLinkLanguageOn: s ].
	self assert: string equals: 'bytearray([1,2,3,4])'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testCharacterWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | $a writeLinkLanguageOn: s ].
	self assert: string equals: '''a'''
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testDictionaryWriteJavaScriptOn [
	| dict string |
	dict := { 
	'a' -> 1.
	42 -> 'b'.
	3 -> 4 } asDictionary.
	string := String streamContents: [ :s | dict writeLinkLanguageOn: s ].
	self assert: string equals: '{''a'' : 1 , 42 : ''b'' , 3 : 4}'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testFalseWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | false writeLinkLanguageOn: s ].
	self assert: string equals: 'False'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testFloatWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | 3.1415 writeLinkLanguageOn: s ].
	self assert: string equals: '3.1415'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testIntegerWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | 42 writeLinkLanguageOn: s ].
	self assert: string equals: '42'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testIntervalWriteJavaScriptOn [
	| string expected |
	string := String streamContents: [ :s | (1 to: 4) writeLinkLanguageOn: s ].
	self assert: string equals: 'range(1,5,1)'.
	
	string := String streamContents: [ :s | (1 to: 4 by: 2) writeLinkLanguageOn: s ].
	self assert: string equals: 'range(1,5,2)'.
	
	string := String streamContents: [ :s | (1 to: 4 by: 0.5) writeLinkLanguageOn: s ].
	expected := String streamContents: [ :s | (1 to: 4 by: 0.5) asArray writeLinkLanguageOn: s ].
	self assert: string equals: expected
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testNanWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | Float nan writeLinkLanguageOn: s ].
	self assert: string equals: 'float(''nan'')'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testSequenceableCollectionWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | #(1 2 3 4) writeLinkLanguageOn: s ].
	self assert: string equals: '[1,2,3,4]'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testSetWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | #(1 2 3 4) asSet writeLinkLanguageOn: s ].
	self assert: string equals: '{1,2,3,4}'.

	string := String streamContents: [ :s | Set new writeLinkLanguageOn: s ].
	self assert: string equals: 'set()'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testStringWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | 'hello' writeLinkLanguageOn: s ].
	self assert: string equals: '''hello'''.
	string := String streamContents: [ :s | 'hello\a' writeLinkLanguageOn: s ].
	self assert: string equals: '''hello\\a'''.
	string := String streamContents: [ :s | 'hello',String cr writeLinkLanguageOn: s ].
	self assert: string equals: '''hello\r'''
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testTrueWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | true writeLinkLanguageOn: s ].
	self assert: string equals: 'True'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testUndefinedObjectWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | nil writeLinkLanguageOn: s ].
	self assert: string equals: 'null'
]
