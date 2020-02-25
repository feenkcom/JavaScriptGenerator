"
I am a wrapper for Pharo Strings in order to be able to convert them to python strings.
"
Class {
	#name : #JSGString,
	#superclass : #JSGGenerable,
	#traits : 'JSGSubscriptionable',
	#classTraits : 'JSGSubscriptionable classTrait',
	#instVars : [
		'string'
	],
	#classInstVars : [
		'charactersToEscape'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #accessing }
JSGString class >> charactersToEscape [
	^ charactersToEscape
		ifNil: [ charactersToEscape := {
			($\ -> '\\').
			($' -> '\''').
			($" -> '\"').
			((Character codePoint: 7)  -> '\a').	"BEL"
			((Character codePoint: 8)  -> '\b').	"BS"
			((Character codePoint: 12) -> '\f').	"FF"
			(Character lf              -> '\n').	"LF"
			(Character cr              -> '\r').	"CR"
			(Character tab             -> '\t').	"TAB"
			((Character codePoint: 11) -> '\v')	"VT"} asDictionary ]
]

{ #category : #private }
JSGString class >> resetCharactersToEscape [
	"For debugging purpose.
	P3GString resetCharactersToEscape"
	charactersToEscape := nil
]

{ #category : #'instance creation' }
JSGString class >> string: aString [
	^ self new
		string: aString;
		yourself
]

{ #category : #comparing }
JSGString >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ string = anObject string
]

{ #category : #converting }
JSGString >> asJSGI [
	"Shortcut for #asP3GIdentifier."
	^ self asJSGIdentifier
]

{ #category : #converting }
JSGString >> asJSGIdentifier [
	^ JSGIdentifier new
		name: self string;
		yourself
]

{ #category : #subscription }
JSGString >> at: anObject [
	^ JSGSubscription new
		target: self;
		insideBrackets: anObject;
		yourself
]

{ #category : #accessing }
JSGString >> charactersToEscape [
	^ self class charactersToEscape
]

{ #category : #subscription }
JSGString >> from: anObject to: anotherObject by: yetAnotherObject [
	^ self at: (JSGSlice lowerBound: anObject upperBound: anotherObject stride: yetAnotherObject)
]

{ #category : #comparing }
JSGString >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ string hash
]

{ #category : #accessing }
JSGString >> string [
	^ string
]

{ #category : #accessing }
JSGString >> string: anObject [
	string := anObject
]

{ #category : #translating }
JSGString >> writeLinkLanguageOn: aStream [
	aStream << $'.
	self string do: [ :c|
		(self charactersToEscape includesKey: c)
			ifTrue: [ aStream << (self charactersToEscape at: c) ]
			ifFalse: [ aStream << c ]
		 ].
	aStream << $'
]
