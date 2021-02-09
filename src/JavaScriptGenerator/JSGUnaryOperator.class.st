"
I am a unary Python operator.
"
Class {
	#name : #JSGUnaryOperator,
	#superclass : #JSGOperator,
	#instVars : [
		'target'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #comparing }
JSGUnaryOperator >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ operator = anObject operator and: [ target = anObject target ]
]

{ #category : #comparing }
JSGUnaryOperator >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ operator hash bitXor: target hash
]

{ #category : #accessing }
JSGUnaryOperator >> target [
	^ target
]

{ #category : #accessing }
JSGUnaryOperator >> target: anObject [
	target := anObject
]

{ #category : #translating }
JSGUnaryOperator >> writeJavaScriptOn: aStream [
	aStream << self operator.
	self target writeJavaScriptOn: aStream
]
