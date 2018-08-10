<h1>%(`{tl login}%)</h1>

% if(! ~ $"post_arg_logout yes)
%     notices_handler

% if(! check_user) {
<form action="" method="POST">
    <input type="text" name="username" id="user" required="" value="%($"post_arg_username%)">
    <label for="user">%(`{tl username}%) (%(`{tl case_sensitive}%)!)</label>
    
    <input type="password" name="password" id="pass" required="">
    <label for="pass">%(`{tl password}%)</label>
    
    <p><button type="submit" name="s">%(`{tl submit}%)</button></p>
</form>
<p><a href="/forgot">%(`{tl forgot_your_password}%)</a></p>

<br />%(`{tl no_account_yet}%)<br />
<a href="/register" class="btn">%(`{tl register}%)</a>
% }
% if not {
%(`{tl logged_in_as}%) <strong>%($logged_user%)</strong><br />
<form action="" method="POST"><button name="logout" value="yes">%(`{tl logout}%)</button></form>
% }
