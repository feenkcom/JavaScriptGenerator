Class {
	#name : #BaselineOfJavaScriptGenerator,
	#superclass : #BaselineOf,
	#category : #BaselineOfJavaScriptGenerator
}

{ #category : #baseline }
BaselineOfJavaScriptGenerator >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self
				definePackages: spec ]
]

{ #category : #baseline }
BaselineOfJavaScriptGenerator >> definePackages: spec [
	^ spec
		package: 'JavaScriptGenerator';
		yourself
]
