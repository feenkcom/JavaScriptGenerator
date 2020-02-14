"
I define methods to allow easy use of Python 3 binary operators.
"
Trait {
	#name : #JSGBinaryOperationSupport,
	#category : #'JavaScriptGenerator-Traits'
}

{ #category : #'arithmetic operators' }
JSGBinaryOperationSupport >> * anObject [
	^ JSGBinaryOperator new
		operator: $*;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
JSGBinaryOperationSupport >> + anObject [
	^ JSGBinaryOperator new
		operator: $+;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
JSGBinaryOperationSupport >> - anObject [
	^ JSGBinaryOperator new
		operator: $-;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'arithmetic operators' }
JSGBinaryOperationSupport >> / anObject [
	^ JSGBinaryOperator new
		operator: $/;
		left: self;
		right: anObject;
		yourself
]

{ #category : #'boolean operators' }
JSGBinaryOperationSupport >> isEqualTo: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: $=;
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGBinaryOperationSupport >> isGreaterOrEqThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: '>=';
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGBinaryOperationSupport >> isGreaterThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: $>;
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGBinaryOperationSupport >> isSmallerOrEqThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: '<=';
		left: self;
		right: aP3GGenerable;
		yourself
]

{ #category : #'boolean operators' }
JSGBinaryOperationSupport >> isSmallerThan: aP3GGenerable [
	^ JSGBinaryOperator new
		operator: $<;
		left: self;
		right: aP3GGenerable;
		yourself
]
