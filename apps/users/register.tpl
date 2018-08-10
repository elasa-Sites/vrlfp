<h1>%(`{tl register_an_account}%)</h1>

% if(! ~ $"post_arg_logout yes)
%     notices_handler

% if(! check_user) {
    <form action="" method="POST">
        <input type="text" name="users_user" id="user" required="" value="%($"post_arg_users_user%)">
        <label for="user">%(`{tl username}%)</label>
    
        <input type="email" name="users_email" id="email" required="" value="%($"post_arg_users_email%)">
        <label for="email">%(`{tl email}%)</label>

        <input type="date" name="users_dob" id="dob" required="" value="%($"post_arg_users_dob%)" placeholder="%(`{tl yyyymmdd}%)">
        <label for="dob">%(`{tl dob}%)</label>
    
        <input type="password" name="users_pass" id="pass" required="" value="">
        <label for="pass">%(`{tl password}%)</label>
    
        <input type="password" name="users_pass2" id="pass2" required="" value="">
        <label for="pass2">%(`{tl repeat_password}%)</label>

        <br /><br /><input type="checkbox" name="users_tos" id="tos" value="yes" class="unstyled">
        <label for="tos" style="color: inherit">%(`{tl agree_terms}%)</label>
    
        <p><button type="submit" name="users_submit">%(`{tl submit}%)</button></p>
    </form><br />

    <br />%(`{tl already_registered}%)<br />
    <a href="/login" class="btn">%(`{tl login}%)</a>
% }
% if not {
    %(`{tl logged_in_as}%) <strong>%($logged_user%)</strong><br />
    <form action="/login" method="POST"><button name="logout" value="yes">%(`{tl logout}%)</button></form>
% }
