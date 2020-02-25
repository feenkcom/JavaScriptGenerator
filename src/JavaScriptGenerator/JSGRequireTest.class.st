"
A P3GImportTest is a test class for testing the behavior of P3GImport
"
Class {
	#name : #JSGRequireTest,
	#superclass : #TestCase,
	#instVars : [
		'import'
	],
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #running }
JSGRequireTest >> setUp [
	super setUp.
	import := JSGRequire moduleNamed: 'fs'.
]

{ #category : #tests }
JSGRequireTest >> testEquality [
	| toBeEqual |
	toBeEqual := import copy.
	self deny: import == toBeEqual.
	self assert: import equals: toBeEqual.
]

{ #category : #'tests-translating' }
JSGRequireTest >> testWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | import writeLinkLanguageOn: s ].
	self assert: string equals: 'require(''fs'')'
]
