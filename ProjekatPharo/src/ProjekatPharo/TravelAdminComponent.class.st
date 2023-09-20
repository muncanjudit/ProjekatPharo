Class {
	#name : #TravelAdminComponent,
	#superclass : #TravelBScreenComponent,
	#instVars : [
		'report'
	],
	#category : #ProjekatPharo
}

{ #category : #accessing }
TravelAdminComponent >> children [
	^ super children copyWith: self report
]

{ #category : #initialization }
TravelAdminComponent >> createHeaderComponent [
	^TravelAdminHeaderComponent from: self
]

{ #category : #'as yet unclassified' }
TravelAdminComponent >> goToPostListView [ 
	self answer 
	
]

{ #category : #accessing }
TravelAdminComponent >> initialize [
	super initialize.
	self report: (TravelPostsReport from: self blog)
]

{ #category : #accessing }
TravelAdminComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Blog Admin'.
		html horizontalRule.
		html render: self report ]
	
]

{ #category : #accessing }
TravelAdminComponent >> report [
	^report
]

{ #category : #accessing }
TravelAdminComponent >> report: aReport [
	report := aReport
]
