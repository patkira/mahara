{include file="header.tpl"}

    {if $GROUP}
        <h2>{$PAGESUBHEADING}{if $SUBPAGEHELPNAME}<span class="page-help-icon">{$PAGEHELPICON|safe}</span>{/if}</h2>
    {/if}
    <div class="row manage-collection-pages" id="collectionpages" data-collectionid="{$id}">
        <div class="col-md-12">
            <p class="lead">{str tag=collectiondragupdate1 section=collection}</p>
            <fieldset class="panel panel-default panel-half first pagelist draggable " id="pagestoadd">
                <h3 class="panel-heading">
                    {str tag=addviewstocollection section=collection}
                    {if $viewsform}
                        <span class="btn-group select-pages" role="group">
                            <a class="btn btn-xs btn-default" href="" id="selectall">{str tag=All}</a>
                            <a class="btn btn-xs btn-default" href="" id="selectnone">{str tag=none}</a>
                        </span>
                    {/if}
                </h3>
                <div class="pagesavailable">
                    {if $viewsform}
                    {$viewsform|safe}
                    {/if}
                    <div id="nopagetoadd"class="no-results lead text-small {if $viewsform} hidden{/if}">
                        {str tag=noviewsavailable section=collection}
                    </div>
                </div>
            </fieldset>
            <fieldset class="panel panel-default panel-half collection-pages droppable" id="pagesadded">
                <h3 class="panel-heading">{str tag=viewsincollection section=collection}</h3>
                {if !$views}
                    <div class="message dropzone-previews full-width">
                        <div class="dz-message">
                            {str tag=noviews section=collection}
                        </div>
                    </div>
                {else}
                <ol class="list-group" id="collectionviews">
                    {foreach from=$views.views item=view}
                        <li class="list-group-item" id="row_{$view->view}">
                            {if $views.count > 1}
                                {if $view->displayorder == $views.min}
                                    <a class="btn btn-xs text-default single-arrow-down" href="{$displayurl}&amp;view={$view->view}&amp;direction=down">
                                        <span class="icon icon-lg icon-long-arrow-down prs"></span>
                                        <span class="sr-only">{str tag=moveitemdown}</span>
                                    </a>
                                {elseif $view->displayorder == $views.max}
                                    <a class="btn btn-xs text-default single-arrow-up" href="{$displayurl}&amp;view={$view->view}&amp;direction=up">
                                        <span class="icon icon-lg icon-long-arrow-up prs"></span>
                                        <span class="sr-only">{str tag=moveitemup}</span>
                                    </a>
                                {else}
                                    <a class="btn btn-xs text-default" href="{$displayurl}&amp;view={$view->view}&amp;direction=up">
                                        <span class="icon icon-lg icon-long-arrow-up prs"></span>
                                        <span class="sr-only">{str tag=moveitemup}</span>
                                    </a>
                                    <a class="btn btn-xs text-default" href="{$displayurl}&amp;view={$view->view}&amp;direction=down">
                                        <span class="icon icon-lg icon-long-arrow-down"></span>
                                        <span class="sr-only">{str tag=moveitemdown}</span>
                                    </a>
                                {/if}
                            {/if}
                            <strong>
                                <a href="{$view->fullurl}" class="text-link">
                                    {$view->title}
                                </a>
                            </strong>
                            {$view->remove|safe}
                        </li>

                    {/foreach}
                    </ol>

                {/if}
            </fieldset>
        </div>
    </div>
    <div id="collectiondonewrap">
        <a class="btn btn-primary" href="{$baseurl}">{str tag=done}</a>
    </div>

{include file="footer.tpl"}
