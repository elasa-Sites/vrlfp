% if(check_user) {
<h1>%(`{tl seen_everyone}%)</h1>
<p>%(`{tl seen_everyone_info}%)</p>
<a href="/matches" class="btn">%(`{tl check_matches}%)</a>
% }
% if not {
<a href="/login?redirect=/random" class="btn">%(`{tl login}%)</a>
% }
