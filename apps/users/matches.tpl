<h1>Matches</h1>

%{
if(check_user) {
    if(! check_user premium)
        echo '<p><a href="/premium">Get VRLFP Premium</a> to see who likes you before you match.</a></p><br />'

    for(user in `{cat etc/users/$logged_user/date})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/date)
            echo '<p>✔ It''s a match! <a href="/user/'$user'">'$user'</a> wants to date you too.</p>'
    for(user in `{cat etc/users/$logged_user/hookup})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/hookup)
            echo '<p>✔ It''s a match! <a href="/user/'$user'">'$user'</a> wants to hook up with you too.</p>'
    for(user in `{cat etc/users/$logged_user/friend})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/friend)
            echo '<p>✔ It''s a match! <a href="/user/'$user'">'$user'</a> wants to be your homie too.</p>'

    for(user in `{cat etc/users/$logged_user/hookup etc/users/$logged_user/friend})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/date)
            echo '<p><a href="/user/'$user'">'$user'</a> wants to date you.</p>'
    for(user in `{cat etc/users/$logged_user/date etc/users/$logged_user/friend})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/hookup)
            echo '<p><a href="/user/'$user'">'$user'</a> wants to hook up with you.</p>'
    for(user in `{cat etc/users/$logged_user/date etc/users/$logged_user/hookup})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/friend)
            echo '<p><a href="/user/'$user'">'$user'</a> wants to be your homie.</p>'

    if(check_user premium) {
        echo '<h1>They like you!</h1>'
        for(user in `{grep '^'$logged_user^'$' etc/users/*/date | sed 's,etc/users/(.*)/date.*,\1,'})
            if(! grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/hookup etc/users/$logged_user/friend) {
                if(grep -q '^'$user^'$' etc/users/$logged_user/pass)
                    echo '<p><del><a href="/user/'$user'">'$user'</a> wants to date you.</del> <strong>PASSED</strong></p>'
                if not
                    echo '<p><a href="/user/'$user'">'$user'</a> wants to date you.</p>'
            }
        for(user in `{grep '^'$logged_user^'$' etc/users/*/hookup | sed 's,etc/users/(.*)/hookup.*,\1,'})
            if(! grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/hookup etc/users/$logged_user/friend) {
                if(grep -q '^'$user^'$' etc/users/$logged_user/pass)
                    echo '<p><del><a href="/user/'$user'">'$user'</a> wants to hook up with you.</del> <strong>PASSED</strong></p>'
                if not
                    echo '<p><a href="/user/'$user'">'$user'</a> wants to hook up with you.</p>'
            }
        for(user in `{grep '^'$logged_user^'$' etc/users/*/friend | sed 's,etc/users/(.*)/friend.*,\1,'})
            if(! grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/hookup etc/users/$logged_user/friend) {
                if(grep -q '^'$user^'$' etc/users/$logged_user/pass)
                    echo '<p><del><a href="/user/'$user'">'$user'</a> wants to be your homie.</del> <strong>PASSED</strong></p>'
                if not
                    echo '<p><a href="/user/'$user'">'$user'</a> wants to be your homie.</p>'
            }
    }

    echo '<h1>Future matches?</h1>'
    for(user in `{cat etc/users/$logged_user/date})
        if(test -s etc/users/$user/password &&
           ! grep -q '^'$logged_user^'$' etc/users/$user/date etc/users/$user/hookup etc/users/$user/friend)
            echo '<p>You want to date <a href="/user/'$user'">'$user'</a>.</p>'
    for(user in `{cat etc/users/$logged_user/hookup})
        if(test -s etc/users/$user/password &&
           ! grep -q '^'$logged_user^'$' etc/users/$user/hookup etc/users/$user/date etc/users/$user/friend)
            echo '<p>You want to hook up with <a href="/user/'$user'">'$user'</a>.</p>'
    for(user in `{cat etc/users/$logged_user/friend})
        if(test -s etc/users/$user/password &&
           ! grep -q '^'$logged_user^'$' etc/users/$user/friend etc/users/$user/date etc/users/$user/hookup)
            echo '<p>You want to be friends with <a href="/user/'$user'">'$user'</a>.</p>'

    echo '<h1>Passes</h1>'
    echo '<p><em>It''s not too late to change your mind!</em></p>'
    for(user in `{cat etc/users/$logged_user/pass})
        if(test -s etc/users/$user/password)
            echo '<p>You passed on <a href="/user/'$user'">'$user'</a>.</p>'
    echo '<form action="" method="POST"><button name="clearpasses" value="yes">Clear all passes</button></form>'
}
if not {
    echo '<a href="/login?redirect=/matches" class="btn">Login</a>'
}
%}
