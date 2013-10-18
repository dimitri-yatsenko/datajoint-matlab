% djtest.Creation2 Table for dj.Table unit tests
%
% Tests correct parsing of table definitions.
% Table comment is missing
%
% Expected test outcome: Parsing should throw an error

 
%{
 djtest.Creation2 (manual)  #
 
 table_id              :int unsigned                 # label used to mount this filesystem, e.g. ld415
 ---
 attr                  :date                         # Date attribute no default
%}
 

classdef Creation2 < dj.Relvar
     
 properties(Constant)
     table = dj.Table('djtest.Creation2')
 end
end
