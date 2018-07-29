<h1>Activate your account</h1>

<p>We have updated our <a href="/terms">Terms of Service</a> and <a href="/privacy">Privacy Policy</a>. Please review these documents and complete the following form if you agree with the changes. Otherwise, you can <a href="mailto:support@vrlfp.net">contact us</a> to have your account permanently deleted.</p>

% notices_handler

<form action="/activate" method="POST">
    <input type="text" name="username" id="user" required="" value="%($"post_arg_username%)">
    <label for="user">Username</label>

    <input type="password" name="password" id="pass" required="">
    <label for="pass">Password</label>

    <br /><br /><input type="checkbox" name="tos" id="tos" value="yes" class="unstyled">
    <label for="tos" style="color: inherit">I am at least 18 years of age and I agree to the <a href="/terms">Terms of Service</a> and the <a href="/privacy">Privacy Policy</a>.</label>

    <p><button type="submit">Submit</button></p>
</form>
