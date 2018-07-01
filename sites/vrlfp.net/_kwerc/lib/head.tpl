<nav role="navigation">
    <a href="/"><picture>
        <source media="(min-width: 992px)" srcset="/img/logo-nav.png">
        <source media="(max-width: 991px)" srcset="/img/logo-nav-mobile.png">
        <img src="/img/logo-nav.png" alt="%($siteTitle%)" />
    </picture></a>
    <div class="right">
% check_user
% if(~ $#logged_user 0) {
        <a href="/login" title="Login" %(`{if(~ $req_path /login) echo 'class="active"'}%)><i class="mdi mdi-login"></i></a><a href="/register" title="Register" %(`{if(~ $req_path /register) echo 'class="active"'}%)><i class="mdi mdi-account-plus"></i></a>
% }
% if not {
        <a href="/random" title="Browse" %(`{if(~ $req_path /user/* || ~ $req_path /random && ! ~ $req_path /user/$logged_user) echo 'class="active"'}%)><i class="mdi mdi-magnify"></i></a><a href="/matches" title="Matches" %(`{if(~ $req_path /matches) echo 'class="active"'}%)><i class="mdi mdi-heart"></i></a><a href="/user/%($logged_user%)" title="Profile" %(`{if(~ $req_path /user/$logged_user || ~ $req_path /edit) echo 'class="active"'}%)><i class="mdi mdi-account-card-details"></i></a>%(`{if(check_user admin || check_user mod) echo '<a href="/admin" title="Admin"><i class="mdi mdi-gavel"></i></a>'}%)
% }
    </div>
</nav>
<main role="main">
