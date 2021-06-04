"
A P3GUnaryOperatorTest is a test class for testing the behavior of P3GUnaryOperator

"
Class {
	#name : #JSGUnaryOperatorTest,
	#superclass : #TestCase,
	#instVars : [
		'operator'
	],
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #running }
JSGUnaryOperatorTest >> setUp [
	super setUp.
	operator := JSGUnaryOperator new
						target: 1;
						operator: $~;
						yourself.
]

{ #category : #tests }
JSGUnaryOperatorTest >> testEquality [
	| toBeEqual |
	toBeEqual := operator copy.
	self deny: operator == toBeEqual.
	self assert: operator equals: toBeEqual.
]

{ #category : #'tests-translating' }
JSGUnaryOperatorTest >> testWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | operator writeJavaScriptOn: s ].
	self assert: string equals: '~1'
]
