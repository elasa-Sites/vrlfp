<h1>Administration console</h1>

% notices_handler

<form name="prompt" method="POST">
<input type="text" name="command" value="%($"post_arg_command%)">
<p><button type="submit">Run</button></p>
</form>

%{
fn evl {
    # Buffering is probably messing this up:
    #rc -c 'flag x +;{'^$post_arg_command'} |[2] awk ''{print ">> "$0}'''
    rc -c 'flag s +; flag x +;'^$post_arg_command
}
    if(! ~ $#post_arg_command 0 && ! ~ $#post_arg_command '') {
        echo '<hr><pre>'
        evl | escape_html |[2] awk '{print "<b>"$0"</b>"}' 
        echo '</pre>'
    }
%}

<h2>Debug</h2>

<hr><pre>
% env | escape_html
</pre><hr>

% umask
