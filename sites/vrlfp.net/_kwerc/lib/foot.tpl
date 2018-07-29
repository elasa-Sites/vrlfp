% if(check_user && ! check_user premium) {
<iframe id="ad-left" class="desktop" src="//ads.exosrv.com/iframe.php?idzone=3073956&size=160x600" width="160" height="600" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
<iframe id="ad-right" class="desktop" src="//ads.exosrv.com/iframe.php?idzone=3073958&size=160x600" width="160" height="600" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
<div class="mobile center" style="margin-top: 20px"><iframe src="//ads.exosrv.com/iframe.php?idzone=3074060&size=300x250" width="300" height="250" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe></div>
% }
</main>

<footer id="footer">
    <div class="center">
        <a href="/discord" target="_blank">Discord</a>
        <a href="https://twitter.com/vrlfp" target="_blank">Twitter</a>
        <a href="https://www.instagram.com/vrlfp/" target="_blank">Instagram</a><br />
        <a href="/about">About Us</a>
        <a href="/terms">Terms of Service</a>
        <a href="/privacy">Privacy Policy</a>
        <a href="https://code.kfarwell.org/vrlfp/" target="_blank">Code</a>
        <a href="/sitemap">Sitemap</a><br />
        <a href="mailto:story@vrlfp.net">Submit a Success Story</a>
        <a href="mailto:press@vrlfp.net">Press</a>
        <a href="mailto:support@vrlfp.net">Support</a>
    </div>
    <div>
        <div class="desktop">
            Made with ❤ in cyberspace
            <span class="right">© 2018 %($siteTitle%), Inc.</span>
        </div>
        <div class="mobile center">
            <span>© 2018 %($siteTitle%), Inc.</span>
        </div>
    </div>
</footer>

% if(check_user && ! check_user premium) {
<script type="text/javascript">
    var adleft = document.querySelector('#ad-left');
    var adright = document.querySelector('#ad-right');
    var footer = document.querySelector('#footer');

    function checkOffset() {
        function getRectTop(el){
            var rect = el.getBoundingClientRect();
            return rect.top;
        }
  
        if((getRectTop(adleft) + document.body.scrollTop) + adleft.offsetHeight >= (getRectTop(footer) + document.body.scrollTop) - 10) {
            adleft.style.position= 'absolute';
            adleft.style.top = 'initial';
            adleft.style.bottom = 'initial';
            adleft.style.left = '20px';
            adleft.style.transform = 'translateY(-100%)';
        }
        if(document.body.scrollTop + window.innerHeight < (getRectTop(footer) + document.body.scrollTop)) {
            adleft.style.position= 'fixed';
            adleft.style.top = '84px';
            adleft.style.bottom = 'initial';
            adleft.style.left = '20px';
            adleft.style.transform = 'initial';
        }
  
        adleft.innerHTML = document.body.scrollTop + window.innerHeight;

        if((getRectTop(adright) + document.body.scrollTop) + adright.offsetHeight >= (getRectTop(footer) + document.body.scrollTop) - 10) {
            adright.style.position= 'absolute';
            adright.style.top = 'initial';
            adright.style.right = '20px';
            adright.style.bottom = 'initial';
            adright.style.transform = 'translateY(-100%)';
        }
        if(document.body.scrollTop + window.innerHeight < (getRectTop(footer) + document.body.scrollTop)) {
            adright.style.position = 'fixed';
            adright.style.top = '84px';
            adright.style.right = '20px';
            adright.style.bottom = 'initial';
            adright.style.transform = 'initial';
        }
  
        adright.innerHTML = document.body.scrollTop + window.innerHeight;
    }

    document.addEventListener("scroll", function(){
        checkOffset();
    });
</script>
% }
