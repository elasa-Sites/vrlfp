<h1>%(`{tl matches}%)</h1>

%{
if(check_user) {
    if(! check_user premium) {
        echo -n '<p>'
        tl premium_matches
        echo '</p><br />'
    }

    for(user in `{cat etc/users/$logged_user/date})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/date) {
            echo -n '<p>✔ '
            tl its_a_match
            echo -in ' <a href="/user/'$user'">'$user'</a> '
            tl wants_date_too
            echo '</p>'
        }
    for(user in `{cat etc/users/$logged_user/hookup})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/hookup) {
            echo -n '<p>✔ '
            tl its_a_match
            echo -n ' <a href="/user/'$user'">'$user'</a> '
            tl wants_hookup_too
            echo '</p>'
        }
    for(user in `{cat etc/users/$logged_user/friend})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/friend) {
            echo -n '<p>✔ '
            tl its_a_match
            echo -n ' <a href="/user/'$user'">'$user'</a> '
            tl wants_homie_too
            echo '</p>'
        }

    for(user in `{cat etc/users/$logged_user/hookup etc/users/$logged_user/friend})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/date) {
            echo -n '<p><a href="/user/'$user'">'$user'</a> '
            tl wants_date
            echo '</p>'
        }
    for(user in `{cat etc/users/$logged_user/date etc/users/$logged_user/friend})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/hookup) {
            echo -n '<p><a href="/user/'$user'">'$user'</a> '
            tl wants_hookup
            echo '</p>'
        }
    for(user in `{cat etc/users/$logged_user/date etc/users/$logged_user/hookup})
        if(test -s etc/users/$user/password &&
           grep -q '^'$logged_user^'$' etc/users/$user/friend) {
            echo -n '<p><a href="/user/'$user'">'$user'</a> '
            tl wants_homie
            echo '</p>'
        }

    if(check_user premium) {
        echo -n '<h1>'
        tl they_like_you
        echo '</h1>'
        for(user in `{grep '^'$logged_user^'$' etc/users/*/date | sed 's,etc/users/(.*)/date.*,\1,'})
            if(! grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/hookup etc/users/$logged_user/friend) {
                if(grep -q '^'$user^'$' etc/users/$logged_user/pass) {
                    echo -n '<p><del><a href="/user/'$user'">'$user'</a> '
                    tl wants_date
                    echo -n '</del> <strong>'
                    tl passed
                    echo '</strong></p>'
                }
                if not {
                    echo -n '<p><a href="/user/'$user'">'$user'</a> '
                    tl wants_date
                    echo '</p>'
                }
            }
        for(user in `{grep '^'$logged_user^'$' etc/users/*/hookup | sed 's,etc/users/(.*)/hookup.*,\1,'})
            if(! grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/hookup etc/users/$logged_user/friend) {
                if(grep -q '^'$user^'$' etc/users/$logged_user/pass) {
                    echo -n '<p><del><a href="/user/'$user'">'$user'</a> '
                    tl wants_hookup
                    echo -n '</del> <strong>'
                    tl passed
                    echo '</strong></p>'
                }
                if not {
                    echo -n '<p><a href="/user/'$user'">'$user'</a> '
                    tl wants_hookup
                    echo '</p>'
                }
            }
        for(user in `{grep '^'$logged_user^'$' etc/users/*/friend | sed 's,etc/users/(.*)/friend.*,\1,'})
            if(! grep -q '^'$user^'$' etc/users/$logged_user/date etc/users/$logged_user/hookup etc/users/$logged_user/friend) {
                if(grep -q '^'$user^'$' etc/users/$logged_user/pass) {
                    echo -n '<p><del><a href="/user/'$user'">'$user'</a> '
                    tl wants_homie
                    echo -n '</del> <strong>'
                    tl passed
                    echo '</strong></p>'
                }
                if not {
                    echo -n '<p><a href="/user/'$user'">'$user'</a> '
                    tl wants_homie
                    echo '</p>'
                }
            }
    }

    echo -n '<h1>'
    tl future_matches
    echo '</h1>'
    for(user in `{cat etc/users/$logged_user/date})
        if(test -s etc/users/$user/password &&
           ! grep -q '^'$logged_user^'$' etc/users/$user/date etc/users/$user/hookup etc/users/$user/friend) {
            echo -n '<p>'
            tl you_want_date
            echo ' <a href="/user/'$user'">'$user'</a>.</p>'
        }
    for(user in `{cat etc/users/$logged_user/hookup})
        if(test -s etc/users/$user/password &&
           ! grep -q '^'$logged_user^'$' etc/users/$user/hookup etc/users/$user/date etc/users/$user/friend) {
            echo -n '<p>'
            tl you_want_hookup
            echo ' <a href="/user/'$user'">'$user'</a>.</p>'
        }
    for(user in `{cat etc/users/$logged_user/friend})
        if(test -s etc/users/$user/password &&
           ! grep -q '^'$logged_user^'$' etc/users/$user/friend etc/users/$user/date etc/users/$user/hookup) {
            echo -n '<p>'
            tl you_want_homie
            echo ' <a href="/user/'$user'">'$user'</a>.</p>'
        }

    echo -n '<h1>'
    tl passes
    echo '</h1>'
    echo -n '<p><em>'
    tl passes_info
    echo '</em></p>'
    for(user in `{cat etc/users/$logged_user/pass})
        if(test -s etc/users/$user/password) {
            echo -n '<p>'
            tl you_passed
            echo ' <a href="/user/'$user'">'$user'</a>.</p>'
        }
    echo -n '<form action="" method="POST"><button name="clearpasses" value="yes">'
    tl clear_passes
    echo '</button></form>'
}
if not {
    echo -n '<a href="/login?redirect=/matches" class="btn">'
    tl login
    echo '</a>'
}
%}
