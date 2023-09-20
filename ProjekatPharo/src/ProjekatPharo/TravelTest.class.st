Class {
	#name : #TravelTest,
	#superclass : #TestCase,
	#category : #'ProjekatPharo-Tests'
}

{ #category : #tests }
TravelTest >> testPostIsCreatedCorrectly [
	| post |
	post := Travel
		title: 'Big trouble and escape...'
		description: 'One day Lucy and me went down the river...'
		country: 'Serbia'.
	self assert: post title equals: 'Big trouble and escape...'.
	self assert: post description equals: 'One day Lucy and me went down the river...'.
	self assert: post country equals: 'Serbia'
]

{ #category : #tests }
TravelTest >> testWithoutCategoryIsUnclassified [

	| post |
	post := Travel
		title: 'Big trouble and escape...'
		description: 'One day Lucy and me went down the river...'.
	self assert: post title equals: 'Big trouble and escape...'.
	self assert: post description equals: 'One day Lucy and me went down the river...'.
	self assert: post isUnclassified.
	self deny: post isVisible 
	
]
