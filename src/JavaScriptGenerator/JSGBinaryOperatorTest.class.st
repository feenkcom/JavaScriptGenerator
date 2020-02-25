"
A P3BinaryOperatorTest is a test class for testing the behavior of P3BinaryOperator
"
Class {
	#name : #JSGBinaryOperatorTest,
	#superclass : #TestCase,
	#instVars : [
		'operator'
	],
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #running }
JSGBinaryOperatorTest >> setUp [
	super setUp.
	operator := JSGBinaryOperator new
						left: 1;
						right: 2;
						operator: $+;
						yourself.
]

{ #category : #tests }
JSGBinaryOperatorTest >> testEquality [
	| toBeEqual |
	toBeEqual := operator copy.
	self deny: operator == toBeEqual.
	self assert: operator equals: toBeEqual.
]

{ #category : #'tests-translating' }
JSGBinaryOperatorTest >> testWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | operator writeLinkLanguageOn: s ].
	self assert: string equals: '1+2'
]
