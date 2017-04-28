classdef OrList
    % an OrList specifies a list of restrictions.
    % rel & dj.OrList(cond1, ..., condN) returns a relation with all the
    % tuples from rel that meet any of the conditions in the list.
    %
    % Any collection of restrictions (except dj.AndList) is interpreted as an OrList.
    % Thus rel & dj.OrList(cond1, ..., condN) is equivalent to rel & {cond1, ..., condN}
    %
    % Note that rel & dj.OrList() will return the empty relation.

    properties
        list
    end
        
    methods
        function self = OrList(varargin)
            self.list = varargin;
        end
    end
end