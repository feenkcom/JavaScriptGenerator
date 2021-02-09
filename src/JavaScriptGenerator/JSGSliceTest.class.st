"
A P3GSliceTest is a test class for testing the behavior of P3GSlice
"
Class {
	#name : #JSGSliceTest,
	#superclass : #TestCase,
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #tests }
JSGSliceTest >> testEquality [
	| toBeEqual slice |
	slice := JSGSlice new
					lowerBound: 1;
					upperBound: 3;
					yourself.
	toBeEqual := slice copy.
	self deny: slice == toBeEqual.
	self assert: slice equals: toBeEqual.
]

{ #category : #'tests-translating' }
JSGSliceTest >> testWriteJavaScriptOn [
	| slice string |
	slice := JSGSlice new
					lowerBound: 1;
					yourself.
	string := String streamContents: [ :s | slice writeJavaScriptOn: s ].
	self assert: string equals: '1:'
]

{ #category : #'tests-translating' }
JSGSliceTest >> testWriteJavaScriptOn2 [
	| slice string |
	slice := JSGSlice new
					upperBound: 1;
					yourself.
	string := String streamContents: [ :s | slice writeJavaScriptOn: s ].
	self assert: string equals: ':1'
]

{ #category : #'tests-translating' }
JSGSliceTest >> testWriteJavaScriptOn3 [
	| slice string |
	slice := JSGSlice new
					lowerBound: 1;
					upperBound: 3;
					yourself.
	string := String streamContents: [ :s | slice writeJavaScriptOn: s ].
	self assert: string equals: '1:3'
]

{ #category : #'tests-translating' }
JSGSliceTest >> testWriteJavaScriptOn4 [
	| slice string |
	slice := JSGSlice new
					lowerBound: 1;
					upperBound: 3;
					stride: 1;
					yourself.
	string := String streamContents: [ :s | slice writeJavaScriptOn: s ].
	self assert: string equals: '1:3:1'
]
