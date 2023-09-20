Class {
	#name : #TravelBPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post'
	],
	#category : #ProjekatPharo
}

{ #category : #initialization }
TravelBPostComponent >> date [
	^ post date
]

{ #category : #initialization }
TravelBPostComponent >> description [
	^ post description  
]

{ #category : #initialization }
TravelBPostComponent >> initialize [ 
	super initialize.
	post := Travel new
]

{ #category : #accessing }
TravelBPostComponent >> post: aPost [
	post := aPost
]

{ #category : #initialization }
TravelBPostComponent >> renderContentOn: html [
	html heading level: 2; with: self title.
	html heading level: 6; with: self date.
	html text: self description 
]

{ #category : #initialization }
TravelBPostComponent >> title [ 
	^ post title 
]
