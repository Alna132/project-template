// This query searches and returns all candidates that got a seat in the elections.
// It searches all the Candidate nodes with the lable Elected that contains a Yes rather than a no.


MATCH
	(candidate:Candidate {Elected: "Yes"})
RETURN
	candidate;
