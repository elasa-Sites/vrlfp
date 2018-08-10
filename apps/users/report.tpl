<h1>%(`{tl submit_a_report}%)</h1>

% notices_handler

<form action="" method="POST">
    <input type="text" name="users_report_user" id="user" required="" value="%(`{basename $req_path}%)">
    <label for="user">%(`{tl username}%)</label>

    <p><select name="users_report_reason" id="reason" required="">
        <option value="spam">%(`{tl spam}%)</option>
        <option value="offensive">%(`{tl offensive}%)</option>
        <option value="underage">%(`{tl underage}%)</option>
        <option value="illegal">%(`{tl illegal}%)</option>
        <option value="other">%(`{tl other}%)</option>
    </select><br />
    <label for="reason">%(`{tl reason}%)</label></p>

    <textarea name="users_report_details" id="details"></textarea>
    <label for="details">%(`{tl details}%)</label>

    <input type="email" name="users_report_email" id="email" required="" value="%(`{if(check_user) cat etc/users/$logged_user/email}%)">
    <label for="email">%(`{tl your_email}%)</label>

    <p><button type="submit" name="users_submit_report" value="yes">%(`{tl submit}%)</button></p>
</form><br />
