{**
 * templates/frontend/pages/editorialBoardEdit.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to edit the editorial team.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="about.editorialBoardEdit"}

<div class="page page_editorial_team_edit">
    {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.editorialBoardEdit"}
    <h1>
        {translate key="about.editorialBoardEdit"}
    </h1>
    {$currentContext->getLocalizedData('editorialBoardEdit')}
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}