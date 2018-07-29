<h1>Authorize Discord</h1>

% notices_handler

% if(! check_user) {
<p>Log in to let kotoribot sync your VRLFP.net profile information (gender, sexuality, etc.) with your VRLFP Discord roles.</p>

<a href="/login?redirect=%($req_path%)" class="btn">Login</a>

<br />Don't have an account yet?<br />
<a href="/register" class="btn">Register</a>
% }
