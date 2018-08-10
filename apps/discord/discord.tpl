<h1>%(`{tl authorize_discord}%)</h1>

% notices_handler

% if(! check_user) {
<p>%(`{tl discord_info}%)</p>

<a href="/login?redirect=%($req_path%)" class="btn">%(`{tl login}%)</a>

<br />%(`{tl no_account_yet}%)<br />
<a href="/register" class="btn">%(`{tl register}%)</a>
% }
