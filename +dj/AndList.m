classdef AndList < handle
    % an AndList specifies a list of restrictions.
    % rel & dj.AndList(cond1, ..., condN) returns a relation with all the
    % tuples from rel that meet all of the conditions in the list and is
    % equivalent to rel & cond1 & ... & condN.
    %
    % Note that since any other collection is considered an OrList, then
    % dj.AndList({cond1, ..., condN}) creates an OrList
    %
    % Note that rel & dj.AndList() returns rel.
    
    properties(SetAccess=private)
        list
    end
    
    methods
        function self = AndList(varargin)
            self.list = varargin;
        end
        
        function append(self, condition)
            self.list(end+1) = condition;
        end
    end
end