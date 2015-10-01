{foreach from=$data item=result}
    <div class="list-group-item">
        <div class="row">
            <div class="col-md-8">
                <h3 class="list-group-item-heading title text-inline">
                    {if $result->artefacttype}
                    <span class="icon left pull-left icon-{$result->artefacttype}"></span>
                    {else}
                        <span class="icon left pull-left icon-{$result->type}"></span>
                    {/if}
                    <a href="{$result->url}">{$result->title}</a>
                </h3>
                <span class="tag-type text-lighttone">({$result->typestr})</span>
                <p class="mbs">{$result->ctime}</p>
                <p class="mbs">
                    {$result->description|str_shorten_html:100|strip_tags|safe}
                </p>
            </div>
            <div class="col-md-4">
                {if $result->tags}
                    <div class="tags">
                        <strong>{str tag=tags}: </strong>
                        {list_tags tags=$result->tags owner=$owner}
                    </div>
                {/if}
            </div>
        </div>
    </div>
{/foreach}