"
I am a binary Python operator.

"
Class {
	#name : #JSGBinaryOperator,
	#superclass : #JSGOperator,
	#instVars : [
		'left',
		'right'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #comparing }
JSGBinaryOperator >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ right = anObject right
		and: [ left = anObject left and: [ operator = anObject operator ] ]
]

{ #category : #comparing }
JSGBinaryOperator >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ right hash bitXor: (left hash bitXor: operator hash)
]

{ #category : #accessing }
JSGBinaryOperator >> left [
	^ left
]

{ #category : #accessing }
JSGBinaryOperator >> left: anObject [
	left := anObject
]

{ #category : #accessing }
JSGBinaryOperator >> right [
	^ right
]

{ #category : #accessing }
JSGBinaryOperator >> right: anObject [
	right := anObject
]

{ #category : #translating }
JSGBinaryOperator >> writeJavaScriptOn: aStream [
	self left writeJavaScriptOn: aStream.
	aStream << self operator.
	self right writeJavaScriptOn: aStream
]
