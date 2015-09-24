{if count($entryblogs)}
<div class="section import">
    <h2>{str tag=blog section=artefact.blog}</h2>
</div>
{foreach from=$entryblogs item=blog}
<div class="{cycle name=rows values='r0,r1'} list-group-item">
    <div id="entryblog" class="row">
        <div class="col-md-8">
            <h3 class="title list-group-item-heading">
            {if $blog.description}<a class="blogtitle" href="" id="{$blog.id}">{/if}
            {$blog.title|str_shorten_text:80:true}
            {if $blog.description}</a>{/if}
            </h3>
            <div id="{$blog.id}_desc" class="detail hidden">{$blog.description|clean_html|safe}</div>
            {if $blog.tags}
            <div class="tags">
                <strong>{str tag=tags}:</strong> {list_tags owner=0 tags=$blog.tags}
            </div>
            {/if}
            <div class="posts">
                <strong>{str tag=blogpost section=artefact.blog}:</strong> 
<!--                 <a class="showposts" href="" id="{$blog.id}">
                    {str tag=nposts section=artefact.blog arg1=count($blog.entryposts)}
                </a> -->
                {str tag=nposts section=artefact.blog arg1=count($blog.entryposts)}
            </div>
        </div>
<!--         <div class="importcolumn importcolumn2 hidden">
            {if $blog.duplicateditem}
            <div class="duplicatedblog">
                <strong>{str tag=duplicatedblog section=artefact.blog}:</strong> <a class="showduplicatedblog" href="" id="{$blog.duplicateditem.id}">{$blog.duplicateditem.title|str_shorten_text:80:true}</a>
                <div id="{$blog.duplicateditem.id}_duplicatedblog" class="detail hidden">{$blog.duplicateditem.html|clean_html|safe}</div>
            </div>
            {/if}
            {if $blog.existingitems}
            <div class="existingblogs">
                <strong>{str tag=existingblogs section=artefact.blog}:</strong>
                   {foreach from=$blog.existingitems item=existingitem}
                   <a class="showexistingblog" href="" id="{$existingitem.id}">{$existingitem.title|str_shorten_text:80:true}</a><br>
                   <div id="{$existingitem.id}_existingblog" class="detail hidden">{$existingitem.html|clean_html|safe}</div>
                   {/foreach}
            </div>
            {/if}
        </div> -->
        <div class="col-md4">
        {foreach from=$displaydecisions key=opt item=displayopt}
            {if !$blog.disabled[$opt]}
            <input id="decision_{$blog.id}_{$opt}" class="blogdecision" id="{$blog.id}" type="radio" name="decision_{$blog.id}" value="{$opt}"{if $blog.decision == $opt} checked="checked"{/if}>
            <label for="decision_{$blog.id}_{$opt}">{$displayopt}<span class="accessible-hidden sr-only">({$blog.title})</span></label><br>
            {/if}
        {/foreach}
        </div>
    </div>
    <hr>
    <div id="{$blog.id}_posts" class="list-group">
    {foreach from=$blog.entryposts item=post}
        <div id="posttitle_{$post.id}" class="{if $post.published} published{else} draft{/if}">
            <div class="row">
                <div class="col-md-8">
                    <h4 class="title list-group-item-heading">
                        {if $post.description}
                        <a class="posttitle" href="" id="{$post.id}">
                            {$post.title|str_shorten_text:80:true}
                        </a>
                        {else}
                            {$post.title|str_shorten_text:80:true}
                        {/if}
                    </h4>
                    <div id="{$post.id}_desc" class="detail hidden text-small text-lighttone">
                        {$post.description|clean_html|safe}
                    </div>
                    <span id="poststatus{$post.id}" class="poststatus text-small text-lighttone">
                        {if $post.published}
                            {str tag=published section=artefact.blog}
                        {else}
                            {str tag=draft section=artefact.blog}
                        {/if}
                    </span>
                    <p id="postdetails_{$post.id}" class="postdetails text-small text-lighttone">
                        {str tag=postedon section=artefact.blog} {$post.ctime}
                    </p>
                </div>
<!--             <div class="importcolumn importcolumn2">
                {if $post.duplicateditem}
                <div class="duplicatedpost">
                    <strong>{str tag=duplicatedpost section=artefact.blog}:</strong> <a class="showduplicatedpost" href="" id="{$post.duplicateditem.id}">{$post.duplicateditem.title|str_shorten_text:80:true}</a>
                    <div id="{$post.duplicateditem.id}_duplicatedpost" class="detail hidden">{$post.duplicateditem.html|clean_html|safe}</div>
                </div>
                {/if}
                {if $post.existingitems}
                <div class="existingposts">
                    <strong>{str tag=existingposts section=artefact.blog}:</strong>
                       {foreach from=$post.existingitems item=existingitem}
                       <a class="showexistingpost" href="" id="{$existingitem.id}">{$existingitem.title|str_shorten_text:80:true}</a><br>
                       <div id="{$existingitem.id}_existingpost" class="detail hidden">{$existingitem.html|clean_html|safe}</div>
                       {/foreach}
                </div>
                {/if}
            </div> -->
                <div class="col-md-4">
                    {foreach from=$displaydecisions key=opt item=displayopt}
                        {if !$post.disabled[$opt]}
                        <label for="decision_{$post.id}_{$opt}">
                            <input id="decision_{$post.id}_{$opt}" class="postdecision" type="radio" name="decision_{$post.id}" value="{$opt}"{if $post.decision == $opt} checked="checked"{/if}>
                            {$displayopt}
                            <span class="accessible-hidden sr-only">({$post.title})</span>
                        </label>
                        {/if}
                    {/foreach}
                </div>
            </div>
            {if $post.files}
            <div id="postfiles_{$post.id}" class="has-attachment panel panel-default collapsible mbm">
                <h5 class="panel-heading">
                    <a class="text-left pbm collapsed" data-toggle="collapse" href="#attach_{$post.id}" aria-expanded="false">
                        <span class="icon icon-lg prm icon-paperclip"></span>
                        <span class="text-small">{str tag=attachedfiles section=artefact.blog} </span>
                         <span class="metadata">
                            ({$post.files|count})
                        </span>
                        <span class="icon icon-chevron-down collapse-indicator pull-right"></span>
                    </a>
                </h5>
                <div class="collapse" id="attach_{$post.id}">
                    <ul class="list-group list-unstyled list-group-unbordered mb0">
                    {foreach from=$post.files item=file}
                        <li class="list-group-item">
                        <span class="file-title">{$file.title}</span>
                        {if $file.description}
                        <span class="detail text-small text-lighttone"> - {$file.description}</span>
                        {/if}
                        </li>
                    {/foreach}
                    </ul>
                </div>
            </div>
            {/if}
        </div>
    {/foreach}
    </div>
</div>
{/foreach}
<script type="application/javascript">
    jQuery(function() {
        jQuery("a.blogtitle").click(function(e) {
            e.preventDefault();
            jQuery("#" + this.id + "_desc").toggleClass("hidden");
        });
        jQuery("a.posttitle").click(function(e) {
            e.preventDefault();
            jQuery("#" + this.id + "_desc").toggleClass("hidden");
        });
        jQuery("a.showduplicatedblog").click(function(e) {
            e.preventDefault();
            jQuery("#" + this.id + "_duplicatedblog").toggleClass("hidden");
        });
        jQuery("a.showexistingblog").click(function(e) {
            e.preventDefault();
            jQuery("#" + this.id + "_existingblog").toggleClass("hidden");
        });
        jQuery("a.showduplicatedpost").click(function(e) {
            e.preventDefault();
            jQuery("#" + this.id + "_duplicatedpost").toggleClass("hidden");
        });
        jQuery("a.showexistingpost").click(function(e) {
            e.preventDefault();
            jQuery("#" + this.id + "_existingpost").toggleClass("hidden");
        });
        jQuery("a.showposts").click(function(e) {
            e.preventDefault();
            jQuery("#" + this.id + "_posts").toggleClass("hidden");
        });
        jQuery("a.showpostfiles").click(function(e) {
            e.preventDefault();
            jQuery("#" + this.id + "_postfiles").toggleClass("hidden");
        });
        jQuery("input.blogdecision").change(function(e) {
            e.preventDefault();
            if (this.value == '1') {
            // The import decision for the blog is IGNORE
            // Set decision for its blogposts to be IGNORE as well
                jQuery("#" + this.id + "_posts input.postdecision[value=1]").prop('checked', true);
            }
        });
    });
</script>
{/if}
