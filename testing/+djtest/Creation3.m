% djtest.Creation3 Table for dj.Table unit tests
%
% Tests correct parsing of table definitions.
% Attribute comment is missing
%
% Expected test outcome: Parsing should throw an error

 
%{
 djtest.Creation3 (manual)  # Table comment
 
 table_id              :int unsigned                 # Primary key
 ---
 attr                  :date                         #
%}
 

classdef Creation3 < dj.Relvar
     
 properties(Constant)
     table = dj.Table('djtest.Creation3')
 end
end
