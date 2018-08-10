<h1>%(`{tl mod_console}%)</h1>

% for(user in `{ls -t etc/users/*/reported | sed 's,etc/users/([a-zA-Z0-9_]*)/reported,\1,'}) {
<p><a href="/user/%($user%)" %(`{if(test -f etc/users/$user/banyes && ~ `{wc -l < etc/users/$user/banyes | awk '{ print ($1 >= 3) }'} 1) echo 'style="color: #ff0000 !important"'}%)>
%($user%)</a>
% if(test -f etc/users/$user/banyes) {
-
%     wc -l < etc/users/$user/banyes
%     tl yes_votes
% }
% if(test -f etc/users/$user/banno) {
-
%     wc -l < etc/users/$user/banno
%     tl no_votes
% }
</p>
% }

<h1>%(`{tl stats}%)</h1>
<ul>
<li><p>%(`{ls etc/users | wc -l}%) %(`{tl active_accounts}%)</p></li>
<li><p>~%(`{ls etc/users/*/lookingfor | wc -l}%) %(`{tl profiles_filled_out}%)</p></li>
<li><p>~%(`{grep '^Man$' etc/users/*/gender | wc -l}%) %(`{tl men}%)</p></li>
<li><p>~%(`{grep '^Woman$' etc/users/*/gender | wc -l}%) %(`{tl women}%)</p></li>
<li><p>%(`{ls etc/banned | wc -l}%) %(`{tl banned_accounts}%)</p></li>
<li><p>%(`{ls etc/unconfirmed | wc -l}%) %(`{tl unconfirmed_emails}%)</p></li>
<li><p>%(`{ls etc/deactivated | wc -l}%) %(`{tl unclaimed_beta_accounts}%)</p></li>
</ul>
