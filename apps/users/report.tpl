<h1>Submit a report</h1>

% notices_handler

<form action="" method="POST">
    <input type="text" name="users_report_user" id="user" required="" value="%(`{basename $req_path}%)">
    <label for="user">Username</label>

    <p><select name="users_report_reason" id="reason" required="">
        <option value="spam">Spam</option>
        <option value="offensive">Offensive</option>
        <option value="underage">Underage</option>
        <option value="illegal">Illegal content/behavior</option>
        <option value="fortnite">Playing Fortnite</option>
        <option value="other">Other</option>
    </select><br />
    <label for="reason">Reason</label></p>

    <textarea name="users_report_details" id="details"></textarea>
    <label for="details">Details</label>

    <input type="email" name="users_report_email" id="email" required="" value="%(`{if(check_user) cat etc/users/$logged_user/email}%)">
    <label for="email">Your email</label>

    <p><button type="submit" name="users_submit_report" value="yes">Submit</button></p>
</form><br />
