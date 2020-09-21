<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

    <#--  <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,600,700&display=swap" rel="stylesheet">  -->
	<link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="${theme_class}-body pt-0" id="wrapper">
	<#if show_header>
		<header class="${theme_class}-header" id="banner" role="banner">
			<div id="heading" class="navbar navbar-classic navbar-top py-3">
				<div class="container user-personal-bar">
					<div class="align-items-center autofit-row"aria-level="1" class="site-title" role="heading">
						<a class="${logo_css_class} align-items-center d-md-inline-flex d-sm-none d-none logo-md ${theme_class}-header__link" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
							<img alt="${logo_description}" class="${theme_class}-header__link--logo mr-2" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
							<#if show_site_name>
								<h2 class="font-weight-bold h2 mb-0 ${theme_class}-header__link--text" role="heading" aria-level="1">${site_name}</h2>
							</#if>
						</a>

						<#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />
						
						<div class="autofit-col autofit-col-expand">
							<#if show_header_search>
								<div class="justify-content-md-end mr-4 navbar-form ${theme_class}-header__search" role="search">
									<@liferay.search_bar default_preferences="${preferences}" />
								</div>
							</#if>
						</div>

						<div class="autofit-col ${theme_class}-header__userbar">
							<@liferay.user_personal_bar />
						</div>
					</div>
				</div>
			</div>

			<div class="${theme_class}-navegation">
				<div class="navbar navbar-classic navbar-expand-md">
					<div class="container">
						<a class="${logo_css_class} align-items-center d-inline-flex d-md-none logo-xs" href="${site_default_url}" rel="nofollow">
							<img alt="${logo_description}" class="mr-2" height="56" src="${site_logo}" />

							<#if show_site_name>
								<h2 class="font-weight-bold h2 mb-0">${site_name}</h2>
							</#if>
						</a>

						<#include "${full_templates_path}/navigation.ftl" />
					</div>
				</div>
			</div>
		</header>
	</#if>

	<section class="${portal_content_css_class} ${theme_class}-main" id="content">
		<div class="container">
			<h2 class="sr-only hide-accessible" role="heading" aria-level="1">${the_title}</h2>

			<#if selectable>
				<@liferay_util["include"] page=content_include />
			<#else>
				${portletDisplay.recycle()}

				${portletDisplay.setTitle(the_title)}

				<@liferay_theme["wrap-portlet"] page="portlet.ftl">
					<@liferay_util["include"] page=content_include />
				</@>
			</#if>
		</div>
	</section>

	<#if show_footer>
		<footer class="${theme_class}-footer" id="footer" role="contentinfo">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center text-md-left">
						<@liferay.language key="powered-by" />

						<a class="text-white" href="http://www.liferay.com" rel="external">Liferay</a>
					</div>
				</div>
			</div>
		</footer>
	</#if>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

</body>

</html>