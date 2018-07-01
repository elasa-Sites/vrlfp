<h1>Edit profile</h1>

% notices_handler

% if(check_user) {
%     dir=etc/users/$logged_user

<p><a href="/user/%($logged_user%)" class="btn">Back to profile</a></p>

<form action="" method="POST">
    <input type="text" name="users_age" id="age" min="18" value="%(`{if(test -s $dir/age) cat $dir/age}%)">
    <label for="age">Age</label>

    <input type="text" name="users_location" id="location" value="%(`{if(test -s $dir/location) cat $dir/location}%)">
    <label for="location">Location</label>

    <br /><br /><h6>Contact info (shared with matches)</h6>
    <input type="text" name="users_vrc" id="vrc" value="%(`{if(test -s $dir/vrc) cat $dir/vrc}%)" style="margin-top: 0">
    <label for="vrc">VRChat</label>
    <input type="text" name="users_discord" id="discord" value="%(`{if(test -s $dir/discord) cat $dir/discord}%)">
    <label for="discord">Discord</label>
    <input type="text" name="users_sc" id="sc" value="%(`{if(test -s $dir/sc) cat $dir/sc}%)">
    <label for="sc">Snapchat</label>
    <input type="text" name="users_ig" id="ig" value="%(`{if(test -s $dir/ig) cat $dir/ig}%)">
    <label for="ig">Instagram</label>
    <input type="text" name="users_pubemail" id="pubemail" value="%(`{if(test -s $dir/pubemail) cat $dir/pubemail}%)">
    <label for="pubemail">Email (separate from your account email)</label>
    <input type="text" name="users_phone" id="phone" value="%(`{if(test -s $dir/phone) cat $dir/phone}%)">
    <label for="phone">Phone</label>

    <br /><br /><p>
        <input type="checkbox" name="users_gender_Woman" id="gender_woman" value="yes" %(`{if(test -s $dir/gender && grep -s '^Woman$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_woman">Woman</label>
        <input type="checkbox" name="users_gender_Man" id="gender_man" value="yes" %(`{if(test -s $dir/gender && grep -s '^Man$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_man">Man</label>
        <input type="checkbox" name="users_gender_Agender" id="gender_agender" value="yes" %(`{if(test -s $dir/gender && grep -s '^Agender$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_agender">Agender</label>
        <input type="checkbox" name="users_gender_Androgynous" id="gender_androgynous" value="yes" %(`{if(test -s $dir/gender && grep -s '^Androgynous$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_androgynous">Androgynous</label>
        <input type="checkbox" name="users_gender_Bigender" id="gender_bigender" value="yes" %(`{if(test -s $dir/gender && grep -s '^Bigender$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_bigender">Bigender</label>
        <input type="checkbox" name="users_gender_Cis_Man" id="gender_cis_man" value="yes" %(`{if(test -s $dir/gender && grep -s '^Cis_Man$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_cis_man">Cis Man</label>
        <input type="checkbox" name="users_gender_Cis_Woman" id="gender_cis_woman" value="yes" %(`{if(test -s $dir/gender && grep -s '^Cis_Woman$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_cis_woman">Cis Woman</label>
        <input type="checkbox" name="users_gender_Genderfluid" id="gender_genderfluid" value="yes" %(`{if(test -s $dir/gender && grep -s '^Genderfluid$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_genderfluid">Genderfluid</label>
        <input type="checkbox" name="users_gender_Genderqueer" id="gender_genderqueer" value="yes" %(`{if(test -s $dir/gender && grep -s '^Genderqueer$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_genderqueer">Genderqueer</label>
        <input type="checkbox" name="users_gender_Gender_Nonconforming" id="gender_gender_nonconforming" value="yes" %(`{if(test -s $dir/gender && grep -s '^Gender_Nonconforming$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_gender_nonconforming">Gender Nonconforming</label>
        <input type="checkbox" name="users_gender_Hijra" id="gender_hijra" value="yes" %(`{if(test -s $dir/gender && grep -s '^Hijra$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_hijra">Hijra</label>
        <input type="checkbox" name="users_gender_Intersex" id="gender_intersex" value="yes" %(`{if(test -s $dir/gender && grep -s '^Intersex$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_intersex">Intersex</label>
        <input type="checkbox" name="users_gender_Nonbinary" id="gender_non-binary" value="yes" %(`{if(test -s $dir/gender && grep -s '^Nonbinary$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_non-binary">Nonbinary</label>
        <input type="checkbox" name="users_gender_Other_Gender" id="gender_other_gender" value="yes" %(`{if(test -s $dir/gender && grep -s '^Other_Gender$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_other_gender">Other Gender</label>
        <input type="checkbox" name="users_gender_Pangender" id="gender_pangender" value="yes" %(`{if(test -s $dir/gender && grep -s '^Pangender$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_pangender">Pangender</label>
        <input type="checkbox" name="users_gender_Transfeminine" id="gender_transfeminine" value="yes" %(`{if(test -s $dir/gender && grep -s '^Transfeminine$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_transfeminine">Transfeminine</label>
        <input type="checkbox" name="users_gender_Transmasculine" id="gender_transmasculine" value="yes" %(`{if(test -s $dir/gender && grep -s '^Transmasculine$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_transmasculine">Transmasculine</label>
        <input type="checkbox" name="users_gender_Transsexual" id="gender_transsexual" value="yes" %(`{if(test -s $dir/gender && grep -s '^Transsexual$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_transsexual">Transsexual</label>
        <input type="checkbox" name="users_gender_Trans_Man" id="gender_trans_man" value="yes" %(`{if(test -s $dir/gender && grep -s '^Trans_Man$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_trans_man">Trans Man</label>
        <input type="checkbox" name="users_gender_Trans_Woman" id="gender_trans_woman" value="yes" %(`{if(test -s $dir/gender && grep -s '^Trans_Woman$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_trans_woman">Trans Woman</label>
        <input type="checkbox" name="users_gender_Two_Spirit" id="gender_two_spirit" value="yes" %(`{if(test -s $dir/gender && grep -s '^Two_Spirit$' $dir/gender) echo 'checked="yes"'}%)>
        <label for="gender_two_spirit">Two Spirit</label>
        <br /><label>Gender</label>
    </p>
    <p>
        <input type="checkbox" name="users_lookingfor_Looking_For_Date___VR_Only" id="datevr" value="yes" %(`{if(test -s $dir/lookingfor && grep -s '^Looking_For_Date___VR_Only$' $dir/lookingfor) echo 'checked="yes"'}%)>
        <label for="datevr">Looking For Date - VR Only</label>
        <input type="checkbox" name="users_lookingfor_Looking_For_Hookup___VR_Only" id="hookupvr" value="yes" %(`{if(test -s $dir/lookingfor && grep -s '^Looking_For_Hookup___VR_Only$' $dir/lookingfor) echo 'checked="yes"'}%)>
        <label for="hookupvr">Looking For Hookup - VR Only</label>
        <input type="checkbox" name="users_lookingfor_Looking_For_Date___VR_and_IRL" id="dateirl" value="yes" %(`{if(test -s $dir/lookingfor && grep -s '^Looking_For_Date___VR_and_IRL$' $dir/lookingfor) echo 'checked="yes"'}%)>
        <label for="dateirl">Looking For Date - VR and IRL</label>
        <input type="checkbox" name="users_lookingfor_Looking_For_Hookup___VR_and_IRL" id="hookupirl" value="yes" %(`{if(test -s $dir/lookingfor && grep -s '^Looking_For_Hookup___VR_and_IRL$' $dir/lookingfor) echo 'checked="yes"'}%)>
        <label for="hookupirl">Looking For Hookup - VR and IRL</label>
        <input type="checkbox" name="users_lookingfor_Looking_For_Serious_Relationship" id="serious" value="yes" %(`{if(test -s $dir/lookingfor && grep -s '^Looking_For_Serious_Relationship$' $dir/lookingfor) echo 'checked="yes"'}%)>
        <label for="serious">Looking For Serious Relationship</label>
        <input type="checkbox" name="users_lookingfor_Just_Roleplaying" id="roleplaying" value="yes" %(`{if(test -s $dir/lookingfor && grep -s '^Just_Roleplaying$' $dir/lookingfor) echo 'checked="yes"'}%)>
        <label for="roleplaying">Just Roleplaying</label>
        <br /><label>What are you looking for?</label>
    </p>
    <p>
        <input type="checkbox" name="users_status_Single" id="Single" value="yes" %(`{if(test -s $dir/status && grep -s '^Single$' $dir/status) echo 'checked="yes"'}%)>
        <label for="Single">Single</label>
        <input type="checkbox" name="users_status_Seeing_Someone" id="Seeing_Someone" value="yes" %(`{if(test -s $dir/status && grep -s '^Seeing_Someone$' $dir/status) echo 'checked="yes"'}%)>
        <label for="Seeing_Someone">Seeing Someone</label>
        <input type="checkbox" name="users_status_Married" id="Married" value="yes" %(`{if(test -s $dir/status && grep -s '^Married$' $dir/status) echo 'checked="yes"'}%)>
        <label for="Married">Married</label>
        <br /><label>Relationship Status</label>

    </p>
    <p>
        <input type="checkbox" name="users_type_Monogamous" id="Monogamous" value="yes" %(`{if(test -s $dir/type && grep -s '^Monogamous$' $dir/type) echo 'checked="yes"'}%)>
        <label for="Monogamous">Monogamous</label>
        <input type="checkbox" name="users_type_Polygamous" id="Polygamous" value="yes" %(`{if(test -s $dir/type && grep -s '^Polygamous$' $dir/type) echo 'checked="yes"'}%)>
        <label for="Polygamous">Polygamous</label>
        <br /><label>Relationship Type</label>
    </p>
    <p>
        <input type="checkbox" name="users_sexuality_Straight___VR" id="Straight___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Straight___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Straight___VR">Straight - VR</label>
        <input type="checkbox" name="users_sexuality_Gay___VR" id="Gay___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Gay___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Gay___VR">Gay - VR</label>
        <input type="checkbox" name="users_sexuality_Bisexual___VR" id="Bisexual___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Bisexual___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Bisexual___VR">Bisexual - VR</label>
        <input type="checkbox" name="users_sexuality_Asexual___VR" id="Asexual___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Asexual___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Asexual___VR">Asexual - VR</label>
        <input type="checkbox" name="users_sexuality_Demisexual___VR" id="Demisexual___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Demisexual___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Demisexual___VR">Demisexual - VR</label>
        <input type="checkbox" name="users_sexuality_Heteroflexible___VR" id="Heteroflexible___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Heteroflexible___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Heteroflexible___VR">Heteroflexible - VR</label>
        <input type="checkbox" name="users_sexuality_Homoflexible___VR" id="Homoflexible___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Homoflexible___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Homoflexible___VR">Homoflexible - VR</label>
        <input type="checkbox" name="users_sexuality_Lesbian___VR" id="Lesbian___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Lesbian___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Lesbian___VR">Lesbian - VR</label>
        <input type="checkbox" name="users_sexuality_Pansexual___VR" id="Pansexual___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Pansexual___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Pansexual___VR">Pansexual - VR</label>
        <input type="checkbox" name="users_sexuality_Queer___VR" id="Queer___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Queer___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Queer___VR">Queer - VR</label>
        <input type="checkbox" name="users_sexuality_Questioning___VR" id="Questioning___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Questioning___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Questioning___VR">Questioning - VR</label>
        <input type="checkbox" name="users_sexuality_Sapiosexual___VR" id="Sapiosexual___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Sapiosexual___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Sapiosexual___VR">Sapiosexual - VR</label>
        <input type="checkbox" name="users_sexuality_Trapsexual___VR" id="Trapsexual___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Trapsexual___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Trapsexual___VR">Trapsexual - VR</label>
        <input type="checkbox" name="users_sexuality_Trapsexual___VR_Mutes_Only" id="Trapsexual___VR_Mutes_Only" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Trapsexual___VR_Mutes_Only$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Trapsexual___VR_Mutes_Only">Trapsexual - VR Mutes Only</label>
        <input type="checkbox" name="users_sexuality_Heteroromantic___VR" id="Heteroromantic___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Heteroromantic___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Heteroromantic___VR">Heteroromantic - VR</label>
        <input type="checkbox" name="users_sexuality_Homoromantic___VR" id="Homoromantic___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Homoromantic___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Homoromantic___VR">Homoromantic - VR</label>
        <input type="checkbox" name="users_sexuality_Biromantic___VR" id="Biromantic___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Biromantic___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Biromantic___VR">Biromantic - VR</label>
        <input type="checkbox" name="users_sexuality_Aromantic___VR" id="Aromantic___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Aromantic___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Aromantic___VR">Aromantic - VR</label>
        <input type="checkbox" name="users_sexuality_Demiromantic___VR" id="Demiromantic___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Demiromantic___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Demiromantic___VR">Demiromantic - VR</label>
        <input type="checkbox" name="users_sexuality_Panromantic___VR" id="Panromantic___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Panromantic___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Panromantic___VR">Panromantic - VR</label>
        <input type="checkbox" name="users_sexuality_Sapioromantic___VR" id="Sapioromantic___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Sapioromantic___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Sapioromantic___VR">Sapioromantic - VR</label>
        <input type="checkbox" name="users_sexuality_Trapromantic___VR" id="Trapromantic___VR" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Trapromantic___VR$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Trapromantic___VR">Trapromantic - VR</label>
        <input type="checkbox" name="users_sexuality_Trapromantic___VR_Mutes_Only" id="Trapromantic___VR_Mutes_Only" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Trapromantic___VR_Mutes_Only$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Trapromantic___VR_Mutes_Only">Trapromantic - VR Mutes Only</label>
        <input type="checkbox" name="users_sexuality_Straight___IRL" id="Straight___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Straight___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Straight___IRL">Straight - IRL</label>
        <input type="checkbox" name="users_sexuality_Gay___IRL" id="Gay___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Gay___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Gay___IRL">Gay - IRL</label>
        <input type="checkbox" name="users_sexuality_Bisexual___IRL" id="Bisexual___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Bisexual___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Bisexual___IRL">Bisexual - IRL</label>
        <input type="checkbox" name="users_sexuality_Asexual___IRL" id="Asexual___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Asexual___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Asexual___IRL">Asexual - IRL</label>
        <input type="checkbox" name="users_sexuality_Demisexual___IRL" id="Demisexual___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Demisexual___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Demisexual___IRL">Demisexual - IRL</label>
        <input type="checkbox" name="users_sexuality_Heteroflexible___IRL" id="Heteroflexible___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Heteroflexible___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Heteroflexible___IRL">Heteroflexible - IRL</label>
        <input type="checkbox" name="users_sexuality_Homoflexible___IRL" id="Homoflexible___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Homoflexible___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Homoflexible___IRL">Homoflexible - IRL</label>
        <input type="checkbox" name="users_sexuality_Lesbian___IRL" id="Lesbian___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Lesbian___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Lesbian___IRL">Lesbian - IRL</label>
        <input type="checkbox" name="users_sexuality_Pansexual___IRL" id="Pansexual___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Pansexual___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Pansexual___IRL">Pansexual - IRL</label>
        <input type="checkbox" name="users_sexuality_Queer___IRL" id="Queer___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Queer___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Queer___IRL">Queer - IRL</label>
        <input type="checkbox" name="users_sexuality_Questioning___IRL" id="Questioning___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Questioning___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Questioning___IRL">Questioning - IRL</label>
        <input type="checkbox" name="users_sexuality_Sapiosexual___IRL" id="Sapiosexual___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Sapiosexual___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Sapiosexual___IRL">Sapiosexual - IRL</label>
        <input type="checkbox" name="users_sexuality_Trapsexual___IRL" id="Trapsexual___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Trapsexual___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Trapsexual___IRL">Trapsexual - IRL</label>
        <input type="checkbox" name="users_sexuality_Heteroromantic___IRL" id="Heteroromantic___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Heteroromantic___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Heteroromantic___IRL">Heteroromantic - IRL</label>
        <input type="checkbox" name="users_sexuality_Homoromantic___IRL" id="Homoromantic___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Homoromantic___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Homoromantic___IRL">Homoromantic - IRL</label>
        <input type="checkbox" name="users_sexuality_Biromantic___IRL" id="Biromantic___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Biromantic___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Biromantic___IRL">Biromantic - IRL</label>
        <input type="checkbox" name="users_sexuality_Aromantic___IRL" id="Aromantic___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Aromantic___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Aromantic___IRL">Aromantic - IRL</label>
        <input type="checkbox" name="users_sexuality_Demiromantic___IRL" id="Demiromantic___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Demiromantic___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Demiromantic___IRL">Demiromantic - IRL</label>
        <input type="checkbox" name="users_sexuality_Panromantic___IRL" id="Panromantic___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Panromantic___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Panromantic___IRL">Panromantic - IRL</label>
        <input type="checkbox" name="users_sexuality_Sapioromantic___IRL" id="Sapioromantic___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Sapioromantic___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Sapioromantic___IRL">Sapioromantic - IRL</label>
        <input type="checkbox" name="users_sexuality_Trapromantic___IRL" id="Trapromantic___IRL" value="yes" %(`{if(test -s $dir/sexuality && grep -s '^Trapromantic___IRL$' $dir/sexuality) echo 'checked="yes"'}%)>
        <label for="Trapromantic___IRL">Trapromantic - IRL</label>
        <br/><label>Sexuality</label>
    </p>
    <p>
        <input type="checkbox" name="users_role_Submissive" id="Submissive" value="yes" %(`{if(test -s $dir/role && grep -s '^Submissive$' $dir/role) echo 'checked="yes"'}%)>
        <label for="Submissive">Submissive</label>
        <input type="checkbox" name="users_role_Dominant" id="Dominant" value="yes" %(`{if(test -s $dir/role && grep -s '^Dominant$' $dir/role) echo 'checked="yes"'}%)>
        <label for="Dominant">Dominant</label>
        <input type="checkbox" name="users_role_Switch" id="Switch" value="yes" %(`{if(test -s $dir/role && grep -s '^Switch$' $dir/role) echo 'checked="yes"'}%)>
        <label for="Switch">Switch</label>
        <br /><label>Role</label>
    </p>
    <p>
        <input type="checkbox" name="users_kinks_Ageplayer" id="Ageplayer" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Ageplayer$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Ageplayer">Ageplayer</label>
        <input type="checkbox" name="users_kinks_Boy_or_Girl" id="Boy_or_Girl" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Boy_or_Girl$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Boy_or_Girl">Boy or Girl</label>
        <input type="checkbox" name="users_kinks_Daddy_or_Mommy" id="Daddy_or_Mommy" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Daddy_or_Mommy$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Daddy_or_Mommy">Daddy or Mommy</label>
        <input type="checkbox" name="users_kinks_Brat" id="Brat" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Brat$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Brat">Brat</label>
        <input type="checkbox" name="users_kinks_Brat_Tamer" id="Brat_Tamer" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Brat_Tamer$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Brat_Tamer">Brat Tamer</label>
        <input type="checkbox" name="users_kinks_Degradee" id="Degradee" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Degradee$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Degradee">Degradee</label>
        <input type="checkbox" name="users_kinks_Degrader" id="Degrader" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Degrader$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Degrader">Degrader</label>
        <input type="checkbox" name="users_kinks_Exhibitionist" id="Exhibitionist" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Exhibitionist$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Exhibitionist">Exhibitionist</label>
        <input type="checkbox" name="users_kinks_Experimentalist" id="Experimentalist" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Experimentalist$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Experimentalist">Experimentalist</label>
        <input type="checkbox" name="users_kinks_Masochist" id="Masochist" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Masochist$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Masochist">Masochist</label>
        <input type="checkbox" name="users_kinks_Sadist" id="Sadist" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Sadist$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Sadist">Sadist</label>
        <input type="checkbox" name="users_kinks_Master_or_Mistress" id="Master_or_Mistress" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Master_or_Mistress$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Master_or_Mistress">Master or Mistress</label>
        <input type="checkbox" name="users_kinks_Slave" id="Slave" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Slave$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Slave">Slave</label>
        <input type="checkbox" name="users_kinks_Owner" id="Owner" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Owner$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Owner">Owner</label>
        <input type="checkbox" name="users_kinks_Pet" id="Pet" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Pet$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Pet">Pet</label>
        <input type="checkbox" name="users_kinks_Hunter" id="Hunter" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Hunter$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Hunter">Hunter</label>
        <input type="checkbox" name="users_kinks_Prey" id="Prey" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Prey$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Prey">Prey</label>
        <input type="checkbox" name="users_kinks_Rigger" id="Rigger" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Rigger$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Rigger">Rigger</label>
        <input type="checkbox" name="users_kinks_Rope_Bunny" id="Rope_Bunny" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Rope_Bunny$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Rope_Bunny">Rope Bunny</label>
        <input type="checkbox" name="users_kinks_Voyeur" id="Voyeur" value="yes" %(`{if(test -s $dir/kinks && grep -s '^Voyeur$' $dir/kinks) echo 'checked="yes"'}%)>
        <label for="Voyeur">Voyeur</label>
        <br /><label>Kinks</label>
    </p>
    <p>
        <input type="checkbox" name="users_games_VRChat" id="VRChat" value="yes" %(`{if(test -s $dir/games && grep -s '^VRChat$' $dir/games) echo 'checked="yes"'}%)>
        <label for="VRChat">VRChat</label>
        <input type="checkbox" name="users_games_Rec_Room" id="Rec_Room" value="yes" %(`{if(test -s $dir/games && grep -s '^Rec_Room$' $dir/games) echo 'checked="yes"'}%)>
        <label for="Rec_Room">Rec Room</label>
        <input type="checkbox" name="users_games_AltspaceVR" id="AltspaceVR" value="yes" %(`{if(test -s $dir/games && grep -s '^AltspaceVR$' $dir/games) echo 'checked="yes"'}%)>
        <label for="AltspaceVR">AltspaceVR</label>
        <input type="checkbox" name="users_games_vTime" id="vTime" value="yes" %(`{if(test -s $dir/games && grep -s '^vTime$' $dir/games) echo 'checked="yes"'}%)>
        <label for="vTime">vTime</label>
        <input type="checkbox" name="users_games_Sansar" id="Sansar" value="yes" %(`{if(test -s $dir/games && grep -s '^Sansar$' $dir/games) echo 'checked="yes"'}%)>
        <label for="Sansar">Sansar</label>
        <input type="checkbox" name="users_games_High_Fidelity" id="High_Fidelity" value="yes" %(`{if(test -s $dir/games && grep -s '^High_Fidelity$' $dir/games) echo 'checked="yes"'}%)>
        <label for="High_Fidelity">High Fidelity</label>
        <input type="checkbox" name="users_games_TheWaveVR" id="TheWaveVR" value="yes" %(`{if(test -s $dir/games && grep -s '^TheWaveVR$' $dir/games) echo 'checked="yes"'}%)>
        <label for="TheWaveVR">TheWaveVR</label>
        <input type="checkbox" name="users_games_Facebook_Spaces" id="Facebook_Spaces" value="yes" %(`{if(test -s $dir/games && grep -s '^Facebook_Spaces$' $dir/games) echo 'checked="yes"'}%)>
        <label for="Facebook_Spaces">Facebook Spaces</label>
        <br /><label>Games</label>
    </p>
    <p>
        <input type="checkbox" name="users_vr_Mobile_VR" id="Mobile_VR" value="yes" %(`{if(test -s $dir/vr && grep -s '^Mobile_VR$' $dir/vr) echo 'checked="yes"'}%)>
        <label for="Mobile_VR">Mobile VR</label>
        <input type="checkbox" name="users_vr_Standing_VR" id="Standing_VR" value="yes" %(`{if(test -s $dir/vr && grep -s '^Standing_VR$' $dir/vr) echo 'checked="yes"'}%)>
        <label for="Standing_VR">Standing VR</label>
        <input type="checkbox" name="users_vr_360_VR" id="360_VR" value="yes" %(`{if(test -s $dir/vr && grep -s '^360_VR$' $dir/vr) echo 'checked="yes"'}%)>
        <label for="360_VR">360 VR</label>
        <input type="checkbox" name="users_vr_Roomscale_VR" id="Roomscale_VR" value="yes" %(`{if(test -s $dir/vr && grep -s '^Roomscale_VR$' $dir/vr) echo 'checked="yes"'}%)>
        <label for="Roomscale_VR">Roomscale VR</label>
        <input type="checkbox" name="users_vr_Full_Body_VR" id="Full_Body_VR" value="yes" %(`{if(test -s $dir/vr && grep -s '^Full_Body_VR$' $dir/vr) echo 'checked="yes"'}%)>
        <label for="Full_Body_VR">Full Body VR</label>
        <br /><label>What kind of VR do you have?</label>
    </p>

% echo -n '    <textarea name="users_bio" id="bio">'
% if(test -s $dir/bio) escape_html < $dir/bio
</textarea>
    <label for="bio">Bio (you can use <a href="https://daringfireball.net/projects/markdown/syntax" target="_blank">Markdown syntax</a> here)</label>

    <p><button type="submit" name="users_submit" value="yes">Submit</button></p><br />
</form>

<!--
<form action="" method="POST">
    <h5>Upload pictures</h5>
    <input type="file" name="pictures" multiple accept="image/*">
    <p><button type="submit" name="users_submit_pictures" value="yes">Submit</button></p><br />
</form>

<form action="" method="POST">
    <h5>Change your email address</h5>
    <input type="email" name="users_email" id="email" value="%(`{cat $dir/email}%)">
    <label for="email">E-mail</label>

    <input type="password" name="users_pass" id="pass">
    <label for="pass">Confirm password</label>

    <p><button type="submit" name="users_submit_email" value="yes">Submit</button></p><br />
</form>

<form action="" method="POST">
    <h5>Reset your password</h5>
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
-->
% }
% if not {
    <p><a href="/login" class="btn">Login</a></p>
% }
