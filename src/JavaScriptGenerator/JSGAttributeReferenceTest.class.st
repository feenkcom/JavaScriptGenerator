"
A P3GAttributeReferenceTest is a test class for testing the behavior of P3GAttributeReference

"
Class {
	#name : #JSGAttributeReferenceTest,
	#superclass : #TestCase,
	#instVars : [
		'attrRef'
	],
	#category : #'JavaScriptGenerator-Tests'
}

{ #category : #running }
JSGAttributeReferenceTest >> setUp [
	super setUp.
	attrRef := JSGAttributeReference new
						target: 'var' asJSGIdentifier;
						attributeIdentifier: 'attr' asJSGIdentifier;
						yourself.
]

{ #category : #tests }
JSGAttributeReferenceTest >> testEquality [
	| toBeEqual |
	toBeEqual := attrRef copy.
	self deny: attrRef == toBeEqual.
	self assert: attrRef equals: toBeEqual.
]

{ #category : #'tests-translating' }
JSGAttributeReferenceTest >> testWriteJavaScriptOn [
	| string |
	string := String streamContents: [ :s | attrRef writeJavaScriptOn: s ].
	self assert: string equals: 'var.attr'
]
