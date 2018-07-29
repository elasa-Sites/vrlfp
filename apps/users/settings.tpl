<h1>Manage Account</h1>

% notices_handler

% if(check_user) {
%     dir=etc/users/$logged_user
%     if(test -f $dir/premium) premium=yes
%     if not premium=no

<p><a href="/user/%($logged_user%)" class="btn">Back to profile</a></p><br />

<form action="" method="POST">
    <h5>Profile filtering (basic)</h5>
    <p>
        <input type="checkbox" name="users_fltr_lookingfor_Looking_For_Date" id="date" value="yes" %(`{if(test -s $dir/fltr/lookingfor && grep -s '^Looking_For_Date$' $dir/fltr/lookingfor) echo 'checked="yes"'}%)>
        <label for="date">Looking For Date</label>
        <input type="checkbox" name="users_fltr_lookingfor_Looking_For_Hookup" id="hookup" value="yes" %(`{if(test -s $dir/fltr/lookingfor && grep -s '^Looking_For_Hookup$' $dir/fltr/lookingfor) echo 'checked="yes"'}%)>
        <label for="hookup">Looking For Hookup</label>
        <input type="checkbox" name="users_fltr_lookingfor_Looking_For_Homie" id="friend" value="yes" %(`{if(test -s $dir/fltr/lookingfor && grep -s '^Looking_For_Homie$' $dir/fltr/lookingfor) echo 'checked="yes"'}%)>
        <label for="friend">Looking For Homie</label>
        <input type="checkbox" name="users_fltr_lookingfor_Roleplaying" id="roleplaying" value="yes" %(`{if(test -s $dir/fltr/lookingfor && grep -s '^Roleplaying$' $dir/fltr/lookingfor) echo 'checked="yes"'}%)>
        <label for="roleplaying">Roleplaying</label>
        <br /><label>What are they looking for?</label>
    </p>
    <p>
        <input type="checkbox" name="users_fltr_gender_Woman" id="gender_woman" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Woman$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_woman">Woman</label>
        <input type="checkbox" name="users_fltr_gender_Man" id="gender_man" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Man$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_man">Man</label>
        <input type="checkbox" name="users_fltr_gender_Agender" id="gender_agender" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Agender$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_agender">Agender</label>
        <input type="checkbox" name="users_fltr_gender_Androgynous" id="gender_androgynous" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Androgynous$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_androgynous">Androgynous</label>
        <input type="checkbox" name="users_fltr_gender_Bigender" id="gender_bigender" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Bigender$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_bigender">Bigender</label>
        <input type="checkbox" name="users_fltr_gender_Cis_Man" id="gender_cis_man" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Cis_Man$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_cis_man">Cis Man</label>
        <input type="checkbox" name="users_fltr_gender_Cis_Woman" id="gender_cis_woman" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Cis_Woman$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_cis_woman">Cis Woman</label>
        <input type="checkbox" name="users_fltr_gender_Genderfluid" id="gender_genderfluid" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Genderfluid$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_genderfluid">Genderfluid</label>
        <input type="checkbox" name="users_fltr_gender_Genderqueer" id="gender_genderqueer" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Genderqueer$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_genderqueer">Genderqueer</label>
        <input type="checkbox" name="users_fltr_gender_Gender_Nonconforming" id="gender_gender_nonconforming" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Gender_Nonconforming$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_gender_nonconforming">Gender Nonconforming</label>
        <input type="checkbox" name="users_fltr_gender_Hijra" id="gender_hijra" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Hijra$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_hijra">Hijra</label>
        <input type="checkbox" name="users_fltr_gender_Intersex" id="gender_intersex" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Intersex$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_intersex">Intersex</label>
        <input type="checkbox" name="users_fltr_gender_Nonbinary" id="gender_nonbinary" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Nonbinary$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_nonbinary">Nonbinary</label>
        <input type="checkbox" name="users_fltr_gender_Other_Gender" id="gender_other_gender" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Other_Gender$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_other_gender">Other Gender</label>
        <input type="checkbox" name="users_fltr_gender_Pangender" id="gender_pangender" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Pangender$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_pangender">Pangender</label>
        <input type="checkbox" name="users_fltr_gender_Transfeminine" id="gender_transfeminine" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Transfeminine$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_transfeminine">Transfeminine</label>
        <input type="checkbox" name="users_fltr_gender_Transmasculine" id="gender_transmasculine" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Transmasculine$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_transmasculine">Transmasculine</label>
        <input type="checkbox" name="users_fltr_gender_Transsexual" id="gender_transsexual" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Transsexual$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_transsexual">Transsexual</label>
        <input type="checkbox" name="users_fltr_gender_Trans_Man" id="gender_trans_man" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Trans_Man$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_trans_man">Trans Man</label>
        <input type="checkbox" name="users_fltr_gender_Trans_Woman" id="gender_trans_woman" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Trans_Woman$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_trans_woman">Trans Woman</label>
        <input type="checkbox" name="users_fltr_gender_Two_Spirit" id="gender_two_spirit" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^Two_Spirit$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_two_spirit">Two Spirit</label>
        <input type="checkbox" name="users_fltr_gender_VR_Trap" id="gender_vr_trap" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^VR_Trap$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_vr_trap">VR Trap</label>
        <input type="checkbox" name="users_fltr_gender_IRL_Trap" id="gender_irl_trap" value="yes" %(`{if(test -s $dir/fltr/gender && grep -s '^IRL_Trap$' $dir/fltr/gender) echo 'checked="yes"'}%)>
        <label for="gender_irl_trap">IRL Trap</label>
        <br /><label>Gender</label>
    </p>
    <p><button type="submit" name="users_submit_filters" value="yes">Submit</button></p><br />
</form>

<form action="" method="POST">
    <fieldset style="border: none" %(`{if(~ $premium no) echo 'disabled'}%)>
        <h5>Profile filtering (advanced)</h5>
% if(~ $premium no) echo '<p>You need <a href="/premium">VRLFP Premium</a> to modify your advanced profile filters.</p>'
        <input type="text" name="users_fltr_minage" id="minage" value="%(`{if(test -s $dir/fltr/minage) cat $dir/fltr/minage}%)">
        <label for="minage">Minimum age</label>

        <input type="text" name="users_fltr_maxage" id="maxage" value="%(`{if(test -s $dir/fltr/maxage) cat $dir/fltr/maxage}%)">
        <label for="maxage">Maximum age</label>

        <br /><br /><p>
            <input type="checkbox" name="users_fltr_mute_Not_Mute" id="mute_not_mute" value="yes" %(`{if(test -s $dir/fltr/mute && grep -s '^Not_Mute$' $dir/fltr/mute) echo 'checked="yes"'}%)>
            <label for="mute_mute">Not Mute</label>
            <input type="checkbox" name="users_fltr_mute_Selective_Mute" id="mute_selective_mute" value="yes" %(`{if(test -s $dir/fltr/mute && grep -s '^Selective_Mute$' $dir/fltr/mute) echo 'checked="yes"'}%)>
            <label for="mute_selective_mute">Selective Mute</label>
            <input type="checkbox" name="users_fltr_mute_Mute" id="mute_mute" value="yes" %(`{if(test -s $dir/fltr/mute && grep -s '^Mute$' $dir/fltr/mute) echo 'checked="yes"'}%)>
            <label for="mute_mute">Mute</label>
            <br /><label>Do they speak in VR?</label>
        </p>
        <p>
            <input type="checkbox" name="users_fltr_status_Single" id="Single" value="yes" %(`{if(test -s $dir/fltr/status && grep -s '^Single$' $dir/fltr/status) echo 'checked="yes"'}%)>
            <label for="Single">Single</label>
            <input type="checkbox" name="users_fltr_status_Seeing_Someone" id="Seeing_Someone" value="yes" %(`{if(test -s $dir/fltr/status && grep -s '^Seeing_Someone$' $dir/fltr/status) echo 'checked="yes"'}%)>
            <label for="Seeing_Someone">Seeing Someone</label>
            <input type="checkbox" name="users_fltr_status_Married" id="Married" value="yes" %(`{if(test -s $dir/fltr/status && grep -s '^Married$' $dir/fltr/status) echo 'checked="yes"'}%)>
            <label for="Married">Married</label>
            <br /><label>Relationship Status</label>
        </p>
        <p>
            <input type="checkbox" name="users_fltr_type_Monogamous" id="Monogamous" value="yes" %(`{if(test -s $dir/fltr/type && grep -s '^Monogamous$' $dir/fltr/type) echo 'checked="yes"'}%)>
            <label for="Monogamous">Monogamous</label>
            <input type="checkbox" name="users_fltr_type_Polygamous" id="Polygamous" value="yes" %(`{if(test -s $dir/fltr/type && grep -s '^Polygamous$' $dir/fltr/type) echo 'checked="yes"'}%)>
            <label for="Polygamous">Polygamous</label>
            <br /><label>Relationship Type</label>
        </p>
        <p>
            <input type="checkbox" name="users_fltr_sexuality_Straight___VR" id="Straight___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Straight___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Straight___VR">Straight - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Gay___VR" id="Gay___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Gay___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Gay___VR">Gay - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Bisexual___VR" id="Bisexual___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Bisexual___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Bisexual___VR">Bisexual - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Asexual___VR" id="Asexual___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Asexual___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Asexual___VR">Asexual - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Demisexual___VR" id="Demisexual___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Demisexual___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Demisexual___VR">Demisexual - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Heteroflexible___VR" id="Heteroflexible___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Heteroflexible___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Heteroflexible___VR">Heteroflexible - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Homoflexible___VR" id="Homoflexible___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Homoflexible___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Homoflexible___VR">Homoflexible - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Lesbian___VR" id="Lesbian___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Lesbian___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Lesbian___VR">Lesbian - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Pansexual___VR" id="Pansexual___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Pansexual___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Pansexual___VR">Pansexual - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Queer___VR" id="Queer___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Queer___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Queer___VR">Queer - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Questioning___VR" id="Questioning___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Questioning___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Questioning___VR">Questioning - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Sapiosexual___VR" id="Sapiosexual___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Sapiosexual___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Sapiosexual___VR">Sapiosexual - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Trapsexual___VR" id="Trapsexual___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Trapsexual___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Trapsexual___VR">Trapsexual - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Trapsexual___VR_Mutes_Only" id="Trapsexual___VR_Mutes_Only" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Trapsexual___VR_Mutes_Only$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Trapsexual___VR_Mutes_Only">Trapsexual - VR Mutes Only</label>
            <input type="checkbox" name="users_fltr_sexuality_Heteroromantic___VR" id="Heteroromantic___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Heteroromantic___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Heteroromantic___VR">Heteroromantic - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Homoromantic___VR" id="Homoromantic___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Homoromantic___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Homoromantic___VR">Homoromantic - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Biromantic___VR" id="Biromantic___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Biromantic___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Biromantic___VR">Biromantic - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Aromantic___VR" id="Aromantic___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Aromantic___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Aromantic___VR">Aromantic - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Demiromantic___VR" id="Demiromantic___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Demiromantic___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Demiromantic___VR">Demiromantic - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Panromantic___VR" id="Panromantic___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Panromantic___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Panromantic___VR">Panromantic - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Sapioromantic___VR" id="Sapioromantic___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Sapioromantic___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Sapioromantic___VR">Sapioromantic - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Trapromantic___VR" id="Trapromantic___VR" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Trapromantic___VR$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Trapromantic___VR">Trapromantic - VR</label>
            <input type="checkbox" name="users_fltr_sexuality_Trapromantic___VR_Mutes_Only" id="Trapromantic___VR_Mutes_Only" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Trapromantic___VR_Mutes_Only$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Trapromantic___VR_Mutes_Only">Trapromantic - VR Mutes Only</label>
            <input type="checkbox" name="users_fltr_sexuality_Straight___IRL" id="Straight___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Straight___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Straight___IRL">Straight - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Gay___IRL" id="Gay___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Gay___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Gay___IRL">Gay - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Bisexual___IRL" id="Bisexual___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Bisexual___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Bisexual___IRL">Bisexual - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Asexual___IRL" id="Asexual___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Asexual___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Asexual___IRL">Asexual - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Demisexual___IRL" id="Demisexual___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Demisexual___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Demisexual___IRL">Demisexual - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Heteroflexible___IRL" id="Heteroflexible___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Heteroflexible___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Heteroflexible___IRL">Heteroflexible - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Homoflexible___IRL" id="Homoflexible___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Homoflexible___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Homoflexible___IRL">Homoflexible - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Lesbian___IRL" id="Lesbian___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Lesbian___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Lesbian___IRL">Lesbian - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Pansexual___IRL" id="Pansexual___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Pansexual___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Pansexual___IRL">Pansexual - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Queer___IRL" id="Queer___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Queer___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Queer___IRL">Queer - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Questioning___IRL" id="Questioning___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Questioning___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Questioning___IRL">Questioning - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Sapiosexual___IRL" id="Sapiosexual___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Sapiosexual___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Sapiosexual___IRL">Sapiosexual - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Trapsexual___IRL" id="Trapsexual___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Trapsexual___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Trapsexual___IRL">Trapsexual - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Heteroromantic___IRL" id="Heteroromantic___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Heteroromantic___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Heteroromantic___IRL">Heteroromantic - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Homoromantic___IRL" id="Homoromantic___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Homoromantic___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Homoromantic___IRL">Homoromantic - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Biromantic___IRL" id="Biromantic___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Biromantic___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Biromantic___IRL">Biromantic - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Aromantic___IRL" id="Aromantic___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Aromantic___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Aromantic___IRL">Aromantic - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Demiromantic___IRL" id="Demiromantic___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Demiromantic___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Demiromantic___IRL">Demiromantic - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Panromantic___IRL" id="Panromantic___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Panromantic___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Panromantic___IRL">Panromantic - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Sapioromantic___IRL" id="Sapioromantic___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Sapioromantic___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Sapioromantic___IRL">Sapioromantic - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Trapromantic___IRL" id="Trapromantic___IRL" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Trapromantic___IRL$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Trapromantic___IRL">Trapromantic - IRL</label>
            <input type="checkbox" name="users_fltr_sexuality_Homieromantic" id="Homieromantic" value="yes" %(`{if(test -s $dir/fltr/sexuality && grep -s '^Homieromantic$' $dir/fltr/sexuality) echo 'checked="yes"'}%)>
            <label for="Homieromantic">Homieromantic</label>
            <br/><label>Sexuality</label>
        </p>
        <p>
            <input type="checkbox" name="users_fltr_role_Submissive" id="Submissive" value="yes" %(`{if(test -s $dir/fltr/role && grep -s '^Submissive$' $dir/fltr/role) echo 'checked="yes"'}%)>
            <label for="Submissive">Submissive</label>
            <input type="checkbox" name="users_fltr_role_Dominant" id="Dominant" value="yes" %(`{if(test -s $dir/fltr/role && grep -s '^Dominant$' $dir/fltr/role) echo 'checked="yes"'}%)>
            <label for="Dominant">Dominant</label>
            <input type="checkbox" name="users_fltr_role_Switch" id="Switch" value="yes" %(`{if(test -s $dir/fltr/role && grep -s '^Switch$' $dir/fltr/role) echo 'checked="yes"'}%)>
            <label for="Switch">Switch</label>
            <br /><label>Role</label>
        </p>
        <p>
            <input type="checkbox" name="users_fltr_kinks_Ageplayer" id="Ageplayer" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Ageplayer$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Ageplayer">Ageplayer</label>
            <input type="checkbox" name="users_fltr_kinks_Boy_or_Girl" id="Boy_or_Girl" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Boy_or_Girl$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Boy_or_Girl">Boy or Girl</label>
            <input type="checkbox" name="users_fltr_kinks_Daddy_or_Mommy" id="Daddy_or_Mommy" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Daddy_or_Mommy$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Daddy_or_Mommy">Daddy or Mommy</label> <input type="checkbox" name="users_fltr_kinks_Brat" id="Brat" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Brat$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Brat">Brat</label>
            <input type="checkbox" name="users_fltr_kinks_Brat_Tamer" id="Brat_Tamer" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Brat_Tamer$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Brat_Tamer">Brat Tamer</label>
            <input type="checkbox" name="users_fltr_kinks_Degradee" id="Degradee" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Degradee$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Degradee">Degradee</label>
            <input type="checkbox" name="users_fltr_kinks_Degrader" id="Degrader" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Degrader$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Degrader">Degrader</label>
            <input type="checkbox" name="users_fltr_kinks_Exhibitionist" id="Exhibitionist" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Exhibitionist$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Exhibitionist">Exhibitionist</label>
            <input type="checkbox" name="users_fltr_kinks_Experimentalist" id="Experimentalist" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Experimentalist$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Experimentalist">Experimentalist</label>
            <input type="checkbox" name="users_fltr_kinks_Masochist" id="Masochist" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Masochist$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Masochist">Masochist</label>
            <input type="checkbox" name="users_fltr_kinks_Sadist" id="Sadist" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Sadist$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Sadist">Sadist</label>
            <input type="checkbox" name="users_fltr_kinks_Master_or_Mistress" id="Master_or_Mistress" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Master_or_Mistress$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Master_or_Mistress">Master or Mistress</label>
            <input type="checkbox" name="users_fltr_kinks_Slave" id="Slave" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Slave$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Slave">Slave</label>
            <input type="checkbox" name="users_fltr_kinks_Owner" id="Owner" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Owner$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Owner">Owner</label>
            <input type="checkbox" name="users_fltr_kinks_Pet" id="Pet" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Pet$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Pet">Pet</label>
            <input type="checkbox" name="users_fltr_kinks_Hunter" id="Hunter" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Hunter$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Hunter">Hunter</label>
            <input type="checkbox" name="users_fltr_kinks_Prey" id="Prey" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Prey$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Prey">Prey</label>
            <input type="checkbox" name="users_fltr_kinks_Rigger" id="Rigger" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Rigger$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Rigger">Rigger</label>
            <input type="checkbox" name="users_fltr_kinks_Rope_Bunny" id="Rope_Bunny" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Rope_Bunny$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Rope_Bunny">Rope Bunny</label>
            <input type="checkbox" name="users_fltr_kinks_Voyeur" id="Voyeur" value="yes" %(`{if(test -s $dir/fltr/kinks && grep -s '^Voyeur$' $dir/fltr/kinks) echo 'checked="yes"'}%)>
            <label for="Voyeur">Voyeur</label>
            <br /><label>Kinks</label>
        </p>
        <p>
            <input type="checkbox" name="users_fltr_games_VRChat" id="VRChat" value="yes" %(`{if(test -s $dir/fltr/games && grep -s '^VRChat$' $dir/fltr/games) echo 'checked="yes"'}%)>
            <label for="VRChat">VRChat</label>
            <input type="checkbox" name="users_fltr_games_Rec_Room" id="Rec_Room" value="yes" %(`{if(test -s $dir/fltr/games && grep -s '^Rec_Room$' $dir/fltr/games) echo 'checked="yes"'}%)>
            <label for="Rec_Room">Rec Room</label>
            <input type="checkbox" name="users_fltr_games_AltspaceVR" id="AltspaceVR" value="yes" %(`{if(test -s $dir/fltr/games && grep -s '^AltspaceVR$' $dir/fltr/games) echo 'checked="yes"'}%)>
            <label for="AltspaceVR">AltspaceVR</label>
            <input type="checkbox" name="users_fltr_games_vTime" id="vTime" value="yes" %(`{if(test -s $dir/fltr/games && grep -s '^vTime$' $dir/fltr/games) echo 'checked="yes"'}%)>
            <label for="vTime">vTime</label>
            <input type="checkbox" name="users_fltr_games_Sansar" id="Sansar" value="yes" %(`{if(test -s $dir/fltr/games && grep -s '^Sansar$' $dir/fltr/games) echo 'checked="yes"'}%)>
            <label for="Sansar">Sansar</label>
            <input type="checkbox" name="users_fltr_games_High_Fidelity" id="High_Fidelity" value="yes" %(`{if(test -s $dir/fltr/games && grep -s '^High_Fidelity$' $dir/fltr/games) echo 'checked="yes"'}%)>
            <label for="High_Fidelity">High Fidelity</label>
            <input type="checkbox" name="users_fltr_games_TheWaveVR" id="TheWaveVR" value="yes" %(`{if(test -s $dir/fltr/games && grep -s '^TheWaveVR$' $dir/fltr/games) echo 'checked="yes"'}%)>
            <label for="TheWaveVR">TheWaveVR</label>
            <input type="checkbox" name="users_fltr_games_Facebook_Spaces" id="Facebook_Spaces" value="yes" %(`{if(test -s $dir/fltr/games && grep -s '^Facebook_Spaces$' $dir/fltr/games) echo 'checked="yes"'}%)>
            <label for="Facebook_Spaces">Facebook Spaces</label>
            <br /><label>Games</label>
        </p>
        <p>
            <input type="checkbox" name="users_fltr_vr_No_VR" id="No_VR" value="yes" %(`{if(test -s $dir/fltr/vr && grep -s '^No_VR$' $dir/fltr/vr) echo 'checked="yes"'}%)>
            <label for="No_VR">No VR</label>
            <input type="checkbox" name="users_fltr_vr_Mobile_VR" id="Mobile_VR" value="yes" %(`{if(test -s $dir/fltr/vr && grep -s '^Mobile_VR$' $dir/fltr/vr) echo 'checked="yes"'}%)>
            <label for="Mobile_VR">Mobile VR</label>
            <input type="checkbox" name="users_fltr_vr_Standing_VR" id="Standing_VR" value="yes" %(`{if(test -s $dir/fltr/vr && grep -s '^Standing_VR$' $dir/fltr/vr) echo 'checked="yes"'}%)>
            <label for="Standing_VR">Standing VR</label>
            <input type="checkbox" name="users_fltr_vr_360_VR" id="360_VR" value="yes" %(`{if(test -s $dir/fltr/vr && grep -s '^360_VR$' $dir/fltr/vr) echo 'checked="yes"'}%)>
            <label for="360_VR">360 VR</label>
            <input type="checkbox" name="users_fltr_vr_Roomscale_VR" id="Roomscale_VR" value="yes" %(`{if(test -s $dir/fltr/vr && grep -s '^Roomscale_VR$' $dir/fltr/vr) echo 'checked="yes"'}%)>
            <label for="Roomscale_VR">Roomscale VR</label>
            <input type="checkbox" name="users_fltr_vr_Full_Body_VR" id="Full_Body_VR" value="yes" %(`{if(test -s $dir/fltr/vr && grep -s '^Full_Body_VR$' $dir/fltr/vr) echo 'checked="yes"'}%)>
            <label for="Full_Body_VR">Full Body VR</label>
            <br /><label>What kind of VR do they have?</label>
        </p>

        <p><button type="submit" name="users_submit_filters_advanced" value="yes">Submit</button></p><br />
    </fieldset>
</form>

<form action="" method="POST">
    <h5>Settings</h5>
    <p>
        <input type="checkbox" name="users_nsfw" id="nsfw" value="yes" %(`{if(test -f $dir/nsfw) echo 'checked="yes"'}%)>
        <label for="nsfw">Show NSFW profile images?</label>
    </p>

    <p><button type="submit" name="users_submit_settings" value="yes">Submit</button></p><br />
</form>

<form action="" method="POST">
    <h5>Change your email address</h5>
    <input type="email" name="users_email" id="email" value="%(`{escape_html < $dir/email}%)">
    <label for="email">E-mail</label>

    <input type="password" name="users_pass" id="pass">
    <label for="pass">Confirm password</label>

    <p><button type="submit" name="users_submit_email" value="yes">Submit</button></p><br />
</form>

<form action="" method="POST">
    <h5>Change your password</h5>
    <input type="password" name="users_passold" id="passold">
    <label for="pass">Current password</label>

    <input type="password" name="users_pass" id="pass1">
    <label for="pass1">New password</label>

    <input type="password" name="users_pass2" id="pass2">
    <label for="pass2">Repeat new password</label>

    <p><button type="submit" name="users_submit_password" value="yes">Submit</button></p><br />
</form>

<form action="" method="POST">
    <h5>Delete your account</h5>
    <p>Be careful! This is permanent.</p>
    <input type="password" name="users_pass" id="pass3">
    <label for="pass3">Confirm password</label>

    <p><button type="submit" name="users_submit_delete" value="yes">Delete</button></p><br />
</form>
% }
% if not {
    <p><a href="/login?redirect=/settings" class="btn">Login</a></p>
% }
