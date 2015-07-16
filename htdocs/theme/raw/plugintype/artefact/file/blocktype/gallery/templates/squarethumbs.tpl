<div id="thumbnails{$instanceid}" class="panel-body thumbnails ptl js-masonry">
    {foreach from=$images item=image}
        <div style="width: {$width * 1.5}px; height: {$width * 2}px" class="thumb mts mbs mrs mls ptm">
            <a rel="{$image.slimbox2}" href="{$image.link}" title="{$image.title}" target="_blank">
                <img src="{$image.source}" alt="{$image.title}" title="{$image.title}" width="{$width}" {if $frame}class="frame center-block pbm"{/if}/>
            </a>
            {if $showdescription && $image.title}
            <p class="text-small prs pls">
                {$image.title|truncate:60|safe}
            </p>
            {/if}
        </div>
    {/foreach}
</div>
{if isset($copyright)}
<div id="lbBottom">
    {$copyright|safe}
</div>
{/if}

{$comments|safe}
