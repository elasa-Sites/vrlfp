<h1>%(`{tl forgot_your_password}%)</h1>

% notices_handler

<form action="" method="POST">
    <input type="text" name="users_forgot_user" id="user">
    <label for="user">%(`{tl username}%) (%(`{tl case_sensitive}%)!)</label>

    <input type="text" name="users_forgot_email" id="email">
    <label for="email">%(`{tl account_email}%)</label>

    <p><button type="submit" name="users_submit_forgot" value="yes">%(`{tl submit}%)</button></p><br />
</form>
