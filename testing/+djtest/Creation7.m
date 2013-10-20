% djtest.Creation7 Table for dj.Table unit tests
%
% Tests correct parsing of table definitions, with a focus
% on secondary indexes.
% An invalid index is specified due to repetition of a column name
%
% Expected test outcome: Table creation should throw an error
%
% Modifying this table definition is likely break tests in djtest.TableTest

 
%{
 djtest.Creation7 (manual)  # Table creation test 1
 
 table_id              :int unsigned                 # Table primary key
 ---
 enum_attr='opt1 blub'       :enum('opt1 blub', 'opt2')    # Enum attribute with default
 timestamp_attr_nodef        :timestamp                    # Timestamp attribute no default
 float_attr=2.464e-7         :float                        # Float attribute with default
 decimal_attr=2.4647         :decimal(5,4)                 # Decimal attribute with default
 int_attr                    :int                          # int attribute no default
 INDEX(float_attr)
 INDEX(decimal_attr,decimal_attr)
 %}
 

classdef Creation7 < dj.Relvar
     
 properties(Constant)
     table = dj.Table('djtest.Creation7')
 end
end
