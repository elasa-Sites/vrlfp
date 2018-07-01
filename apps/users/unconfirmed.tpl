<style>
    .notify_errors {
        display: none;
    }
</style>

<h1>%(`{basename $req_path}%)</h1>
% notices_handler
<p>Please check your email for a confirmation link to activate your account.</p>
<p><form method="POST" action=""><button name="users_resend" value="yes">Resend confirmation</button></form></p>
