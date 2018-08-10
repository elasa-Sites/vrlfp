<style>
    .notify_errors {
        display: none;
    }
</style>

<h1>%(`{basename $req_path}%)</h1>
% notices_handler
<p>%(`{tl confirm_info}%)</p>
<p><form action="" method="POST"><button name="users_resend" value="yes">%(`{tl resend_confirmation}%)</button></form></p>
