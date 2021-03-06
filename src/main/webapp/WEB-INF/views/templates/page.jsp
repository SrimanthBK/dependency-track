<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  ~ This file is part of Dependency-Track.
  ~
  ~ Dependency-Track is free software: you can redistribute it and/or modify it
  ~ under the terms of the GNU General Public License as published by the Free
  ~ Software Foundation, either version 3 of the License, or (at your option) any
  ~ later version.
  ~
  ~ Dependency-Track is distributed in the hope that it will be useful, but
  ~ WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  ~ FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
  ~ details.
  ~
  ~ You should have received a copy of the GNU General Public License along with
  ~ Dependency-Track. If not, see http://www.gnu.org/licenses/.
  ~
  ~ Copyright (c) Axway. All Rights Reserved.
  --%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title><c:out value="${properties.longname}: ${param.title}"/></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="copyright" content="Copyright Axway. All rights reserved."/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="<c:url value="/resources/favicon.ico"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" media="screen"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/tablesorter/style.css"/>"/>
    <script type="text/javascript" src="<c:url value="/resources/jquery-1.10.2.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/jquery.chained.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/tablesorter/jquery.tablesorter.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/functions.js"/>"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/templates/header.jsp"/>

<div class="navbar navbar-static-top">
    <div class="navbar-inner">
        <ul class="nav">
            <li class="<c:if test="${param.content!='applications'}">in</c:if>active">
                <a href="<c:url value="/applications"/>"><spring:message code="label.applications"/></a>
            </li>
            <li class="<c:if test="${param.content!='libraries'}">in</c:if>active">
                <a href="<c:url value="/libraries"/>"><spring:message code="label.libraries"/></a>
            </li>
            <li>
                <a data-toggle="modal" class="open-SearchApplicationModal" href="#searchApplicationModal"><spring:message code="label.search"/></a>
            </li>
        </ul>
        <ul class="nav pull-right">
            <li class="<c:if test="${param.content!='about'}">in</c:if>active">
                <a href="<c:url value="/about"/>"><spring:message code="label.about"/></a>
            </li>
            <li class="divider-vertical"></li>
            <li class="inactive"><a href="<c:url value="/logout"/>"><spring:message code="label.logout"/></a></li>
        </ul>
    </div>
</div>

<jsp:include page="/WEB-INF/views/templates/container.jsp"/>

<jsp:include page="/WEB-INF/views/templates/footer.jsp"/>

<div id="searchApplicationModal" class="modal hide fade" tabindex="-1" role="dialog"
     aria-labelledby="searchApplicationModal" aria-hidden="true">
    <div class="modal-header">
        <h4 id="searchApplicationModalLabel"><spring:message code="label.applications.search"/></h4>
    </div>

    <c:url value="/searchApplication" var="searchApplicationUrl"/>
    <form:form id="searchApplicationForm" style="margin-bottom:0"
               action="${searchApplicationUrl}" method="post" autocomplete="off">
        <div class="modal-body">
            <table>
                <tr>
                    <td><label for="serappven"><spring:message code="label.library.vendor"/></label></td>
                    <td><select id="serappven" name="serappven" autofocus="autofocus" required="required">
                        <option value="">--</option>
                    </select></td>
                </tr>
                <tr>
                    <td><label for="serapplib"><spring:message code="label.library.name"/></label></td>
                    <td><select id="serapplib" name="serapplib" autofocus="autofocus" required="required">
                        <option value="">--</option>
                    </select></td>
                </tr>
                <tr>
                    <td><label for="serapplibver"><spring:message code="label.library.version"/></label></td>
                    <td><select id="serapplibver" name="serapplibver" autofocus="autofocus">
                        <option value="">--</option>
                    </select></td>
                </tr>
            </table>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true"><spring:message code="label.close"/></button>
            <button class="modalSubmit btn btn-primary"><spring:message code="label.search"/></button>
        </div>
    </form:form>
</div>
</body>
</html>