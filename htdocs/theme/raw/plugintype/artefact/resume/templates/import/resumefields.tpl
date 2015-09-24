{if count($resumegroup)}
<div class="section import">
    <h2>{str tag=resume section=artefact.resume}</h2>
</div>
{/if}
{foreach from=$resumegroups item=resumegroup}
{if count($resumegroup.fields)}
<fieldset id="{$resumegroup.id}_fs" class="pieform-fieldset collapsible">
    <h4>
        <legend>
            <a id="{$resumegroup.id}" class="resumegroup" href="#resumefield" data-toggle="collapse" aria-expanded="false" aria-controls="resumefield" class="collapsed">{$resumegroup.legend}</a>
            <span class="icon icon-chevron-down collapse-indicator right pull-right"></span>
        </legend>
    </h4>
    {foreach from=$resumegroup.fields key=fieldname item=fieldvalues}
        {if count(fieldvalues)}
        <div id="resumefield" class="fieldset-body collapse">
            <h5 class="resumefield">{$fieldname}</h5>
            {foreach from=$fieldvalues item=fieldvalue}
                <div id="resumefield_{$fieldvalue.id}" class="row">
                    <div class="col-md-12">
                        <div id="{$fieldvalue.id}_desc" class="detail">
                            {$fieldvalue.html|clean_html|safe}
                        </div>
                    </div>
                    <div class="col-md-8">
                        {if $fieldvalue.duplicateditem}
                        <div class="duplicatedpfield">
                            <strong>{str tag=duplicatedresumefieldvalue section=artefact.resume}:</strong>
                            <div id="{$fieldvalue.duplicateditem.id}_duplicatedpfield" class="detail">{$fieldvalue.duplicateditem.html|clean_html|safe}</div>
                        </div>
                        {/if}
                        {if $fieldvalue.existingitems}
                        <div class="existingpfields">
                            <strong>{str tag=existingresumefieldvalues section=artefact.resume}:</strong>
                               {foreach from=$fieldvalue.existingitems item=existingitem}
                               <div id="{$existingitem.id}_existingresumefield" class="detail">{$existingitem.html|clean_html|safe}</div>
                               {/foreach}
                        </div>
                        {/if}
                    </div>
                    <div class="col-md-8">
                        {foreach from=$displaydecisions key=opt item=displayopt}
                            {if !$fieldvalue.disabled[$opt]}
                            <input id="decision_{$fieldvalue.id}_{$opt}" class="fieldvaluedecision" type="radio" name="decision_{$fieldvalue.id}" value="{$opt}"{if $fieldvalue.decision == $opt} checked="checked"{/if}>
                            <label for="decision_{$fieldvalue.id}_{$opt}">{$displayopt}<span class="accessible-hidden sr-only">({$fieldname})</span></label><br>
                            {/if}
                        {/foreach}
                    </div>
                </div>
            {/foreach}
        </div>
        {/if}
    {/foreach}
</fieldset>
{/if}
{/foreach}
<script type="application/javascript">
    // jQuery(function() {
    //     jQuery("a.resumegroup").click(function(e) {
    //         e.preventDefault();
    //         jQuery("#" + this.id + "_fs").toggleClass("collapsed");
    //     });
    // });
</script>
