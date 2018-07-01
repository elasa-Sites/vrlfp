<h1>Administration console</h1>

% notices_handler

<form action="" method="POST">
    <input type="text" name="admin_delete" id="admin_delete">
    <label for="admin_delete">Username</label>
    <p><button type="submit" name="admin_submit_delete" value="yes">Delete account</button></p>
</form>

<a href="/debug" class="btn">Debug</a>

<h2>Users</h2>
% for(user in etc/users/*) {
<p>
    <a href="/user/%(`{basename $user}%)">%(`{basename $user}%)</a><br />
%{
      for(file in `{ls $user | grep -v password | grep -v session}) {
          echo '<em>'
          basename $file
          echo '</em><br />'
          cat $file
          echo '<br />'
      }
%}
</p>
% }
</ul>
