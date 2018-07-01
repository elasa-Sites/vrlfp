% tpl_handler `{ get_lib_file head.tpl }
% run_handlers $handlers_body_head
% run_handler $handler_body_main
% run_handlers $handlers_body_foot
% tpl_handler `{ get_lib_file foot.tpl }

% for(i in $sitedir/_kwerc/js/*.min.js)
%     echo '<script src="/_kwerc/js/'`{basename $i}^'" type="text/javascript"></script>'
