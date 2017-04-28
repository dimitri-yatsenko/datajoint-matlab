classdef Jobs < dj.Relvar
    
    methods(Static)
        function createJobTable(package)
            % Create the Jobs class if it does not yet exist in the given package.
            
            schemaPath = which([package '.getSchema']);
            assert(~isempty(schemaPath), 'missing function %s.getSchema', self.schema.package)
            path = fullfile(fileparts(schemaPath), 'Jobs.m');
            f = fopen(path,'w');
            fprintf(f, '%%{\n');
            fprintf(f, '# the job reservation table for +%s\n', self.schema.package);
            fprintf(f, 'table_name : varchar(255) # className of the table\n');
            fprintf(f, 'key_hash   : char(32)     # key hash\n');
            fprintf(f, '-----\n');
            fprintf(f, 'status    : enum("reserved","error","ignore") # if tuple is missing, the job is available\n');
            fprintf(f, 'key=null           : blob                     # structure containing the key\n');
            fprintf(f, 'error_message=""   : varchar(1023)            # error message returned if failed\n');
            fprintf(f, 'error_stack=null   : blob                     # error stack if failed\n');
            fprintf(f, 'host=""            : varchar(255)             # system hostname\n');
            fprintf(f, 'pid=0              : int unsigned             # system process id\n');
            fprintf(f, 'connection_id = 0  : bigint unsigned          # connection_id()\n');
            fprintf(f, 'timestamp=CURRENT_TIMESTAMP : timestamp       # automatic timestamp\n');
            fprintf(f, '%%}\n\n');
            fprintf(f, 'classdef Jobs < dj.Jobs\n');
            fprintf(f, 'end\n');
            fclose(f);
        end
        
    end
    
end
