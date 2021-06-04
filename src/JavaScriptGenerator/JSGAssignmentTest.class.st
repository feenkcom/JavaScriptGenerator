"
A P3GAssignmentTest is a test class for testing the behavior of P3GAssignment

"
Class {
	#name : #JSGAssignmentTest,
	#superclass : #TestCase,
	#instVars : [
		'assignment'
	],
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #running }
JSGAssignmentTest >> setUp [
	super setUp.
	assignment := JSGAssignment new
						target: (JSGIdentifier named: 'variable');
						toAssignate: 42;
						yourself.
]

{ #category : #tests }
JSGAssignmentTest >> testEquality [
	| toBeEqual |
	toBeEqual := assignment copy.
	self deny: assignment == toBeEqual.
	self assert: assignment equals: toBeEqual.
]

{ #category : #'tests-translating' }
JSGAssignmentTest >> testWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | assignment writeJavaScriptOn: s ].
	self assert: string equals: 'variable = 42'
]
