"
A P3GExtensionTest is a test class for testing the behavior of extensions method of this package.
"
Class {
	#name : #JSGExtensionsTest,
	#superclass : #TestCase,
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #'tests-translating' }
JSGExtensionsTest >> testByteArrayWritePython3On [
	| string |
	string := String streamContents: [ :s | #[1 2 3 4] writeJavaScriptOn: s ].
	self assert: string equals: 'bytearray([1,2,3,4])'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testCharacterWritePython3On [
	| string |
	string := String streamContents: [ :s | $a writeJavaScriptOn: s ].
	self assert: string equals: '''a'''
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testDictionaryWritePython3On [
	| dict string |
	dict := { 
	'a' -> 1.
	42 -> 'b'.
	3 -> 4 } asDictionary.
	string := String streamContents: [ :s | dict writeJavaScriptOn: s ].
	self assert: string equals: '{''a'' : 1 , 42 : ''b'' , 3 : 4}'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testFalseWritePython3On [
	| string |
	string := String streamContents: [ :s | false writeJavaScriptOn: s ].
	self assert: string equals: 'False'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testFloatWritePython3On [
	| string |
	string := String streamContents: [ :s | 3.1415 writeJavaScriptOn: s ].
	self assert: string equals: '3.1415'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testIntegerWritePython3On [
	| string |
	string := String streamContents: [ :s | 42 writeJavaScriptOn: s ].
	self assert: string equals: '42'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testIntervalWritePython3On [
	| string expected |
	string := String streamContents: [ :s | (1 to: 4) writeJavaScriptOn: s ].
	self assert: string equals: 'range(1,5,1)'.
	
	string := String streamContents: [ :s | (1 to: 4 by: 2) writeJavaScriptOn: s ].
	self assert: string equals: 'range(1,5,2)'.
	
	string := String streamContents: [ :s | (1 to: 4 by: 0.5) writeJavaScriptOn: s ].
	expected := String streamContents: [ :s | (1 to: 4 by: 0.5) asArray writeJavaScriptOn: s ].
	self assert: string equals: expected
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testNanWritePython3On [
	| string |
	string := String streamContents: [ :s | Float nan writeJavaScriptOn: s ].
	self assert: string equals: 'float(''nan'')'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testSequenceableCollectionWritePython3On [
	| string |
	string := String streamContents: [ :s | #(1 2 3 4) writeJavaScriptOn: s ].
	self assert: string equals: '[1,2,3,4]'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testSetWritePython3On [
	| string |
	string := String streamContents: [ :s | #(1 2 3 4) asSet writeJavaScriptOn: s ].
	self assert: string equals: '{1,2,3,4}'.

	string := String streamContents: [ :s | Set new writeJavaScriptOn: s ].
	self assert: string equals: 'set()'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testStringWritePython3On [
	| string |
	string := String streamContents: [ :s | 'hello' writeJavaScriptOn: s ].
	self assert: string equals: '''hello'''.
	string := String streamContents: [ :s | 'hello\a' writeJavaScriptOn: s ].
	self assert: string equals: '''hello\\a'''.
	string := String streamContents: [ :s | 'hello',String cr writeJavaScriptOn: s ].
	self assert: string equals: '''hello\r'''
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testTrueWritePython3On [
	| string |
	string := String streamContents: [ :s | true writeJavaScriptOn: s ].
	self assert: string equals: 'True'
]

{ #category : #'tests-translating' }
JSGExtensionsTest >> testUndefinedObjectWritePython3On [
	| string |
	string := String streamContents: [ :s | nil writeJavaScriptOn: s ].
	self assert: string equals: 'null'
]
