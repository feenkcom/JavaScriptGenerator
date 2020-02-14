"
I represent a Python 3 subscription.
A subscription selects an item of a sequence (string, tuple or list) or mapping (dictionary) .
"
Class {
	#name : #JSGSubscription,
	#superclass : #JSGGenerable,
	#traits : 'JSGAttributeAccess + JSGCallable + JSGAssignable + JSGSubscriptionable',
	#classTraits : 'JSGAttributeAccess classTrait + JSGCallable classTrait + JSGAssignable classTrait + JSGSubscriptionable classTrait',
	#instVars : [
		'target',
		'insideBrackets'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #comparing }
JSGSubscription >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ insideBrackets = anObject insideBrackets
		and: [ target = anObject target ]
]

{ #category : #assignments }
JSGSubscription >> assign: aP3GGenerable [
	^ JSGAssignment target: self toAssignate: aP3GGenerable
]

{ #category : #subscription }
JSGSubscription >> at: anObject [
	^ JSGSubscription new
		target: self;
		insideBrackets: anObject;
		yourself
]

{ #category : #'attribute access' }
JSGSubscription >> attributeNamed: aString [
	"Returns an instance of P3GAttributeAccess to access the attribute with aString as name."
	^ JSGAttributeReference target: self attributeIdentifier: aString asJSGIdentifier
]

{ #category : #call }
JSGSubscription >> callWith: anArrayOrADictionary [
	^ anArrayOrADictionary jsgCallArgumentsOf: self
]

{ #category : #call }
JSGSubscription >> callWith: anArray with: aDictionary [
	^ JSGCall target: self positionalArguments: anArray keywordArguments: aDictionary
]

{ #category : #subscription }
JSGSubscription >> from: anObject to: anotherObject by: yetAnotherObject [
	^ self at: (JSGSlice lowerBound: anObject upperBound: anotherObject stride: yetAnotherObject)
]

{ #category : #comparing }
JSGSubscription >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ insideBrackets hash bitXor: target hash
]

{ #category : #accessing }
JSGSubscription >> insideBrackets [
	^ insideBrackets
]

{ #category : #accessing }
JSGSubscription >> insideBrackets: anObject [
	insideBrackets := anObject
]

{ #category : #accessing }
JSGSubscription >> target [
	^ target
]

{ #category : #accessing }
JSGSubscription >> target: anObject [
	target := anObject
]

{ #category : #translating }
JSGSubscription >> writeJavaScriptOn: aStream [
	self target writeJavaScriptOn: aStream.
	aStream << $[.
	self insideBrackets writeJavaScriptOn: aStream.
	aStream << $]
]
