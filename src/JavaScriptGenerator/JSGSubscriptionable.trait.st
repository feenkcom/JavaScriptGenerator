"
I define methods to allow easily perform subscription on a Python object.
"
Trait {
	#name : #JSGSubscriptionable,
	#category : #'JavaScriptGenerator-Traits'
}

{ #category : #subscription }
JSGSubscriptionable >> at: anObject [
	^ JSGSubscription new
		target: self;
		insideBrackets: anObject;
		yourself
]

{ #category : #subscription }
JSGSubscriptionable >> from: anObject to: anotherObject [
	^ self from: anObject to: anotherObject by: nil
]

{ #category : #subscription }
JSGSubscriptionable >> from: anObject to: anotherObject by: yetAnotherObject [
	^ self at: (JSGSlice lowerBound: anObject upperBound: anotherObject stride: yetAnotherObject)
]
