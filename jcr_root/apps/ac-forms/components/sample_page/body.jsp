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
%><%@page session="false" import="com.day.cq.wcm.api.AuthoringUIMode"%>
<%@ include file="/libs/foundation/global.jsp" %>
<body>
    <%
        if (AuthoringUIMode.CLASSIC.equals(AuthoringUIMode.fromRequest(slingRequest))) {
            %><cq:include path="clientcontext" resourceType="cq/personalization/components/clientcontext_optimized" /><%
        }
    %>
    <div class="ac-forms-container">
		<cq:include path="par" resourceType="foundation/components/parsys"/>
    </div>
    <cq:include path="cloudservices" resourceType="cq/cloudserviceconfigs/components/servicecomponents"/>
</body>