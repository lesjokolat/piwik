<div id="UserCountryMap_content" style="position:relative; overflow:hidden;">
    <div id="UserCountryMap_map">Foo</div>
    <div style="height:3px"></div>

    <div class="userCountryMap-controls">
        <select id="userCountryMapSelectMetrics" style="float:left">
            {foreach from=$metrics item=metric}
                <option value="{$metric[0]}" {if $metric[0] == $defaultMetric}selected="selected"{/if}>{$metric[1]}</option>
            {/foreach}
        </select>
        <input id="userCountryMapInsertID" style="float:left" placeholder="country code" />
    </div>
</div>

<script type="text/javascript" src=""></script>
<script type="text/javascript">
{literal}



    var fv = {};

    var params = {
        menu: "false",
        scale: "noScale",
        allowscriptaccess: "always",
        wmode: "opaque",
        bgcolor: "#FFFFFF",
        allowfullscreen: "true"

    };

{/literal}

    {* this hacks helps jquery to distingish between safari and chrome. *}
    var isSafari = (navigator.userAgent.toLowerCase().indexOf("safari") != -1 &&
            navigator.userAgent.toLowerCase().indexOf("chrome") == -1);

    fv.dataUrl = encodeURIComponent("{$dataUrl}");
    fv.hueMin = {$hueMin};
    fv.hueMax = {$hueMax};
    fv.satMin = {$satMin};
    fv.satMax = {$satMax};
    fv.lgtMin = {$lgtMin};
    fv.lgtMax = {$lgtMax};
    {* we need to add 22 pixel for safari due to wrong width calculation for the select *}
    fv.iconOffset = $('#userCountryMapSelectMetrics').width() + 22 + (isSafari ? 22 : 0);
    fv.defaultMetric = "{$defaultMetric}";

    fv.txtLoading = encodeURIComponent("{'General_Loading_js'|translate}");
    fv.txtLoadingData = encodeURIComponent("{'General_LoadingData'|translate}");
    fv.txtToggleFullscreen = encodeURIComponent("{'UserCountryMap_toggleFullscreen'|translate}");
    fv.txtExportImage = encodeURIComponent("{'General_ExportAsImage_js'|translate}");

{literal}

{/literal}

{literal}


    $("#userCountryMapSelectMetrics").change(function(el) {
        $("#UserCountryMap")[0].changeMode(el.currentTarget.value);
    });
    $("#userCountryMapSelectMetrics").keypress(function(e) {
        var keyCode = e.keyCode || e.which; 
        if (keyCode == 38 || keyCode == 40) { // if up or down key is pressed
            $(this).change(); // trigger the change event
        }
    });

    $(".userCountryMapFooterIcons a.tableIcon[var=fullscreen]").click(function() {
        $("#UserCountryMap")[0].setFullscreenMode();
    });

    $(".userCountryMapFooterIcons a.tableIcon[var=export_png]").click(function() {
        $("#UserCountryMap")[0].exportPNG();
    });

    $(window).resize(function() {
        if($('#UserCountryMap').length) {
            $("#UserCountryMap").height( Math.round($('#UserCountryMap').width() *.55) );
        }
    });
{/literal}
</script>
