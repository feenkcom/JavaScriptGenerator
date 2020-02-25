"
I am  the reference to an attribute like this: 'target.attribute'.
"
Class {
	#name : #JSGAttributeReference,
	#superclass : #JSGGenerable,
	#traits : 'JSGCallable + JSGAssignable + JSGAttributeAccess + JSGSubscriptionable',
	#classTraits : 'JSGCallable classTrait + JSGAssignable classTrait + JSGAttributeAccess classTrait + JSGSubscriptionable classTrait',
	#instVars : [
		'target',
		'attributeIdentifier'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #'instance creation' }
JSGAttributeReference class >> target: target attributeIdentifier: identifier [
	^ self new
		target: target;
		attributeIdentifier: identifier;
		yourself
]

{ #category : #comparing }
JSGAttributeReference >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ target = anObject target
		and: [ attributeIdentifier = anObject attributeIdentifier ]
]

{ #category : #assignments }
JSGAttributeReference >> assign: aP3GGenerable [
	^ JSGAssignment target: self toAssignate: aP3GGenerable
]

{ #category : #subscription }
JSGAttributeReference >> at: anObject [
	^ JSGSubscription new
		target: self;
		insideBrackets: anObject;
		yourself
]

{ #category : #accessing }
JSGAttributeReference >> attributeIdentifier [
	^ attributeIdentifier
]

{ #category : #accessing }
JSGAttributeReference >> attributeIdentifier: anObject [
	attributeIdentifier := anObject
]

{ #category : #'attribute access' }
JSGAttributeReference >> attributeNamed: aString [
	"Returns an instance of P3GAttributeAccess to access the attribute with aString as name."
	^ JSGAttributeReference target: self attributeIdentifier: aString asJSGIdentifier
]

{ #category : #call }
JSGAttributeReference >> callWith: anArrayOrADictionary [
	^ anArrayOrADictionary jsgCallArgumentsOf: self
]

{ #category : #call }
JSGAttributeReference >> callWith: anArray with: aDictionary [
	^ JSGCall target: self positionalArguments: anArray keywordArguments: aDictionary
]

{ #category : #subscription }
JSGAttributeReference >> from: anObject to: anotherObject by: yetAnotherObject [
	^ self at: (JSGSlice lowerBound: anObject upperBound: anotherObject stride: yetAnotherObject)
]

{ #category : #comparing }
JSGAttributeReference >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ target hash bitXor: attributeIdentifier hash
]

{ #category : #importing }
JSGAttributeReference >> require [
	^ JSGRequire moduleIdentifier: self
]

{ #category : #accessing }
JSGAttributeReference >> target [
	^ target
]

{ #category : #accessing }
JSGAttributeReference >> target: anObject [
	target := anObject
]

{ #category : #translating }
JSGAttributeReference >> writeLinkLanguageOn: aStream [
	self target writeLinkLanguageOn: aStream.
	aStream << $..
	self attributeIdentifier writeLinkLanguageOn: aStream.
]
