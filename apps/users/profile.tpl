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
%         if(! test -s $dir/gender || ! test -s $dir/lookingfor || ! test -s $dir/sexuality) {
<p class="notify_errors">✘ You must fill out your gender, sexuality, and the type of relationship you're looking for before your profile will be shown to other users on the site!</p>
%         }
<a href="/edit" class="btn">Edit profile</a>
<a href="/settings" class="btn">Settings</a>
<form action="/login" method="POST"><button name="logout" value="yes">Logout</button></form>
%     }
%     if not if(grep -q '^'$user^'$' etc/users/$logged_user/date) {
<p>You want to date %($user%).</p>
<form action="" method="POST"><button name="users_decision" value="undate">Undo</button></form>
%     }
%     if not if(grep -q '^'$user^'$' etc/users/$logged_user/hookup) {
<p>You want to hook up with %($user%).</p>
<form action="" method="POST"><button name="users_decision" value="unhookup">Undo</button></form>
%     }
%     if not if(grep -q '^'$user^'$' etc/users/$logged_user/friend) {
<p>You want to be homies with %($user%).</p>
<form action="" method="POST"><button name="users_decision" value="unfriend">Undo</button></form>
%     }
%     if not if(grep -q '^'$user^'$' etc/users/$logged_user/pass) {
<p>You passed on %($user%).</p>
<form action="" method="POST"><button name="users_decision" value="unpass">Undo</button></form>
%     }
%     if not {
<form action="" method="POST">
    <button name="users_decision" value="date">Date</button>
    <button name="users_decision" value="hookup">Hookup</button>
    <button name="users_decision" value="friend">Homie</button>
    <button name="users_decision" value="pass">Pass</button>
</form>
%     }
% }
% if not {
<a href="/login?redirect=%($req_path%)" class="btn">Login</a>
% }

% if(! ~ $"logged_user `{basename $req_path}) {
<p><a href="/report/%(`{basename $req_path}%)" class="btn">Report</a></p>
% }

% if(check_user mod) {
<p>
<form action="" method="POST"><button name="users_banyes" value="yes">Vote to ban</button></form>
<form action="" method="POST"><button name="users_banno" value="yes">Vote against ban</button></form>
</p>
% if(test -f $dir/banyes) {
<p>Votes for:
%     for(mod in `{cat $dir/banyes})
%         echo $mod', '
</p>
% }
% if(test -f $dir/banno) {
<p>Votes against:
%     for(mod in `{cat $dir/banno})
%         echo $mod', '
</p>
% }
% }

% if(check_user headmod) {
<form action="" method="POST">
    <p>
        <input type="text" name="users_ban_reason" id="reason">
        <label for="reason">Ban reason (emailed to user)</label>
    </p>
    <p><button name="users_submit_ban" value="yes">Ban</button></p><br />
</form>
% }
% if not if(check_user mod &&
%    ~ `{wc -l < $dir/banyes | awk '{ print ($1 >= 3) }'} 1 &&
%    ! ~ `{wc -l < $dir/banno | awk '{ print ($1 >= 1) }'} 1) {
<form action="" method="POST">
    <p>
        <input type="text" name="users_ban_reason" id="reason">
        <label for="reason">Ban reason (emailed to user)</label>
    </p>
    <p><button name="users_submit_ban" value="yes">Ban</button></p><br />
</form>
% }

%{
if(! ~ $"logged_user '' &&
   grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/hookup etc/users/$logged_user/friend &&
   grep -q '^'$logged_user^'$' $dir/date $dir/hookup $dir/friend) {
    if(grep -q '^'$user^'$' etc/users/$logged_user/date &&
       grep -q '^'$logged_user^'$' $dir/date)
        echo '<p>It''s a match! '$user' wants to date you too.</p>'
    if not if(grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/friend &&
              grep -q '^'$logged_user^'$' $dir/hookup)
        echo '<p>'$user' wants to hook up with you.</p>'
    if not if(grep -q '^'$user^'$' etc/users/$logged_user/hookup &&
              grep -q '^'$logged_user^'$' $dir/hookup)
        echo '<p>It''s a match! '$user' wants to hook up with you too.</p>'
    if not if(grep -q '^'$user^'$' etc/users/$logged_user/hookup etc/users/$logged_user/friend &&
              grep -q '^'$logged_user^'$' $dir/date)
        echo '<p>'$user' wants to date you.</p>'
    if not if(grep -q '^'$user^'$' etc/users/$logged_user/friend &&
              grep -q '^'$logged_user^'$' $dir/friend)
        echo '<p>It''s a match! '$user' wants to be your homie too.</p>'
    if not if(grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/hookup &&
              grep -q '^'$logged_user^'$' $dir/friend)
        echo '<p>'$user' wants to be your homie.</p>'

    if(test -s $dir/vrc || test -s $dir/discord || test -s $dir/sc || test -s $dir/ig || test -s $dir/pubemail || test -s $dir/phone) {
        echo '<ul>'
        if(test -s $dir/vrc) {
            echo -n '    <li><p>VRChat: <a href="https://vrchat.net/home/search/'
            escape_html < $dir/vrc
            echo -n '" target="_blank">'
            escape_html < $dir/vrc
            echo '</a></p></li>'
        }
        if(test -s $dir/discord) {
            echo -n '    <li><p>Discord: '
            escape_html < $dir/discord
            echo '</a></p></li>'
        }
        if(test -s $dir/sc) {
            echo -n '    <li><p>Snapchat: <a href="https://www.snapchat.com/add/'
            escape_html < $dir/sc
            echo -n '" target="_blank">'
            escape_html < $dir/sc
            echo '</a></p></li>'
        }
        if(test -s $dir/ig) {
            echo -n '    <li><p>Instagram: <a href="https://www.instagram.com/'
            escape_html < $dir/ig
            echo -n '/" target="_blank">'
            escape_html < $dir/ig
            echo '</a></p></li>'
        }
        if(test -s $dir/pubemail) {
            echo -n '    <li><p>Email: <a href="mailto:'
            escape_html < $dir/pubemail
            echo -n '">'
            escape_html < $dir/pubemail
            echo '</a></p></li>'
        }
        if(test -s $dir/phone) {
            echo -n '    <li><p>Phone: <a href="sms:'
            escape_html < $dir/phone
            echo -n '">'
            escape_html < $dir/phone
            echo '</a></p></li>'
        }
        echo '</ul>'
    }
    if not {
        echo '<p>'$user' hasn''t added any contact info to their profile yet. Check back later!</p>'
    }
}
%}

% if(check_user && ! check_user premium) {
<div class="mobile center"><iframe src="//ads.exosrv.com/iframe.php?idzone=3074076&size=300x100" width="300" height="100" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe></div>
% }

<div class="polaroids">
% if(test -f $dir/premium) {
%     for(i in `{ls -p $sitedir/img/users/$user | sort -n}) {
%         if(test -f $sitedir/img/users/thumbs/$user/$i) {
    <img src="/img/users/thumbs/%($user%)/%($i%)" onclick="window.location='#img%($i%)'" />
%         }
%         if not {
    <img src="/img/users/%($user%)/%($i%)" onclick="window.location='#img%($i%)'" />
%         }
%     }
%     for(i in `{ls -p $sitedir/img/users/nsfw/$user | sort -n}) {
%         if(test -f etc/users/$"logged_user/nsfw) {
%             if(test -f $sitedir/img/users/nsfw/thumbs/$user/$i) {
    <img src="/img/users/nsfw/thumbs/%($user%)/%($i%)" onclick="window.location='#nsfw%($i%)'" class="nsfw" />
%             }
%             if not {
    <img src="/img/users/nsfw/%($user%)/%($i%)" onclick="window.location='#nsfw%($i%)'" class="nsfw" />
%             }
%         }
%         if not {
    <img src="/img/nsfw.png" onclick="window.location='/settings'" />
%         }
%     }
% }
% if not {
%     for(i in `{ls -p $sitedir/img/users/$user | sort -n | sed 4q}) {
%         if(test -f $sitedir/img/users/thumbs/$user/$i) {
    <img src="/img/users/thumbs/%($user%)/%($i%)" onclick="window.location='#img%($i%)'" />
%         }
%         if not {
    <img src="/img/users/%($user%)/%($i%)" onclick="window.location='#img%($i%)'" />
%         }
%     }
%     for(i in `{ls -p $sitedir/img/users/nsfw/$user | sort -n | sed q}) {
%         if(test -f etc/users/$"logged_user/nsfw) {
%             if(test -f $sitedir/img/users/nsfw/thumbs/$user/$i) {
    <img src="/img/users/nsfw/thumbs/%($user%)/%($i%)" onclick="window.location='#nsfw%($i%)'" class="nsfw" />
%             }
%             if not {
    <img src="/img/users/nsfw/%($user%)/%($i%)" onclick="window.location='#nsfw%($i%)'" class="nsfw" />
%             }
%         }
%         if not {
    <img src="/img/nsfw.png" onclick="window.location='/settings'" />
%         }
%     }
% }
</div>
<div class="lightbox">
% if(test -f $dir/premium) {
%     for(i in `{ls -p $sitedir/img/users/$user | sort -n}) {
    <a href="#_" id="img%($i%)"><img src="/img/users/%($user%)/%($i%)" /></a>
%     }
%     if(test -f etc/users/$"logged_user/nsfw) {
%         for(i in `{ls -p $sitedir/img/users/nsfw/$user | sort -n}) {
    <a href="#_" id="nsfw%($i%)"><img src="/img/users/nsfw/%($user%)/%($i%)" /></a>
%         }
%     }
% }
% if not {
%     for(i in `{ls -p $sitedir/img/users/$user | sort -n | sed 4q}) {
    <a href="#_" id="img%($i%)"><img src="/img/users/%($user%)/%($i%)" /></a>
%     }
%     if(test -f etc/users/$"logged_user/nsfw) {
%         for(i in `{ls -p $sitedir/img/users/nsfw/$user | sort -n | sed q}) {
    <a href="#_" id="nsfw%($i%)"><img src="/img/users/nsfw/%($user%)/%($i%)" /></a>
%         }
%     }
% }
</div>

% if(test -f $dir/premium && test -s $dir/sketchfab) {
<iframe width="100%" height="480" src="https://sketchfab.com/models/%(`{cat $dir/sketchfab}%)/embed" frameborder="0" allowvr allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" onmousewheel="" class="card" style="padding: 0"></iframe>
% }

%{
if(test -s $dir/age || test -s $dir/location || test -s $dir/gender ||
   test -s $dir/mute || test -s $dir/lookingfor || test -s $dir/status ||
   test -s $dir/type || test -s $dir/sexuality || test -s $dir/role ||
   test -s $dir/kinks || test -s $dir/games || test -s $dir/vr)
    echo '<ul>'
if(test -s $dir/dob) {
    echo '    <li><p><strong>Age:</strong>'
    echo `{sed 's,-,,g' < $dir/dob} `{yyyymmdd `{date -u | sed 's/  / 0/'}} | awk '{ print (int(($2 - $1) / 10000)) }'
    echo '    </p></li>'
}
if not if(test -s $dir/age) {
    echo '    <li><p><strong>Age:</strong>'
    escape_html < $dir/age
    echo '</p></li>'
}
if(test -s $dir/location) {
    echo '    <li><p><strong>Location:</strong>'
    escape_html < $dir/location
    echo '    </p></li>'
}
if(test -s $dir/gender) {
    echo -n '    <li>'
    for(i in `{escape_html < $dir/gender})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/mute) {
    echo -n '    <li>'
    for(i in `{escape_html < $dir/mute})
        echo $i | sed 's/___/ - /g; s/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/lookingfor) {
    echo -n '    <li>'
    for(i in `{escape_html < $dir/lookingfor})
        echo $i | sed 's/___/ - /g; s/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/status) {
    echo -n '    <li>'
    for(i in `{escape_html < $dir/status})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/type) {
    echo -n '    <li>'
    for(i in `{escape_html < $dir/type})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/sexuality) {
    echo -n '    <li>'
    for(i in `{escape_html < $dir/sexuality})
        echo $i | sed 's/___/ - /g; s/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/role) {
    echo -n '    <li>'
    for(i in `{escape_html < $dir/role})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/kinks) {
    echo -n '    <li>'
    for(i in `{escape_html < $dir/kinks})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/games) {
    echo -n '    <li>'
    for(i in `{escape_html < $dir/games})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/vr) {
    echo -n '    <li>'
    for(i in `{escape_html < $dir/vr})
        echo $i | sed 's/_/ /g; s/^/<span>/; s/$/<\/span>/'
    echo '    </li>'
}
if(test -s $dir/age || test -s $dir/location || test -s $dir/gender ||
   test -s $dir/lookingfor || test -s $dir/status || test -s $dir/type ||
   test -s $dir/sexuality || test -s $dir/role || test -s $dir/kinks ||
   test -s $dir/games || test -s $dir/vr)
    echo '</ul>'

if(test -s $dir/bio) {
    echo '<div id="bio" class="card">'
    echo '<h2 style="margin: 0 0 1.424rem 0">Bio</h2>'
    if(test -f $dir/premium)
        $formatter < $dir/bio | tidy --show-body-only yes >[2]/dev/null
    if not
        escape_html < $dir/bio | sed 's//<br \/>/g'
    echo '</div>'
}

if(test -s $dir/spotify) {
    # echo '<iframe src="'`{escape_html < $dir/spotify}^'" width="100%" height="480" frameborder="0" allowtransparency="true" allow="encrypted-media" class="card" style="padding: 0"></iframe>'
}
%}
