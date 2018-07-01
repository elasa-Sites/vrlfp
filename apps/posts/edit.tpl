<div>
    <h1>Editing: <a href="%($req_path%)">%($req_path%)</a></h1>
    <br>
    <form action="" method="POST">
        <textarea name="edit_text" id="edit_text" cols="80" rows="43">%{
# FIXME Extra trailing new lines get added to the content somehow, should avoid it.
            if(~ $#post_arg_edit_text 0 && test -f $posts_file)
                cat $posts_file | escape_html
            if not
                echo -n $post_arg_edit_text | escape_html

        %}</textarea>
        <br>
        <input type="submit" name="posts_save" value="Save">
        <input type="submit" name="posts_preview" value="Preview">
        <small>Documents are written using <a href="http://daringfireball.net/projects/markdown/syntax">Markdown syntax</a>.</small>
    </form>
</div>

% if(! ~ $"post_arg_posts_preview '') {
            <h2>Preview:</h2>
            <div id="preview">
%               echo $post_arg_edit_text | $formatter
            </div>
% }
