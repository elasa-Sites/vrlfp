<h1>%(`{tl activate_your_account}%)</h1>

<p>%(`{tl updated_terms}%)</p>

% notices_handler

<form action="/activate" method="POST">
    <input type="text" name="username" id="user" required="" value="%($"post_arg_username%)">
    <label for="user">%(`{tl username}%)</label>

    <input type="password" name="password" id="pass" required="">
    <label for="pass">%(`{tl password}%)</label>

    <br /><br /><input type="checkbox" name="tos" id="tos" value="yes" class="unstyled">
    <label for="tos" style="color: inherit">%(`{tl agree_terms}%)</label>

    <p><button type="submit">%(`{tl submit}%)</button></p>
</form>
