<h1>Matches</h1>

%{
if(check_user) {
    for(user in `{cat etc/users/$logged_user/date})
        if(grep -q $logged_user etc/users/$user/date &&
           test -s etc/users/$user/password)
            echo '<p>✔ It''s a match! <a href="/user/'$user'">'$user'</a> wants to date you too.</p>'
    for(user in `{cat etc/users/$logged_user/hookup})
        if(grep -q $logged_user etc/users/$user/hookup &&
           test -s etc/users/$user/password)
            echo '<p>✔ It''s a match! <a href="/user/'$user'">'$user'</a> wants to hook up with you too.</p>'
    for(user in `{cat etc/users/$logged_user/hookup})
        if(grep -q $logged_user etc/users/$user/date &&
           test -s etc/users/$user/password)
            echo '<p><a href="/user/'$user'">'$user'</a> wants to date you.</p>'
    for(user in `{cat etc/users/$logged_user/date})
        if(grep -q $logged_user etc/users/$user/hookup &&
           test -s etc/users/$user/password)
            echo '<p><a href="/user/'$user'">'$user'</a> wants to hook up with you.</p>'

    if(check_user premium) {
        echo '<h1>They like you!</h1>'
        for(user in `{grep $logged_user etc/users/*/date | sed 's,etc/users/(.*)/date.*,\1,'})
            if(! grep -q $user etc/users/$logged_user/date etc/users/$logged_user/hookup)
                echo '<p><a href="/user/'$user'">'$user'</a> wants to date you.</p>'
        for(user in `{grep $logged_user etc/users/*/hookup | sed 's,etc/users/(.*)/hookup.*,\1,'})
            if(! grep -q $user etc/users/$logged_user/date etc/users/$logged_user/hookup)
                echo '<p><a href="/user/'$user'">'$user'</a> wants to hook up with you.</p>'
    }

    echo '<h1>Future matches?</h1>'
    for(user in `{cat etc/users/$logged_user/date})
        if(! grep -q $logged_user etc/users/$user/date etc/users/$user/hookup &&
           test -s etc/users/$user/password)
            echo '<p>You want to date <a href="/user/'$user'">'$user'</a>.</p>'
    for(user in `{cat etc/users/$logged_user/hookup})
        if(! grep -q $logged_user etc/users/$user/hookup etc/users/$user/date &&
           test -s etc/users/$user/password)
            echo '<p>You want to hook up with <a href="/user/'$user'">'$user'</a>.</p>'

    echo '<h1>Passes</h1>'
    echo '<p><em>It''s not too late to change your mind!</em></p>'
    for(user in `{cat etc/users/$logged_user/pass})
        if(test -s etc/users/$user/password)
            echo '<p>You passed on <a href="/user/'$user'">'$user'</a>.</p>'
    echo '<form method="POST" action=""><button name="clearpasses" value="yes">Clear all passes</button></form>'
}
if not {
    echo '<a href="/login" class="btn">Login</a>'
}
%}
