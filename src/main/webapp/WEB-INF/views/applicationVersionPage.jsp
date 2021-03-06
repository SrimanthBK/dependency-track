<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<spring:message code="label.dependency.add" var="addDependencyLabel"/>
<spring:message code="label.clone" var="cloneLabel"/>
<spring:message code="label.edit" var="editLabel"/>

<jsp:include page="/WEB-INF/views/templates/page.jsp">
    <jsp:param name="title" value="${applicationVersion.application.name} - ${applicationVersion.version}"/>

             <jsp:param name="buttons" value='<div class="btn-group">
             <a id="addDependencyModalButton" href="#addDependencyModal" role="button" class="btn" data-toggle="modal">${addDependencyLabel}</a>
             <a id="cloneVersionModalButton" href="#cloneVersionModal" role="button" class="open-CloneApplicationVersionModal btn" data-toggle="modal" data-id="${applicationVersion.application.id}" data-version="${applicationVersion.version}">${cloneLabel}</a>
             <a id="editDependencyModalButton" href="#editDependencyModal" class="open-EditDependencyModal btn" role="button" class="btn" data-id="${applicationVersion.id}" data-ver="${applicationVersion.version}" data-toggle="modal">${editLabel}</a>
             </div>'/>

    <jsp:param name="content" value="applicationVersion"/>
</jsp:include>