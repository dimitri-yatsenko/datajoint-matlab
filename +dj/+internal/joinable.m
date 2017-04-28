function joinable(rel1, rel2)
% JOINABLE(rel1, rel2) yields true when relations rel1 and rel2 are
% join-compatible.
% Two relations are join-compatible when all their common attributes are
% either in a foreign key or in the primary keys in both relations.

commonAttributes = intersect(rel1.header.names, rel2.header.names);