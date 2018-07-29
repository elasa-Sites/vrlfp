<h1>Moderation console</h1>

% for(user in `{ls -t etc/users/*/reported | sed 's,etc/users/([a-zA-Z0-9_]*)/reported,\1,'}) {
<p><a href="/user/%($user%)" %(`{if(test -f etc/users/$user/banyes && ~ `{wc -l < etc/users/$user/banyes | awk '{ print ($1 >= 3) }'} 1) echo 'style="color: #ff0000 !important"'}%)>
%($user%)</a>
% if(test -f etc/users/$user/banyes) {
-
% wc -l < etc/users/$user/banyes
yes votes
% }
% if(test -f etc/users/$user/banno) {
-
%     wc -l < etc/users/$user/banno
no votes
% }
</p>
% }

<h1>Stats</h1>
<ul>
<li><p>%(`{ls etc/users | wc -l}%) active accounts</p></li>
<li><p>~%(`{ls etc/users/*/lookingfor | wc -l}%) profiles filled out</p></li>
<li><p>~%(`{grep '^Man$' etc/users/*/gender | wc -l}%) men</p></li>
<li><p>~%(`{grep '^Woman$' etc/users/*/gender | wc -l}%) women</p></li>
<li><p>%(`{ls etc/banned | wc -l}%) banned accounts (including blacklisted names)</p></li>
<li><p>%(`{ls etc/unconfirmed | wc -l}%) unconfirmed emails</p></li>
<li><p>%(`{ls etc/deactivated | wc -l}%) unclaimed beta accounts</p></li>
</ul>
