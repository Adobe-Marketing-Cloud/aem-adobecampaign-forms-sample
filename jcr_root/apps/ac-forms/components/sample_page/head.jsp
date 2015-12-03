<%--
  ADOBE CONFIDENTIAL

  Copyright 2015 Adobe Systems Incorporated
  All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and may be covered by U.S. and Foreign Patents,
  patents in process, and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.
--%><%
%><%@page session="false" import="com.day.cq.commons.Doctype,
      		                      com.day.cq.wcm.api.AuthoringUIMode,
				                  com.day.cq.wcm.api.WCMMode" %>
<%@include file="/libs/foundation/global.jsp" %><%
    String xs = Doctype.isXHTML(request) ? "/" : "";
    String favIcon = currentDesign.getPath() + "/favicon.ico";
    if (resourceResolver.getResource(favIcon) == null) {
        favIcon = null;
    }
%><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"<%=xs%>>
    <meta name="keywords" content="<%= xssAPI.encodeForHTMLAttr(WCMUtils.getKeywords(currentPage, false)) %>"<%=xs%>>
    <meta name="description" content="<%= xssAPI.encodeForHTMLAttr(properties.get("jcr:description", "")) %>"<%=xs%>>
    <cq:include script="headlibs.jsp"/>
    <cq:include script="/libs/wcm/core/components/init/init.jsp"/>
    <cq:include script="stats.jsp"/>
    <% if (favIcon != null) { %>
    <link rel="icon" type="image/vnd.microsoft.icon" href="<%= xssAPI.getValidHref(favIcon) %>"<%=xs%>>
    <link rel="shortcut icon" type="image/vnd.microsoft.icon" href="<%= xssAPI.getValidHref(favIcon) %>"<%=xs%>>
    <% } %>
    <title><%= currentPage.getTitle() == null ? xssAPI.encodeForHTML(currentPage.getName()) : xssAPI.encodeForHTML(currentPage.getTitle()) %></title>

    <%-- not directly needed by the AC integration, but to avoid JS error in editor --%>
	<cq:includeClientLib categories="cq.shared"/>

	<%
        if (AuthoringUIMode.CLASSIC.equals(AuthoringUIMode.fromRequest(slingRequest))) {
            // include ClientContext and clientlib for Classic UI
            if (WCMMode.fromRequest(request) != WCMMode.DISABLED) {
                %><cq:includeClientLib categories="mcm.campaign.ui.classic"/><%
            }
            %><cq:include path="config" resourceType="cq/personalization/components/clientcontext_optimized/config"/><%
        } else {
            // include ContextHub for Touch UI %>
		    <meta id="campaignContextHub" data-register="true" />
            <sling:include path="contexthub" resourceType="granite/contexthub/components/contexthub"/><%
        }
    %>
</head>
