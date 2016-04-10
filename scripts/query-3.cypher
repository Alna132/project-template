// This query counts the number of Candidates in the Green Party.
// It gathers all the candidates with a relationship with the Green Party node and then counts them.


MATCH
	(candidate:Candidate)-[:MEMBER_OF]->(party:Party {Name:"Green Party"})
RETURN
	count(candidate);
