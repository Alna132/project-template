// This query shows all the candidates from tipperary.
// It gathers all candidates that have a relationship tag with the tipperary constituency node.


MATCH
	(candidate:Candidate)<-[:HAS]-(constituency:Constituency {Name:"Tipperary"})
RETURN
	candidate;
