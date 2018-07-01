<nav role="navigation">
    <a href="/"><picture>
        <source media="(min-width: 992px)" srcset="/img/logo-nav.png">
        <source media="(max-width: 991px)" srcset="/img/logo-nav-mobile.png">
        <img src="/img/logo-nav.png" alt="%($siteTitle%)" />
    </picture></a>
    <div class="right">
% check_user
% if(~ $#logged_user 0) {
        <!--<a href="/login" %(`{if(~ $req_path /login) echo 'class="active"'}%)>Login</a>
        <a href="/register" %(`{if(~ $req_path /register) echo 'class="active"'}%)>Register</a>-->
% }
% if not {
        <a href="/random" %(`{if(~ $req_path /user/* || ~ $req_path /random && ! ~ $req_path /user/$logged_user) echo 'class="active"'}%)><i class="mdi mdi-magnify"></i></a><a href="/matches" %(`{if(~ $req_path /matches) echo 'class="active"'}%)><i class="mdi mdi-heart"></i></a><a href="/user/%($logged_user%)" %(`{if(~ $req_path /user/$logged_user || ~ $req_path /edit) echo 'class="active"'}%)><i class="mdi mdi-account-card-details"></i></a>
% }
    </div>
</nav>
<main role="main">
