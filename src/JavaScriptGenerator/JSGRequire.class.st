"
I represent a JavaScript ""require"" statement.

"
Class {
	#name : #JSGRequire,
	#superclass : #JSGStatement,
	#instVars : [
		'moduleIdentifier'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #accessing }
JSGRequire class >> moduleIdentifier: aJSGIdentifier [
	^ self new
		moduleIdentifier: aJSGIdentifier;
		yourself
]

{ #category : #'instance creation' }
JSGRequire class >> moduleNamed: aString [
	^ self new
		moduleIdentifier: aString;
		yourself
]

{ #category : #comparing }
JSGRequire >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ moduleIdentifier = anObject moduleIdentifier
]

{ #category : #comparing }
JSGRequire >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ moduleIdentifier hash
]

{ #category : #testing }
JSGRequire >> isRequire [
	^ true
]

{ #category : #accessing }
JSGRequire >> moduleIdentifier [
	^ moduleIdentifier
]

{ #category : #accessing }
JSGRequire >> moduleIdentifier: anObject [
	moduleIdentifier := anObject
]

{ #category : #translating }
JSGRequire >> writeJavaScriptOn: aStream [
	aStream << 'require('.
	self moduleIdentifier writeJavaScriptOn: aStream.
	aStream << ')'
]
