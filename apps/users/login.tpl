<h1>Log in</h1>

% if(! ~ $"post_arg_logout yes)
%     notices_handler

% if(! check_user) {
    <form action="/login" method="POST">
        <input type="text" name="username" id="user" required="" value="%($"post_arg_username%)">
        <label for="user">Username</label>
    
        <input type="password" name="password" id="pass" required="">
        <label for="pass">Password</label>
    
        <p><button type="submit" name="s">Submit</button></p>
    </form>

    <br />Don't have an account yet?<br />
    <a href="/register" class="btn">Register</a>
% }
% if not {
    You are logged in as: <strong>%($logged_user%)</strong><br />
    <form action="/login" method="POST"><button name="logout" value="yes">Logout</button></form>
% }