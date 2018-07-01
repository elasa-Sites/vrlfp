<h1>Register an account</h1>

% if(! ~ $"post_arg_logout yes)
%     notices_handler

% if(! check_user) {
    <form action="" method="POST">
        <input type="text" name="users_user" id="user" required="" value="%($"post_arg_users_user%)">
        <label for="user">Username</label>
    
        <input type="email" name="users_email" id="email" required="" value="%($"post_arg_users_email%)">
        <label for="email">E-mail</label>
    
        <input type="password" name="users_pass" id="pass" required="" value="">
        <label for="pass">Password</label>
    
        <input type="password" name="users_pass2" id="pass2" required="" value="">
        <label for="pass2">Repeat password</label>

        <br /><br /><input type="checkbox" name="users_tos" id="tos" value="yes" class="unstyled">
        <label for="tos" style="color: inherit">I am at least 18 years of age and I agree to the <a href="/terms">Terms of Service</a></label>
    
        <p><button type="submit" name="users_submit">Submit</button></p>
    </form><br />

    <br />Already have an account?<br />
    <a href="/login" class="btn">Login</a>
% }
% if not {
    You are logged in as: <strong>%($logged_user%)</strong><br />
    <form action="/login" method="POST"><button name="logout" value="yes">Logout</button></form>
% }
