<style>
    .notify_errors {
        display: none;
    }
</style>

<h1>%(`{basename $req_path}%)</h1>
% notices_handler
<p>Please check your email for a confirmation link to activate your account. Please check your spam folder and wait 15 minutes before resending (resending within 15 minutes may cause your host to hold our mail longer).</p>
<p><form action="" method="POST"><button name="users_resend" value="yes">Resend confirmation</button></form></p>
