{**
    * templates/frontend/pages/editorialBoard.tpl
    *
    * Copyright (c) 2014-2021 Simon Fraser University
    * Copyright (c) 2003-2021 John Willinsky
    * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
    *
    * @brief Display the page to view the editorial team.
    *
    * @uses $currentContext Journal|Press The current journal or press
    *}
{include file="frontend/components/header.tpl" pageTitle="about.editorialBoard"}

<div class="page page_editorial_team">
    {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.editorialBoard"}
    {include file="frontend/components/editLink.tpl" page="about" op="editorialBoardEdit" path="context" anchor="masthead" sectionTitleKey="about.editorialBoard"}
    <h1>
        {translate key="about.editorialBoard"}
    </h1>

    {if $users}
        <section class="section has-parallax" id="section_910520540">
            <div class="section-content-editorial-board">
                {assign var="counter" value=0}
                {foreach from=$users item=user}
                    {if $counter % 4 == 0}
                        <div class="row-editorial-board">
                        {/if}

                        <div class="col-editorial-board medium-3 small-6 large-3">
                            <div class="col-inner-editorial-board">
                                <h1 class="entry-title mb-0">
                                    Ủy viên GS.TS <br>
                                    {assign var="familyName" value=""}
                                    {assign var="givenName" value=""}

                                    {foreach from=$userSettings item=userSetting}
                                        {if $userSetting->user_id == $user->user_id}
                                            {if $userSetting->setting_name == 'familyName'}
                                                {assign var="familyName" value=$userSetting->setting_value}
                                            {/if}
                                            {if $userSetting->setting_name == 'givenName'}
                                                {assign var="givenName" value=$userSetting->setting_value}
                                            {/if}
                                        {/if}
                                    {/foreach}

                                    {if $familyName && $givenName}
                                        {$familyName|cat:' '|cat:$givenName}
                                    {/if}
                                </h1>
                            </div>
                        </div>

                        {assign var="counter" value=$counter+1}

                        {if $counter % 4 == 0 || $counter == $users|@count}
                        </div><!-- .row-editorial-board -->
                    {/if}
                {/foreach}
            </div>
        </section>
    {else}
        <p>{translate key="about.noEditorialBoard"}</p>
    {/if}
</div><!-- .page -->


{include file="frontend/components/footer.tpl"}