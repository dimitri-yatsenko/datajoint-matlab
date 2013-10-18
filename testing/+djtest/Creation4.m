% djtest.Creation4 Table for dj.Table unit tests
%
% Tests correct parsing of table definitions.
%
% Expected test outcome: Definition is parsed and
% a three-column primary key is created

 
%{
 djtest.Creation4 (imported)  # Table comment
 
 prim_field1           :int unsigned                 # Primary key
 prim_field2           :varchar(8)                   # Primary key cont.
 prim_field3           :enum('A', 'B', 'C')          # Primary key cont.
 ---
 attr                  :int                          # Dependent attr
%}
 

classdef Creation4 < dj.Relvar
     
 properties(Constant)
     table = dj.Table('djtest.Creation4')
 end
end
