classdef Not
    % The Not operator produces the negation of a condition in relational restrictions.
    % Thus rel & dj.Not(cond) is equivalent to rel - cond.
    % dj.Not becomes useful when used in lists such as dj.OrList and dj.AndList.
    
    properties
        condition
    end
    
    methods
        function self = Not(condition)
            self.condition = condition;
        end
    end
end