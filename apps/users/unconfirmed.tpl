<style>
    .notify_errors {
        display: none;
    }
</style>

<h1>%(`{basename $req_path}%)</h1>
% notices_handler
<p>Please check your email for a confirmation link to activate your account. Please check your spam folder and wait 5 minutes before resending (resending within 5 minutes may cause your host to hold our mail longer).</p>
<p><form method="POST" action=""><button name="users_resend" value="yes">Resend confirmation</button></form></p>
