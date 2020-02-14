"
I am an abstract Python operator.
"
Class {
	#name : #JSGOperator,
	#superclass : #JSGGenerable,
	#instVars : [
		'operator'
	],
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #accessing }
JSGOperator >> operator [
	^ operator
]

{ #category : #accessing }
JSGOperator >> operator: anObject [
	operator := anObject
]
