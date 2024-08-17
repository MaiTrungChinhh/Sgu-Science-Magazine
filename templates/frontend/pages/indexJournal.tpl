{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal">

	{call_hook name="Templates::Index::journal"}

	{if !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
		<div class="homepage_image">
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" {if $homepageImage.altText}
				alt="{$homepageImage.altText|escape}" {/if}>
		</div>
	{/if}

	<div class="slideshow-container">
		<div class="slide">
			<img src="/Sgu-Science-Magazine/image/journals/1/homepageImage_vi_VN.png" alt="Slide 1">
			<div class="slide-caption">
				<span>Caption for Slide 1</span>
				<a href="#">Learn More</a>
			</div>
		</div>

		<div class="slide">
			<img src="/Sgu-Science-Magazine/image/journals/1/hinh-tap-chi.png" alt="Slide 2">
			<div class="slide-caption">
				<span>Caption for Slide 2</span>
				<a href="#">Learn More</a>
			</div>
		</div>

		<div class="slide">
			<img src="https://gratisography.com/wp-content/uploads/2024/01/gratisography-reindeer-dog-1170x780.jpg"
				alt="Slide 3">
			<div class="slide-caption">
				<span>Caption for Slide 3</span>
				<a href="#">Learn More</a>
			</div>
		</div>

		<!-- Dots -->
		<div class="dots">
			<span class="dot" onclick="currentSlide(0)"></span>
			<span class="dot" onclick="currentSlide(1)"></span>
			<span class="dot" onclick="currentSlide(2)"></span>
		</div>
		<div>
			<!-- Previous and Next buttons -->
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>
		</div>
	</div>
	<link rel="stylesheet" href="/Sgu-Science-Magazine/templates/frontend/pages/slideshow/slideshow.css">
	<script src="/Sgu-Science-Magazine/templates/frontend/pages/slideshow/slideshow.js"></script>

	{* Journal Description *}
	{if $activeTheme->getOption('showDescriptionInJournalIndex')}
		<section class="homepage_about">
			<a id="homepageAbout"></a>
			<h2>{translate key="about.aboutContext"}</h2>
			{$currentContext->getLocalizedData('description')}
		</section>
	{/if}

	{* Announcements *}
	{if $numAnnouncementsHomepage && $announcements|@count}
		<section class="cmp_announcements highlight_first">
			<a id="homepageAnnouncements"></a>
			<h2>
				{translate key="announcement.announcements"}
			</h2>
			{foreach name=announcements from=$announcements item=announcement}
				{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
					{break}
				{/if}
				{if $smarty.foreach.announcements.iteration == 1}
					{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
					<div class="more">
					{else}
						<article class="obj_announcement_summary">
							<h4>
								<a
									href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
									{$announcement->getLocalizedTitle()|escape}
								</a>
							</h4>
							<div class="date">
								{$announcement->getDatePosted()|date_format:$dateFormatShort}
							</div>
						</article>
					{/if}
				{/foreach}
				<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement"}" class="archived-notifications">
					<span aria-hidden="true" role="presentation">
						{translate key="common.oldAnnouncement"}
					</span>
				</a>
			</div><!-- .more -->
		</section>
	{/if}

	{* Latest issue *}
	{if $issue}
		<section class="current_issue">
			<a id="homepageIssue"></a>
			<h2>
				{translate key="journal.currentIssue"}
			</h2>
			<div class="current_issue_title">
				{$issue->getIssueIdentification()|strip_unsafe_html}
			</div>
			{include file="frontend/objects/issue_toc.tpl" heading="h3"}
			<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="read_more">
				{translate key="journal.viewAllIssues"}
			</a>
		</section>
	{/if}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<div class="additional_content">
			{$additionalHomeContent}
		</div>
	{/if}
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}