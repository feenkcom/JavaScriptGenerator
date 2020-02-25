"
I am a Python 3 slice.

According to the documentation:
A slicing selects a range of items in a sequence object (e.g., a string, tuple or list).
"
Class {
	#name : #JSGSlice,
	#superclass : #JSGGenerable,
	#instVars : [
		'lowerBound',
		'upperBound',
		'stride'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #'instance creation' }
JSGSlice class >> lowerBound: anObject upperBound: anotherObject [
	^ self lowerBound: anObject upperBound: anotherObject stride: nil
]

{ #category : #'instance creation' }
JSGSlice class >> lowerBound: anObject upperBound: anotherObject stride: yetAnotherObject [
	^ self new
		lowerBound: anObject;
		upperBound: anotherObject;
		stride: yetAnotherObject;
		yourself
]

{ #category : #comparing }
JSGSlice >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ lowerBound = anObject lowerBound
		and: [ stride = anObject stride and: [ upperBound = anObject upperBound ] ]
]

{ #category : #comparing }
JSGSlice >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ lowerBound hash bitXor: (stride hash bitXor: upperBound hash)
]

{ #category : #accessing }
JSGSlice >> lowerBound [
	^ lowerBound
]

{ #category : #accessing }
JSGSlice >> lowerBound: anObject [
	lowerBound := anObject
]

{ #category : #accessing }
JSGSlice >> stride [
	^ stride
]

{ #category : #accessing }
JSGSlice >> stride: anObject [
	stride := anObject
]

{ #category : #accessing }
JSGSlice >> upperBound [
	^ upperBound
]

{ #category : #accessing }
JSGSlice >> upperBound: anObject [
	upperBound := anObject
]

{ #category : #translating }
JSGSlice >> writeLinkLanguageOn: aStream [
	self lowerBound
		ifNotNil: [ self lowerBound writeLinkLanguageOn: aStream ].
	
	aStream << $:.
	
	self upperBound ifNotNil: [
		self upperBound writeLinkLanguageOn: aStream ].
	
	self stride ifNil: [ ^ self ].
	aStream << $:.
	self stride writeLinkLanguageOn: aStream.
]
