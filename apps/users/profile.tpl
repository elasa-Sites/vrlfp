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
<p class="notify_errors">✘ %(`{tl profile_incomplete}%)</p>
%         }
<a href="/edit" class="btn">%(`{tl edit_profile}%)</a>
<a href="/settings" class="btn">%(`{tl settings}%)</a>
<form action="/login" method="POST"><button name="logout" value="yes">%(`{tl logout}%)</button></form>
%     }
%     if not if(grep -q '^'$user^'$' etc/users/$logged_user/date) {
<p>%(`{tl you_want_date}%) %($user%).</p>
<form action="" method="POST"><button name="users_decision" value="undate">%(`{tl undo}%)</button></form>
%     }
%     if not if(grep -q '^'$user^'$' etc/users/$logged_user/hookup) {
<p>%(`{tl you_want_hookup}%) %($user%).</p>
<form action="" method="POST"><button name="users_decision" value="unhookup">%(`{tl undo}%)</button></form>
%     }
%     if not if(grep -q '^'$user^'$' etc/users/$logged_user/friend) {
<p>%(`{tl you_want_homie}%) %($user%).</p>
<form action="" method="POST"><button name="users_decision" value="unfriend">%(`{tl undo}%)</button></form>
%     }
%     if not if(grep -q '^'$user^'$' etc/users/$logged_user/pass) {
<p>%(`{tl you_passed}%) %($user%).</p>
<form action="" method="POST"><button name="users_decision" value="unpass">%(`{tl undo}%)</button></form>
%     }
%     if not {
<form action="" method="POST">
    <button name="users_decision" value="date">%(`{tl date}%)</button>
    <button name="users_decision" value="hookup">%(`{tl hookup}%)</button>
    <button name="users_decision" value="friend">%(`{tl homie}%)</button>
    <button name="users_decision" value="pass">%(`{tl pass}%)</button>
</form>
%     }
% }
% if not {
<a href="/login?redirect=%($req_path%)" class="btn">%(`{tl login}%)</a>
% }

% if(! ~ $"logged_user `{basename $req_path}) {
<p><a href="/report/%(`{basename $req_path}%)" class="btn">%(`{tl report}%)</a></p>
% }

% if(check_user mod) {
<p>
<form action="" method="POST"><button name="users_banyes" value="yes">%(`{tl vote_yes}%)</button></form>
<form action="" method="POST"><button name="users_banno" value="yes">%(`{tl vote_no}%)</button></form>
</p>
% if(test -f $dir/banyes) {
<p>%(`{tl votes_for}%):
%     for(mod in `{cat $dir/banyes})
%         echo $mod', '
</p>
% }
% if(test -f $dir/banno) {
<p>%(`{tl votes_against}%):
%     for(mod in `{cat $dir/banno})
%         echo $mod', '
</p>
% }
% }

% if(check_user headmod) {
<form action="" method="POST">
    <p>
        <input type="text" name="users_ban_reason" id="reason">
        <label for="reason">%(`{tl reason_mailed}%)</label>
    </p>
    <p><button name="users_submit_ban" value="yes">%(`{tl ban}%)</button></p><br />
</form>
% }
% if not if(check_user mod &&
%    ~ `{wc -l < $dir/banyes | awk '{ print ($1 >= 3) }'} 1 &&
%    ! ~ `{wc -l < $dir/banno | awk '{ print ($1 >= 1) }'} 1) {
<form action="" method="POST">
    <p>
        <input type="text" name="users_ban_reason" id="reason">
        <label for="reason">%(`{tl reason_mailed}%)</label>
    </p>
    <p><button name="users_submit_ban" value="yes">%(`{tl ban}%)</button></p><br />
</form>
% }

%{
if(! ~ $"logged_user '' &&
   grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/hookup etc/users/$logged_user/friend &&
   grep -q '^'$logged_user^'$' $dir/date $dir/hookup $dir/friend) {
    if(grep -q '^'$user^'$' etc/users/$logged_user/date &&
       grep -q '^'$logged_user^'$' $dir/date) {
        echo -n '<p>'
        tl its_a_match
        echo -n ' '$user' '
        tl wants_date_too
        echo '</p>'
    }
    if not if(grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/friend &&
              grep -q '^'$logged_user^'$' $dir/hookup) {
        echo -n '<p>'$user' '
        tl wants_hookup
        echo '</p>'
    }
    if not if(grep -q '^'$user^'$' etc/users/$logged_user/hookup &&
              grep -q '^'$logged_user^'$' $dir/hookup) {
        echo -n '<p>'
        tl its_a_match
        echo -n ' '$user' '
        tl wants_hookup_too
        echo '</p>'
    }
    if not if(grep -q '^'$user^'$' etc/users/$logged_user/hookup etc/users/$logged_user/friend &&
              grep -q '^'$logged_user^'$' $dir/date) {
        echo -n '<p>'$user' '
        tl wants_date
        echo '</p>'
    }
    if not if(grep -q '^'$user^'$' etc/users/$logged_user/friend &&
              grep -q '^'$logged_user^'$' $dir/friend) {
        echo -n '<p>'
        tl its_a_match
        echo -n ' '$user' '
        tl wants_homie_too
        echo '</p>'
    }
    if not if(grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/hookup &&
              grep -q '^'$logged_user^'$' $dir/friend) {
        echo -n '<p>'$user' '
        tl wants_homie
        echo '</p>'
    }

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
            echo -n '    <li><p>'
            tl email
            echo -n ': <a href="mailto:'
            escape_html < $dir/pubemail
            echo -n '">'
            escape_html < $dir/pubemail
            echo '</a></p></li>'
        }
        if(test -s $dir/phone) {
            echo -n '    <li><p>'
            tl phone
            echo -n ': <a href="sms:'
            escape_html < $dir/phone
            echo -n '">'
            escape_html < $dir/phone
            echo '</a></p></li>'
        }
        echo '</ul>'
    }
    if not {
        echo -n '<p>'$user' '
        tl no_contact
        echo '</p>'
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
    echo -n '    <li><p><strong>'
    tl age
    echo -n ':</strong> '
    echo -n `{sed 's,-,,g' < $dir/dob} `{yyyymmdd `{date -u | sed 's/  / 0/'}} | awk '{ print (int(($2 - $1) / 10000)) }'
    echo '    </p></li>'
}
if not if(test -s $dir/age) {
    echo -n '    <li><p><strong>'
    tl age
    echo -n ':</strong> '
    escape_html < $dir/age
    echo '</p></li>'
}
if(test -s $dir/location) {
    echo -n '    <li><p><strong>'
    tl location
    echo -n ':</strong> '
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
    echo '<h2 style="margin: 0 0 1.424rem 0">'`{tl bio}^'</h2>'
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
