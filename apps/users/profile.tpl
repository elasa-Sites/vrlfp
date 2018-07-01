% check_user
% user=`{basename $req_path}
% dir=etc/users/$user

<style>
    form, button, .btn {
        display: inline-block;
        margin-right: 4px;
    }
</style>

<h1>%($user%)</h1>

% if(! ~ $"logged_user '') {
%     if(~ $logged_user $user) {
<a href="/edit" class="btn">Edit profile</a>
<form action="/login" method="POST"><button name="logout" value="yes">Logout</button></form>
%     }
%     if not if(grep -q $user etc/users/$logged_user/date) {
<p>You want to date %($user%).</p>
<form method="POST" action=""><button name="users_decision" value="undate">Undo</button></form>
%     }
%     if not if(grep -q $user etc/users/$logged_user/hookup) {
<p>You want to hook up with %($user%).</p>
<form method="POST" action=""><button name="users_decision" value="unhookup">Undo</button></form>
%     }
%     if not if(grep -q $user etc/users/$logged_user/pass) {
<p>You passed on %($user%).</p>
<form method="POST" action=""><button name="users_decision" value="unpass">Undo</button></form>
%     }
%     if not {
<form method="POST" action=""><button name="users_decision" value="date">Date</button></form>
<form method="POST" action=""><button name="users_decision" value="hookup">Hookup</button></form>
<form method="POST" action=""><button name="users_decision" value="pass">Pass</button></form>
%     }
% }

%{
if(! ~ $"logged_user '' &&
   grep -q $user etc/users/$logged_user/date etc/users/$logged_user/hookup &&
   grep -q $logged_user $dir/date $dir/hookup) {
    if(grep -q $user etc/users/$logged_user/date &&
       grep -q $logged_user $dir/date)
        echo '<p>It''s a match! '$user' wants to date you too.</p>'
    if not if(grep -q $user etc/users/$logged_user/date &&
              grep -q $logged_user $dir/hookup)
        echo '<p>'$user' wants to hook up with you.</p>'
    if not if(grep -q $user etc/users/$logged_user/hookup &&
              grep -q $logged_user $dir/hookup)
        echo '<p>It''s a match! '$user' wants to hook up with you too.</p>'
    if not if(grep -q $user etc/users/$logged_user/hookup &&
              grep -q $logged_user $dir/date)
        echo '<p>'$user' wants to date you.</p>'

    if(test -s $dir/vrc || test -s $dir/discord || test -s $dir/sc || test -s $dir/ig || test -s $dir/pubemail || test -s $dir/phone) {
        echo '<ul>'
        if(test -s $dir/vrc)
            echo '    <li><p>VRChat: <a href="https://vrchat.net/home/search/'`{cat $dir/vrc}^'" target="_blank">'`{cat $dir/vrc}^'</a></p></li>'
        if(test -s $dir/discord)
            echo '    <li><p>Discord: '`{cat $dir/discord}^'</a></p></li>'
        if(test -s $dir/sc)
            echo '    <li><p>Snapchat: <a href="https://www.snapchat.com/add/'`{cat $dir/sc}^'" target="_blank">'`{cat $dir/sc}^'</a></p></li>'
        if(test -s $dir/ig)
            echo '    <li><p>Instagram: <a href="https://www.instagram.com/'`{cat $dir/ig}^'/" target="_blank">'`{cat $dir/ig}^'</a></p></li>'
        if(test -s $dir/pubemail)
            echo '    <li><p>Email: <a href="mailto:'`{cat $dir/pubemail}^'">'`{cat $dir/pubemail}^'</a></p></li>'
        if(test -s $dir/phone)
            echo '    <li><p>Phone: <a href="sms:'`{cat $dir/phone}^'">'`{cat $dir/phone}^'</a></p></li>'
        echo '</ul>'
    }
    if not {
        echo '<p>'$user' hasn''t added any contact info to their profile yet. Check back later!</p>'
    }
}
%}

<div class="polaroids">
% for(i in `{ls $sitedir/img/users/$user}) {
    <img src="/img/users/%($user%)/%(`{basename $i}%)" onclick="window.location='/img/users/%($user%)/%(`{basename $i}%)'" /></a>
% }
</div>

%{
if(test -s $dir/age || test -s $dir/location || test -s $dir/gender ||
   test -s $dir/lookingfor || test -s $dir/status || test -s $dir/type ||
   test -s $dir/sexuality || test -s $dir/role || test -s $dir/kinks ||
   test -s $dir/games || test -s $dir/vr)
    echo '<ul>'
if(test -s $dir/age) {
    echo '    <li><p><strong>Age:</strong>'
    cat $dir/age
    echo '</p></li>'
}
if(test -s $dir/location) {
    echo '    <li><p><strong>Location:</strong>'
    cat $dir/location
    echo '    </p></li>'
}
if(test -s $dir/gender) {
    echo -n '    <li>'
    for(i in `{cat $dir/gender})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/lookingfor) {
    echo -n '    <li>'
    for(i in `{cat $dir/lookingfor})
        echo $i | sed 's/___/ - /g; s/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/status) {
    echo -n '    <li>'
    for(i in `{cat $dir/status})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/type) {
    echo -n '    <li>'
    for(i in `{cat $dir/type})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/sexuality) {
    echo -n '    <li>'
    for(i in `{cat $dir/sexuality})
        echo $i | sed 's/___/ - /g; s/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/role) {
    echo -n '    <li>'
    for(i in `{cat $dir/role})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/kinks) {
    echo -n '    <li>'
    for(i in `{cat $dir/kinks})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/games) {
    echo -n '    <li>'
    for(i in `{cat $dir/games})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/vr) {
    echo -n '    <li>'
    for(i in `{cat $dir/vr})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/age || test -s $dir/location || test -s $dir/gender ||
   test -s $dir/lookingfor || test -s $dir/status || test -s $dir/type ||
   test -s $dir/sexuality || test -s $dir/role || test -s $dir/kinks ||
   test -s $dir/games || test -s $dir/vr)
    echo '</ul>'

if(test -s $dir/bio) {
    echo '<div class="card">'
    echo '<h2 style="margin: 0 0 1.424rem 0">Bio</h2>'
    $formatter < $dir/bio
    echo '</div>'
}
%}
