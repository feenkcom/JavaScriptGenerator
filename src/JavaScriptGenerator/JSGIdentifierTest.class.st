"
A P3GIdentifierTest is a test class for testing the behavior of P3GIdentifier
"
Class {
	#name : #JSGIdentifierTest,
	#superclass : #TestCase,
	#instVars : [
		'identifier'
	],
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #running }
JSGIdentifierTest >> setUp [
	super setUp.
	identifier := JSGIdentifier new
						name: 'id';
						yourself.
]

{ #category : #tests }
JSGIdentifierTest >> testEquality [
	| toBeEqual |
	toBeEqual := identifier copy.
	self deny: identifier == toBeEqual.
	self assert: identifier equals: toBeEqual.
]

{ #category : #'tests-translating' }
JSGIdentifierTest >> testWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | identifier writeLinkLanguageOn: s ].
	self assert: string equals: 'id'
]
