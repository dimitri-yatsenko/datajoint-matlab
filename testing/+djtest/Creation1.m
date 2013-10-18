% djtest.Creation1 Table for dj.Table unit tests
%
% Tests correct parsing of table definitions. This table
% contains all supported data types with and without default values.
%
% Expected test outcome: This table should be created without error
%
% Modifying this table definition is likely break tests in djtest.TableTest

 
%{
 djtest.Creation1 (manual)  # Table creation test 1
 
 table_id              :int unsigned                 # Table primary key
 ---
 enum_attr_nodef             :enum('opt1', 'opt2')         # Enum attribute no default
 enum_attr='opt1 blub'       :enum('opt1 blub', 'opt2')    # Enum attribute with default
 enum_attr_null=NULL         :enum('opt1', 'opt2')         # Enum attribute, nullable
 date_attr_nodef             :date                         # Date attribute no default
 date_attr='2010-01-30'      :date                         # Date attribute with default
 date_attr_null=NULL         :date                         # Date attribute, nullable
 time_attr_nodef             :time                         # Time attribute no default
 time_attr='19:01:59'        :time                         # Time attribute with default
 time_attr_null=NULL         :time                         # Time attribute, nullable
 timestamp_attr_nodef        :timestamp                    # Timestamp attribute no default
 timestamp_attr='2010-01-30 19:01:59' :timestamp           # Timestamp attribute with default
 timestamp_curr=CURRENT_TIMESTAMP     :timestamp           # Timestamp attribute with default
 timestamp_attr_null=NULL    :timestamp                    # Timestamp attribute, nullable
 varchar_attr_nodef          :varchar(32)                  # Varchar attribute no default
 varchar_attr='opt1 blub'    :varchar(32)                  # Varchar attribute with default
 varchar_attr_null=NULL      :varchar(32)                  # Varchar attribute, nullable
 char_attr_nodef             :char(32)                     # Char attribute no default
 char_attr='opt1 blub'       :char(32)                     # Char attribute with default
 char_attr_null=NULL         :char(32)                     # Char attribute, nullable
 float_attr_nodef            :float                        # Float attribute no default
 float_attr=2.464e-7         :float                        # Float attribute with default
 float_attr_null=NULL        :float                        # Float attribute, nullable
 double_attr_nodef           :double                       # Double attribute no default
 double_attr=2.464e-7        :double                       # Double attribute with default
 double_attr_null=NULL       :double                       # Double attribute, nullable
 decimal_attr_nodef          :decimal(5,4)                 # Decimal attribute no default
 decimal_attr=2.4647         :decimal(5,4)                 # Decimal attribute with default
 decimal_attr_null=NULL      :decimal(5,4)                 # Decimal attribute, nullable
 decimalu_attr_nodef         :decimal(5,4) unsigned        # Decimal unsigned attribute no default
 decimalu_attr=2.4647        :decimal(5,4) unsigned        # Decimal unsigned attribute with default
 decimalu_attr_null=NULL     :decimal(5,4) unsigned        # Decimal unsigned attribute, nullable
 tinyint_attr_nodef          :tinyint                      # tinyint attribute no default
 tinyint_attr=-120           :tinyint                      # tinytint attribute with default
 tinyint_attr_null=NULL      :tinyint                      # tinyint attribute, nullable
 tinyintu_attr_nodef         :tinyint unsigned             # tinyint unsigned attribute no default
 tinyintu_attr=120           :tinyint unsigned             # tinyint unsigned attribute with default
 tinyintu_attr_null=NULL     :tinyint unsigned             # tinyint unsigned attribute, nullable
 smallint_attr_nodef         :smallint                     # smallint attribute no default
 smallint_attr=-32000        :smallint                     # smallint attribute with default
 smallint_attr_null=NULL     :smallint                     # smallint attribute, nullable
 smallintu_attr_nodef        :smallint unsigned            # smallint unsigned attribute no default
 smallintu_attr=32000        :smallint unsigned            # smallint unsigned attribute with default
 smallintu_attr_null=NULL    :smallint unsigned            # smallint unsigned attribute, nullable
 mediumint_attr_nodef        :mediumint                    # mediumint attribute no default
 mediumint_attr=-6000000     :mediumint                    # mediumint attribute with default
 mediumint_attr_null=NULL    :mediumint                    # mediumint attribute, nullable
 mediumintu_attr_nodef       :mediumint unsigned           # mediumint unsigned attribute no default
 mediumintu_attr=6000000     :mediumint unsigned           # mediumint unsigned attribute with default
 mediumintu_attr_null=NULL   :mediumint unsigned           # mediumint unsigned attribute, nullable
 int_attr_nodef              :int                          # int attribute no default
 int_attr=-2000000           :int                          # int attribute with default
 int_attr_null=NULL          :int                          # int attribute, nullable
 intu_attr_nodef             :int unsigned                 # int unsigned attribute no default
 intu_attr=2000000           :int unsigned                 # int unsigned attribute with default
 intu_attr_null=NULL         :int unsigned                 # int unsigned attribute, nullable
 bigint_attr_nodef           :bigint                       # bigint attribute no default
 bigint_attr=-2000000        :bigint                       # bigint attribute with default
 bigintu_attr_nodef          :bigint unsigned              # bigint unsigned attribute no default
 bigintu_attr=2000000        :bigint unsigned              # bigint unsigned attribute with default
 tinyblob_attr_nodef         :tinyblob                     # tinyblob attribute no default
 tinyblob_attr=NULL          :tinyblob                     # tinyblob attribute, nullable
 mediumblob_attr_nodef       :mediumblob                   # mediumblob attribute no default
 mediumblob_attr=NULL        :mediumblob                   # mediumblob attribute, nullable
 longblob_attr_nodef         :longblob                     # longblob attribute no default
 longblob_attr=NULL          :longblob                     # longblob attribute, nullable
%}
 

classdef Creation1 < dj.Relvar
     
 properties(Constant)
     table = dj.Table('djtest.Creation1')
 end
end
