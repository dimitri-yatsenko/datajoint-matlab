% djtest.Creation6 Table for dj.Table unit tests
%
% Tests correct parsing of table definitions, with a focus
% on secondary indexes
%
% Expected test outcome: This table should be created without error
%
% Modifying this table definition is likely break tests in djtest.TableTest

 
%{
 djtest.Creation6 (manual)  # Table creation test 1
 
 table_id              :int unsigned                 # Table primary key
 ---
 enum_attr='opt1 blub'       :enum('opt1 blub', 'opt2')    # Enum attribute with default
 timestamp_attr_nodef        :timestamp                    # Timestamp attribute no default
 float_attr=2.464e-7         :float                        # Float attribute with default
 decimal_attr=2.4647         :decimal(5,4)                 # Decimal attribute with default
 int_attr                    :int                          # int attribute no default
 INDEX(float_attr)
 INDEX(decimal_attr,int_attr)
 UNIQUE INDEX(enum_attr,timestamp_attr_nodef)
%}
 

classdef Creation6 < dj.Relvar
     
 properties(Constant)
     table = dj.Table('djtest.Creation6')
 end
end
