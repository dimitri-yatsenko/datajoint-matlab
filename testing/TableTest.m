classdef TableTest < matlab.unittest.TestCase
    % Unit tests for dj.Table, excluding ALTER() statements
    
    methods(Test)
        function setup(~)
            s = djtest.getSchema();
            s.conn.query('CREATE DATABASE djtest');
            clear classes
            dj.set('suppressPrompt', true)
        end
        
        function testCreationDatatypes(testCase)
            % Verify that all datatypes are supported
            % in table definitions without throwing an error
            t = dj.Table('djtest.Creation1');
            testCase.verifyNumElements(t.header, 66);
        end
        
        function testComment(testCase)
            % Verify that table comments are read correctly
            t = dj.Table('djtest.Creation1');
            testCase.verifyEqual(t.info.comment, 'Table creation test 1');
        end
        
        function testMissingComment(testCase)
            % Verify that a missing table comment triggers a parsing error
            testCase.verifyError(@() display(dj.Table('djtest.Creation2')), ...
                'DataJoint:invalidTableDeclaration')
        end
        
        function testAttributeComment(testCase)
            % Verify that attribute comments are read correctly
            t = dj.Table('djtest.Creation1');
            testCase.verifyEqual(t.header(2).comment, ...
                'Enum attribute no default');
            testCase.verifyEqual(t.header(end).comment, ...
                'longblob attribute, nullable');
        end
        
        function testMissingAttributeComment(testCase)
            % Verify that a missing attribute comment triggers a parsing error
            testCase.verifyError(@() display(dj.Table('djtest.Creation3')), ...
                'DataJoint:Table')
            
        end
        
        function testPrimaryKey(testCase)
            % Verify that primary keys are created correctly
            t = dj.Table('djtest.Creation4');
            sel_key = [t.header.iskey];
            expected_keys = arrayfun(@(x) sprintf('prim_field%d', x), ...
                1:3, 'UniformOutput', false);
            testCase.verifyEqual(sum(sel_key), numel(expected_keys))
            testCase.verifyTrue(all(ismember(expected_keys, ...
                {t.header(sel_key).name})))
        end
        
        function testMissingPrimaryKey(testCase)
            % Verify that a missing primary key will throw an error
            testCase.verifyError(@() display(dj.Table('djtest.Creation5')), ...
                'DataJoint:Table')
        end
        
        function testSecondaryIndex(testCase)
            t = dj.Table('djtest.Creation6');
            display(t);
            indexes = dj.struct.fromFields( t.schema.conn.query( ...
                ['SHOW INDEX FROM `creation6` IN `djtest` ' ...
                'WHERE NOT `Key_name`="PRIMARY"'], 'bigint_to_double'));
            % We have three indexes
            testCase.verifyNumElements(unique({indexes.Key_name}), 3)
            % In total, five fields are part of the secondary indexes
            testCase.verifyNumElements(indexes,5);
            
            % Invalid index specifications with repeated field names
            testCase.verifyError(@() display(dj.Table('djtest.Creation7')), ...
                'DataJoint:Table')
            % Invalid index specifications with invalid field names
            testCase.verifyError(@() display(dj.Table('djtest.Creation8')), ...
                'DataJoint:Table')
        end
        
        function testGetEnumValues(testCase)
            % Verify that getEnumValues() returns the correct data
            t = dj.Table('djtest.Creation4');
            enum_vals = t.getEnumValues('prim_field3');
            testCase.verifyInstanceOf(enum_vals, 'cell');
            testCase.verifyEqual(enum_vals, {'A','B','C'});
            % Verify that an error is thrown when called on non-enum field
            testCase.verifyError(@() t.getEnumValues('prim_field2'), ...
                'DataJoint:Table');
            % Verify that an error is thrown when called on invalid attr
            testCase.verifyError(@() t.getEnumValues('madeup_field'), ...
                'DataJoint:Table');
        end
        
        function testPublicProperties(testCase)
            % Verify that all public properties can be accessed without
            % throwing an error and that they contain reasonable values
            t = dj.Table('djtest.Creation4');
            testCase.verifyInstanceOf(t.schema, 'dj.Schema')
            testCase.verifyEqual(t.className, 'djtest.Creation4')
            testCase.verifyInstanceOf(t.info, 'struct')
            testCase.verifyInstanceOf(t.header, 'struct')
            testCase.verifyNumElements(t.header, 4)
            testCase.verifyEqual(t.fullTableName, '`djtest`.`_creation4`')
            testCase.verifyEqual(t.plainTableName, '_creation4')
            testCase.verifyInstanceOf(t.parents, 'cell')
            testCase.verifyEmpty(t.parents)
            testCase.verifyInstanceOf(t.references, 'cell')
            testCase.verifyEmpty(t.references)
            testCase.verifyInstanceOf(t.children, 'cell')
            testCase.verifyEmpty(t.children)
            testCase.verifyInstanceOf(t.referencing, 'cell')
            testCase.verifyEmpty(t.referencing)
            testCase.verifyInstanceOf(t.descendants, 'cell')
            testCase.verifyEqual(t.descendants, {'djtest.Creation4'})
        end
        
        function testPublicFunctions(testCase)
            % Verify that various public functions that are not explicitly
            % tested anywhere else work without throwing an error
            t = dj.Table('djtest.Creation4');
            display(t)
            erd(t)
            testCase.verifyInstanceOf(re(t), 'char')
            optimize(t)
        end
        
        function teardown(~)
            s = djtest.getSchema();
            s.conn.query('DROP DATABASE `djtest`');
        end
    end
end

