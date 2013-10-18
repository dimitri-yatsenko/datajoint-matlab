% djtest.Creation5 Table for dj.Table unit tests
%
% Tests correct parsing of table definitions.
% Primary key is missing
%
% Expected test outcome: Parsing should throw an error
 
%{
djtest.Creation5 (manual)  # Table comment
---
 attr                  :int                          # Dependent attr
%}
 

classdef Creation5 < dj.Relvar
     
 properties(Constant)
     table = dj.Table('djtest.Creation5')
 end
end
