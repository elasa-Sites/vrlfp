<h1>%(`{tl reset_your_password}%)</h1>

% notices_handler

<form action="" method="POST">
    <input type="password" name="users_reset_pass" id="pass1">
    <label for="pass1">%(`{tl new_pass}%)</label>

    <input type="password" name="users_reset_pass2" id="pass2">
    <label for="pass2">%(`{tl repeat_new_pass}%)</label>

    <p><button type="submit" name="users_submit_reset" value="yes">%(`{tl submit}%)</button></p><br />
</form>

<p><a href="/login" class="btn">%(`{login}%)</a></p>
