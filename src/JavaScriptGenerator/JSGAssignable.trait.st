"
I define methods to allow easy assignments.
"
Trait {
	#name : #JSGAssignable,
	#category : #'JavaScriptGenerator-Traits'
}

{ #category : #assignments }
JSGAssignable >> <- aP3GGenerable [
	^ self assign: aP3GGenerable
]

{ #category : #assignments }
JSGAssignable >> assign: aP3GGenerable [
	^ JSGAssignment target: self toAssignate: aP3GGenerable
]
