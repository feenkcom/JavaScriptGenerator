Extension { #name : #Interval }

{ #category : #'*JavaScriptGenerator' }
Interval >> writeJavaScriptOn: aStream [
	"Intervals in Pharo is equivalent to Ranges in Python except that Python's ranges can not hold
	float numbers. So in this method, if #start, #stop and #step are all integers, a Python's range
	is generated. Else, a Python's list is generated."
	
	(start isInteger and: [ stop isInteger and: [ step isInteger ] ])
		ifFalse: [ self asArray writeJavaScriptOn: aStream. ^ self ].
	
	"The range(i, j, k) function creates a range from i to j-1 by step.
	This is why in positional arguments of the function invocation, there is 'self last + 1'."
	JSGCall new
		target: 'range' asJSGIdentifier;
		positionalArguments: { start .  stop + 1 . step };
		writeJavaScriptOn: aStream
]
